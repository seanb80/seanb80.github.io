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