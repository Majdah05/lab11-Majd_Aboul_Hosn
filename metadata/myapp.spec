Name:           helloworld
Version:        1.0
Release:        1
Summary:        A simple Hello World application
License:        GPL
Source0:        %{name}-%{version}.tar.gz

%description
A simple Hello World application that prints
"Hello, World from Majd_AboulHosn!" (EECE 435L Lab 11).

%global debug_package %{nil}

%prep
%setup -q

%build
gcc -o helloworld helloworld.c

%install
mkdir -p %{buildroot}/usr/local/bin
mkdir -p %{buildroot}/usr/share/doc/helloworld
cp -a helloworld %{buildroot}/usr/local/bin/
cp -a README.md %{buildroot}/usr/share/doc/helloworld/
cp -a user_guide.txt %{buildroot}/usr/share/doc/helloworld/

%files
/usr/local/bin/helloworld
/usr/share/doc/helloworld/README.md
/usr/share/doc/helloworld/user_guide.txt

%changelog
* Thu Nov 26 2026 Majd Aboul Hosn <majd.ahosn@gmail.com> 1.0-1
- Initial package
