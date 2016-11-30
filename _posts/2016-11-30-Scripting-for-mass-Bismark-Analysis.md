After figuring out the sort issue with running Bismark on OS X, I whipped up a little script to run through the files on Emu. 

The script below, written in R creates a set of file names and directory structure and concatenates a text string equivilant to the shell command to run each step. Then it uses the system() command to talk to the shell and run the different bismark commands. The code is a little ugly, and every CS instructor/grader ever likely cringes at the length of the system() commands, but adding carriage returns to break them up for readability introduces new line breaks ("/n") into the string, breaking the function of the command, so long commands it is!

It was tested by replacing system() with print(), just to make sure the string output looks correct, then started on Emu to run overnight. Apparently overnight was not long enough, as I found it was only through the 11th sample. 

Bioinformatics is for the patient apparently. 


```
# Labels for individual files to be operated on
olyLabels <- paste0("zr1394_", 1:18)

# name of the reference genome file
genome.name <- "Ostrea_lurida-Scaff-10k.fa"

# Path to the Bismark executables
bisPath <- "~/Documents/Bismark/"

# Path to the output directory (This will be in addition to the Bismark executable path)
outPath <- "BismarkData/BismarkOutput/"

# Runs the genome preparation portion
system(paste0(bisPath, "bismark_genome_preparation", " ", bisPath, "BismarkData/"))

# Loops over each sample file, running the Bismark aligner, outputs to a unique directory
for(i in 1:length(olyLabels))   {
  
  system(paste0(bisPath, "bismark --genome ", bisPath, "BismarkData/", olyLabels[i], ".fastq.gz --output_dir ", bisPath, outPath, olyLabels[i]))
  
}

# Runs the bismark methylation extractor, again iterating over all sample file names
for(i in 1:length(olyLabels))   {
  
  system(paste0(bisPath, "bismark_methylation_extractor -s --scaffolds --merge_non_CpG --bedGraph --zero_based ", bisPath, outPath, olyLabels[i], "_bismark_bt2.bam ","--output ", bisPath, outPath, olyLabels[i], "output" ))
  
}
```
