So I've been trying to get a new program, Methyl Extract, to work. It takes .sam files from Bismark or BSMap and does both methylation calling as well as SNP calling, which will be useful downstream for calculating relatedness of our samples.

The instructions seemed fairly clear, with Methyl Extract just being a perl script ran from the command line, but I've gotten some odd results/lack of results making me think that there's either an issue with the program, or how I call it.

My call in R looks like this:

![img1](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/methylextract1.png?raw=true)

which is derived from the manual's example SNP and Methylation call, with the addition of the flagW and flagC parameters, which indicate that we're using paired end reads as well as optional output in .wig and .bed formats (wigOut and bedOut arguments).

![img2](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/methylextract_manual_ex.png?raw=true)

Initially, everything seemed to go well, with methylation and snp calling by scaffold working

![img3](https://github.com/seanb80/seanb80.github.io/blob/master/images/methylextract/methylextract2.png?raw=true)

but later on in the run, it started failing to find 
