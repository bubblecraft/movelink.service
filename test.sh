#!/bin/sh

set -e

rm -fr test
mkdir -p test/sources/a
mkdir -p test/target
mkdir -p test/etc
mkdir -p test/bin

echo bb > test/sources/b
echo aa > test/sources/a/file


echo "target=/target" > test/etc/movelink.service.conf
echo "sources=/sources/a,/sources/b" >> test/etc/movelink.service.conf


ROOT=$(realpath test) ./src/bin/movelink

if [ ! -L test/sources/a ]; then
  echo "ERROR Directory link a does not exist"
  exit 1
fi
if [ ! -d test/target/sources/a ]; then
  echo "ERROR Moved directory a does not exist"
  exit 1
fi

if [ ! -f test/sources/a/file ]; then
  echo "ERROR File inside directory link a link does not exist"
  exit 1
fi
if [ ! -f test/target/sources/a/file ]; then
  echo "ERROR Moved file inside directory link a link does not exist"
  exit 1
fi

if [ ! -L test/sources/b ]; then
  echo "ERROR Link file b does not exist"
  exit 1
fi

if [ ! -f test/target/sources/b ]; then
  echo "ERROR Moved file b does not exist"
  exit 1
fi

echo "target=/target" > test/etc/movelink.service.conf
echo "sources=/sources/c" >> test/etc/movelink.service.conf

echo cc > test/sources/c
echo CC > test/target/sources/c
ROOT=$(realpath test) ./src/bin/movelink

if [ "`cat test/sources/c`" != "cc" ]; then
  echo "ERROR Content of source c was changed"
  exit 1
fi

if [ "`cat test/target/sources/c`" != "CC" ]; then
  echo "ERROR Content of target c was changed"
  exit 1
fi