Since we've installed Linux on Emu, I've been familiarizing myself with life on a Linux system slowly. Today's adventure was in installing packages for R, specifically MethylKit.

Normally on an OS X based system, ```install.packages("package name")``` just works, you don't need to worry about fortran compilers, XML libraries, or other random things. Not so much on Linux. To install MethylKit, and it's required dependencies, on Emu, it required external downloads of the following libraries via ```sudo apt-get install```. 

| Package          | Purpose                          |
|------------------|----------------------------------|
| gfortran         | Fortran Compiler                 |
| libssl-dev       | Implements SSL and TLS protocols |
| liblapack-dev    | Linear algebra routines          |
| liblapack3       | Linear algebra routines          |
| libopenblas-base | More linear algebra routines     |
| libopenblas-dev  | More linear algebra routines     |
| libxml2-dev      | Parses XML documents             |

I've also begun working on a pipeline script that should bring a set of files through Bismark and MethylKit with little user interaction beyond supplying file names and some directory locations.
