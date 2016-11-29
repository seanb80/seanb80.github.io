#! /bin/bash

mkdir /Users/Shared/bioinformatics

cd /Users/Shared/bioinformatics

# Trinity v2.3.2
wget https://github.com/trinityrnaseq/trinityrnaseq/archive/Trinity-v2.3.2.zip --no-check-certificate
unzip Trinity-v2.3.2.zip
rm Trinity-v2.3.2.zip

#Bismark V0.15.0
wget http://www.bioinformatics.babraham.ac.uk/projects/bismark/bismark_v0.15.0.tar.gz
unzip bismark_v0.15.0.tar.gz
rm bismark_v0.15.0.tar.gz

# Fastqc V 0.11.5
wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip
unzip fastqc_v0.11.5.zip
rm fastqc_v0.11.5.zip
cd /Users/Shared/bioinformatics/FastQC
chmod +x fastqc
cd /Users/Shared/bioinformatics

# Trimmomatic V0.36
wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip
unzip Trimmomatic-0.36.zip
rm Trimmomatic-0.36.zip

# Trinotate V 3.0.1
wget https://github.com/Trinotate/Trinotate/archive/v3.0.1.zip --no-check-certificate
unzip v3.0.1.zip
rm v3.0.1.zip

#Bedtools 2.26.0
wget https://github.com/arq5x/bedtools2/releases/download/v2.26.0/bedtools-2.26.0.tar.gz --no-check-certificate
gunzip bedtools-2.26.0.tar.gz
tar -xf bedtools-2.26.0.tar
cd bedtools2
make
cd /Users/Shared/bioinformatics
rm bedtools-2.26.0.tar

# Bowtie 1 V 1.1.2
wget https://sourceforge.net/projects/bowtie-bio/files/bowtie/1.1.2/bowtie-1.1.2-macos-x86_64.zip --no-check-certificate
unzip bowtie-1.1.2-macos-x86_64.zip
rm bowtie-1.1.2-macos-x86_64.zip

# Bowtie 2 V2.2.9
wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.9/bowtie2-2.2.9-macos-x86_64.zip --no-check-certificate
unzip bowtie2-2.2.9-macos-x86_64.zip
rm bowtie2-2.2.9-macos-x86_64.zip

# Cufflinks v2.2.1
wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.OSX_x86_64.tar.gz --no-check-certificate
tar -xvzf cufflinks-2.2.1.OSX_x86_64.tar.gz
rm cufflinks-2.2.1.OSX_x86_64.tar.gz

# Hmmer v3.1b2
wget http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-macosx-intel.tar.gz
tar -xvzf hmmer-3.1b2-macosx-intel.tar.gz
cd hmmer-3.1b2-macosx-intel
./configure
make
make check
cd ..

# RSEM V1.3.0
wget https://github.com/deweylab/RSEM/archive/v1.3.0.tar.gz
tar -xvzf v1.3.0.tar.gz
rm v1.3.0.tar.gz

# Stacks V 1.44
wget http://catchenlab.life.illinois.edu/stacks/source/stacks-1.44.tar.gz
tar -xvzf stacks-1.44.tar.gz
cd stacks-1.44
./configure
make
make check




