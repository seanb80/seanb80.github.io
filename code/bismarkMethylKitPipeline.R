## Pipeline script for Bismark and Methylkit analysis. When provided the appropriate data,
## bismark executable and output directories, as well as a reference genome and two
## csv files, one of sample sequence names and one of treatments corresponding to the
## sample sequence brings the user interactively through the Bismark genome prep, alignment
## and methylation extraction, as well as methylkit analysis. Outputs one directory of 
## methylkit output gzips (Methylation % histograms, Methylation Coverage histograms, and
## clustering graphs, all PDFs), as well as a zip of coverage files. In the future it will
## also zip up the other Bismark outputs.

require("Rcpp")
#source("http://bioconductor.org/biocLite.R")
#iocLite(c("GenomicRanges","IRanges"))
require("devtools")
#install_github("al2na/methylKit", build_vignettes = FALSE, repos = BiocInstaller::biocinstallRepos(), dependencies = TRUE)
library("methylKit")
######### The below section is the interactive portion, querying user for relevent information ####

## Queries and sets data directory
working_dir <- readline(prompt = "Enter data Directory: ")
setwd(working_dir)

## Queries user for a list of the sample files used. Should be a .csv of gzipped fastqfiles so
## sample1.fastq.gz, sample2.fastq.gz, ... , sampleN.fastq.gz. All file name calls are built 
## from this, so accuracy is important. Really.
sample_file <- readline(prompt = "Enter .csv file name for sample names [format = sample.fastq.gz]: ")
header_exists <- readline(prompt = "Does the .csv have a header? [input = TRUE or FALSE]: ")
file_names <- read.csv(sample_file, header = (header_exists == TRUE))

## Where the Bismark executables are located. 
bismark_directory <- readline(prompt = "Enter directory for Bismark executables: ")

## Where you want your output to go. Currently you have to make this directory, but
## that could be changed with one additional line. 
bismark_output <- readline(prompt = "Enter output directory for Bismark files: ")

## Genome location,and name, for the genome prep step
genome_dir <- readline(prompt = "Input reference genome directory: ")
genome_name <- readline(prompt = "Input reference genome name: ")

## Treatment labels. I believe methylkit requires this to be a series of 0s and 1s.

treatment_labels <- readline(prompt = "Input .csv file for treatment labels: ")
treatment_header <- readline(prompt = "Does the .csv file have a header? [input = TRUE or FALSE}: ")
treatment_names <- read.csv(treatment_labels, header = (treatment_header == TRUE))

## Methylkit coverage filtering values. min_cov_val is in the methRead command, and is a 
## strict limiter by minimum coverage occurance. A 1 here imports all data, but it can
## be limited in the filtering step. Low_count_val is in the filterByCoverage function,
## and is equivilant to the min_cov_val in methRead. Hi_perc_val cuts off the highest
## percentile of coverage reads, potentially correcting for PCR bias. Think about these
## choices before moving on.
min_cov_val <- readline(prompt = "Enter minumum coverage value for methRead function (1 = all data): ")
low_count_val <- readline(prompt = "Enter value for low count filter for filterByCoverage function: ")
hi_perc_val <- readline(prompt = "Enter value for high percentage coverage filter for filterByCoverage function: ")


################# Bismark stuff here #######################

## Runs bismark_genome_preparation. 
system(paste0(bismark_directory, "bismark_genome_preparation ", genome_dir))

## Runs the bismark aligner for each file. This is the time consuming step. For the test runs
## I found that it was ~ 2 hours per sequence file. 
for(i in 1:nrow(file_names))   {

  system(paste0(bismark_directory, "bismark --genome ", genome_dir, " ", working_dir, "/", file_names[i,1], " --output_dir ", bismark_output))

}

## Runs the bismark_methylation_extractor. This is quick.
setwd(bismark_output)
for(i in 1:nrow(file_names))   {

  system(paste0(bismark_directory, "bismark_methylation_extractor -s --scaffolds --merge_non_CpG --bedGraph --zero_based ", bismark_output, gsub(".fastq.gz", "", file_names[i,1]), "_bismark_bt2.bam", " --output ", bismark_output))
}

