# Hello World (Linux) - Majd Aboul Hosn

A minimal C program that prints `Hello, World from Majd_AboulHosn!`.

## Compile and run
```bash
gcc -o helloworld helloworld.c
./helloworld
```

## Build the DEB package (Debian/Ubuntu, works in WSL)
```bash
sudo apt install gcc dpkg-dev
./build_deb.sh            # produces ../packages/helloworld_majd_aboulhosn.deb
sudo dpkg -i ../packages/helloworld_majd_aboulhosn.deb
helloworld
dpkg -l | grep helloworld
```

## Build the RPM package (optional, needs rpm-build)
```bash
./build_rpm.sh            # produces ../packages/helloworld_majd_aboulhosn-1.0-1.x86_64.rpm
```
