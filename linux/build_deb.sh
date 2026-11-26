#!/bin/bash
# Builds the DEB package following the Lab 11 steps.
set -e
cd "$(dirname "$0")"
SRC="$PWD"
OUT="$SRC/../packages"
WORK="$HOME/lab11_deb"   # build in the Linux filesystem (NTFS perms are 777)
rm -rf "$WORK" && mkdir -p "$WORK" && cp helloworld.c README.md user_guide.txt "$WORK"/
cd "$WORK"
gcc -o helloworld helloworld.c
rm -rf myapp
mkdir -p myapp/DEBIAN
mkdir -p myapp/usr/local/bin
mkdir -p myapp/usr/share/doc/helloworld
cp helloworld myapp/usr/local/bin/
cp README.md myapp/usr/share/doc/helloworld/
cp user_guide.txt myapp/usr/share/doc/helloworld/
chmod 644 myapp/usr/share/doc/helloworld/*
cat <<CTRL > myapp/DEBIAN/control
Package: helloworld
Version: 1.0
Section: base
Priority: optional
Architecture: amd64
Maintainer: Majd Aboul Hosn <majd.ahosn@gmail.com>
Description: A simple Hello World application
 Prints "Hello, World from Majd_AboulHosn!" (EECE 435L Lab 11).
CTRL
cp myapp/DEBIAN/control "$SRC/../metadata/control"
cp helloworld "$SRC/"
fakeroot dpkg -b myapp "$OUT"/helloworld_majd_aboulhosn.deb
dpkg-deb -I "$OUT"/helloworld_majd_aboulhosn.deb
dpkg-deb -c "$OUT"/helloworld_majd_aboulhosn.deb
