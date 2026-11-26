#!/bin/bash
# Builds the RPM package (Part 4, optional) with rpmbuild.
set -e
cd "$(dirname "$0")"
mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
rm -rf /tmp/helloworld-1.0 && mkdir -p /tmp/helloworld-1.0
cp helloworld.c README.md user_guide.txt /tmp/helloworld-1.0/
tar -czf ~/rpmbuild/SOURCES/helloworld-1.0.tar.gz -C /tmp helloworld-1.0
cp myapp.spec ~/rpmbuild/SPECS/myapp.spec
rpmbuild -ba ~/rpmbuild/SPECS/myapp.spec
cp ~/rpmbuild/RPMS/x86_64/helloworld-1.0-1.x86_64.rpm ../packages/helloworld_majd_aboulhosn-1.0-1.x86_64.rpm
cp myapp.spec ../metadata/myapp.spec
rpm -qip ../packages/helloworld_majd_aboulhosn-1.0-1.x86_64.rpm
rpm -qlp ../packages/helloworld_majd_aboulhosn-1.0-1.x86_64.rpm
