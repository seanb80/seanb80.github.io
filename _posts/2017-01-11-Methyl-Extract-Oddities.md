* So I've been trying to get a new program, Methyl Extract, to work. It takes .sam files from Bismark or BSMap and does both methylation calling as well as SNP calling, which will be useful downstream for calculating relatedness of our samples.

The instructions seemed fairly clear, with Methyl Extract just being a perl script ran from the command line, but I've gotten some odd results/lack of results making me think that there's either an issue with the program, or how I call it.

* My call in R looks like this:

![img1](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/methylextract1.png?raw=true)

which is derived from the manual's example SNP and Methylation call, with the addition of the flagW and flagC parameters, which indicate that we're using paired end reads as well as optional output in .wig and .bed formats (wigOut and bedOut arguments).

![img2](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/methylextract_manual_ex.png?raw=true)

* Initially, everything seemed to go well, with methylation and snp calling by scaffold working

![img3](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/methylextract2.png?raw=true)

* Later on in the run, it started failing to find scaffolds with an engrish level error message that is difficult to understand what is actaully failing.

![img4](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/methylextract3.png?raw=true)

* It still, however outputs files. Lots of files. About 60,000 in this particular run.

![img5](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/methylextract4.png?raw=true)

* These are split in to two main groups both of which have no headers The first are the CG files (of which there are three types, .wig, .bed, and .output) which are the results of methylation calls. According to the manual, the headers would be:
1. Scaffold
2. Position
3. Context 
4. # Watson Methylcytosines 
5. Watson Coverage 
6. Avg Watson PHRED score 
7. # Crick Methylcytosines 
8. Crick Coverage
9. Avg Crick PHRED score

![img6](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/methylextract_methyl_output.png?raw=true)

* 

Secondly, there are the SNP calls.

![img7](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/methylextract_SNP_output.png?raw=true)

* These are supposed to follow a .vcf format, with the vcf file headers shown here in an example. Note it's also missing any tag for sample the SNP came from, which likely makes the file in it's current state useless for analysis. 

![img8](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/vcfspecs.png?raw=true)