################ Methylkit part here #######################

# Sets working directory to the output directory.
setwd(bismark_output)

## unzips all of the coverage files, which are outputted from bismark zipped. In it's current
## status it deletes the gzips after unzipping, but that could be changed.
system("gzip -d *.bismark.cov.gz")

## Initilizes vectors for file labels and sample labels.
file_labels <- vector("list", nrow(file_names))
sample_labels <- vector("list", nrow(file_names))

## Takes the supplied sample sequence names and strips .fastq.gz from them, and either leaves them
## bare for sample names (largely used for labeling afaik), and appends _bismark_bt2.bismark.cov
## to correctly direct at the coverage files.
for(i in 1:nrow(file_names)) {
  sample_labels[i] <- gsub(".fastq.gz", "", file_names[i,1])
  file_labels[[i]] <- paste0(gsub(".fastq.gz", "_bismark_bt2.bismark.cov", file_names[i,1]), "")

}
## creates the raw methRead object, uses the min_cov_val supplied by the user and the treatment
## file.
methReadObj <- methRead(  file_labels, sample_labels, assembly = "test", mincov = min_cov_val, pipeline = 'bismarkCoverage', context = "CpG", treatment = treatment_names[,1])

## Filters the raw methRead object, uses low_count_val and hi_perc_val supplied by user
filteredMethObj <- filterByCoverage(methReadObj, lo.count = as.numeric(low_count_val), low.perc = NULL, hi.count = NULL, high.perc = as.numeric(hi_perc_val))

## Makes a sub directory under the output directory of methylkit output, and sets that as
## the working directory
system(paste0("mkdir ", bismark_output, "/MethylKitOutput"))
setwd(paste0(bismark_output, "/MethylKitOutput"))

## Creates sequential % Methylation histograms for each sample and saves them as a pdf
for(i in 1:nrow(file_names)) {
  pdf(file = paste0("MethStatHist", i, ".pdf"))
  getMethylationStats(filteredMethObj[[i]], plot = T, both.strands = F)
  dev.off()
}

## Zips the resulting histograms and removes the PDFs.
system("tar -zcvf MethStat.tar.gz *MethStat*")
system("rm *MethStatHist*")

## Makes coverage histograms for each sample, saves as a PDF
for(i in 1:nrow(file_names)) {
  pdf(file = paste0("CovStatHist", i, ".pdf"))
  getCoverageStats(filteredMethObj[[i]], plot = T, both.strands = F)
  dev.off()
}

## zips the coverage histograms, and deletes the PDFs
system("tar -zcvf CovStat.tar.gz *CovStat*")
system("rm *CovStatHist*")

## Unifies all of the samples into a single object for clustering and PCA
meth <- unite(filteredMethObj, destrand = F)

## Creates the correlation matrix, and outputs it to a csv fil.e
corr.Matrix <- capture.output(getCorrelation(meth, plot = F))
write.csv(corr.Matrix, file = "corr.Matrix.csv")

## Clusters the samples and saves the dendrogram as a pdf
pdf(file = "clustergram.pdf")
CpGDendro <- clusterSamples(meth, dist = "correlation", method = "ward", plot = T)
dev.off()

## Does PCA and graphs the results, saving as a PDF
pdf(file = "PCA.pdf")
PCA <- PCASamples(meth, scale = T, center = T)
dev.off()

## Plots the variance explained by the different components as a PDF
pdf(file = "screeplot.pdf")
PCASamples(meth, screeplot = T)
dev.off()

## Puts the correlation matrix, clustergram, PCA, and screeplot into a separate
## zip and gets rid of the files.
system("tar -zcvf OtherFiles.tar.gz *.* --exclude='*.tar.gz'")
system("rm *.pdf")
system("rm *.csv")

## Sets the working directory back to the original output directory, zips all the
## coverage files and deletes them.
setwd(bismark_output)
system("tar -zcvf CovFiles.tar.gz *.bismark.cov*")
system("rm *.bismark.cov*")

