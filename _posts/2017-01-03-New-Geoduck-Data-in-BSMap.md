I've been running the new juvenile Geoduck data from Hollie's experiment through BSMap over the weekend. This has been partly done via an R notebook on Emu local, and part via SSH on my macbook, so this notebook will be a little disjointed until I'm back in the lab with Emu to combine everything.

I left Emu running BSMap on untrimmed Geoduck data I had gotten from Owl, so we'll pick up from there.

After the BSMap runs were completed, I ran everything through methratio, the supporting python script for BSmap that extracts methylation information from the aligned sequences via the following script:

<img src = "https://raw.githubusercontent.com/seanb80/seanb80.github.io/master/images/geoduck-meth/Screen%20Shot%202017-01-03%20at%209.15.26%20AM.png" width = "1000">

The script above reads in all file names matching with the .sam prefix, saves them to a list, and then iterates over that list running methratio.py on each.

Next, I prepped the files for methylkit analysis, and ran them through methylkit. Methylkit expects output similar to Bismark, with R and F for reverse and forward strand designations, and CG to indicate CpG motifs, so the first part of this script operates on the BSmap data, stripping all non CG motifs, and changing strand designators. The second part of the script runs methylkit, using a minimum coverage value of 3, and a maximum filter percentage of 95, then creates methylation and coverage histograms, as well as a clustering dendrogram and PCA plot, then saves them to a pdf file. 

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/geoduck-meth/Screen%20Shot%202017-01-03%20at%209.24.42%20AM.png?raw=true", width = "1400">

After I got that done, I went back and trimmed the data and re-ran it using the same scripts as above, tweaking them to change file names as needed.

The Trim Galore calls were done manually, but then executed as a batch so I could leave them running over night. The script is shown below

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/geoduck-meth/Screen%20Shot%202017-01-03%20at%209.34.21%20AM.png?raw=true" width = "1000">

One difference between the trimmed and untrimmed runs is BSMap produced a buffer overflow error with the gzipped trimmed files. I couldn't figure out why this was, and there was no help googling the error, so I had to unzip the fastq files and run them that way, which worked. I'm going to try to figure out what the error was this week hopeully.

All data has been, or is in the process of being, uploaded to Owl, under the scaphapoda/Sean directory.

