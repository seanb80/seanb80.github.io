I've been working my way through a subsample of Hollie's geoduck methylation data, and have gotten to the point of identifying diferentially methylated loci from the samples. The process seemed straight forward but the results, when viewed with IGV are odd. 

I'm going to walk through the process I used to go from the MethylExtract results files to IGV results here, including code. 

First, I read in the data
<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.57.15%20AM.png?raw=true" width = "600">

Then I create some new columns in the data set. MethylExtract outputs CG data by strand, so I had to combine them.

<img src = https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.57.23%20AM.png?raw=true" width = "600">

after that I give the new columns some nice column names.

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.57.29%20AM.png?raw=true" width = "600">

then I start the merge process. R's merge function (think SQL join) only accepts two data frame inputs, so if you have multiple samples to join you have to daisy chain them, which is a little obnoxious, but functional I guess?

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.57.35%20AM.png?raw=true" width = "600">

the results of the merge

Methylated:

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.58.06%20AM.png?raw=true" width = "600">

Unmethylated:

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.58.14%20AM.png?raw=true" width = "600">

They look like I would imagine they would, with methylated read counts being smaller than methylated, and no methylated reads without corresponding unmethylated.

Moving on I create files for visualizing the entire data set per sample in IGV and write them to disk. 

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.57.50%20AM.png?raw=true" width = "600">

Next, I trim down our data set using two criteria, first, a locus must have reads for each sample, and there needs to be at least 10X coverage for each sample.

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.58.25%20AM.png?raw=true" width = "600">

results,

Methylated:

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.58.37%20AM.png?raw=true" width = "600">
Unmethylated:

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.58.45%20AM.png?raw=true" width = "600">

Those look good as well.

The unmethylated dataset has more loci than the methylated set, so to ensure I'm comparing apples to apples I combine the scaffold number and location strings, and then only include scaffold/location combinations that occure in the methylated dataset. This also makes the MACAU program happy, as it only accepts a single row label column, and then everything else is interpreted as meaningful counts.

results (note: the row label column and quotes are an artifact of R, they're not written out to the file):

Methylated:

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%201.29.17%20PM.png?raw=true" width = "600">

Unmethylated:

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%201.29.37%20PM.png?raw=true" width = "600">

I've been doing the previous work on my laptop, and MACAU only runs on Linux, so I package everything up and run MACAU on Emu. The output of MACAU isn't very interesting, just a timer and progress bar but the command I used to call it was

`./macau -g macau.meth.txt -t macau.totalcov.txt -p predictor.txt -k relatedness.txt -o`

where -g is the methylated count file, -t is the total coverage count file, -p is the predictor file, and -k is the relatedness file. -o tells it to output it to it's default output directory.

the results file looks like

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macauresults/results.png?raw=true" width = "600">

Finally, I load that up in to R and parse it. I initally look for all results with a p value < 0.05, then I break down the concatenated scaffold/location data in to separate columns to satisfy IGV. I create a new data frame with columns for scaffold number, location start, location end, and the h value of the associated loci. I realize now that the h value is probably just the heritability factor from the relatedness matrix, and likely not informative by itself. I'll likely drop that in future analyses. 

<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.59.15%20AM.png?raw=true" width = "600">

So, here's where things get weird. There were only 4 significant DMRs, and when viewed in IGV, they're less than convincing. 

The samples are EPI-104/Low pH, EPI-111/Super Low pH, EPI-113/Super Low pH, and EPI-119/Ambient pH respectively on the below graphs

DMR 1:
<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.50.38%20AM.png?raw=true" width = "600">

DMR 2:
<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.53.06%20AM.png?raw=true" width = "600">

DMR 3:
<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.54.04%20AM.png?raw=true" width = "600">

DMR 4:
<img src = "https://github.com/seanb80/seanb80.github.io/blob/master/images/macaupuzzle/Screen%20Shot%202017-01-20%20at%2011.54.33%20AM.png?raw=true" width = "600">

They don't look super convincing to me, maybe the 2nd and the 4th when low/super low are compared to ambient, but the 1st and 3rd?

This might just be caused by small sample sizes creating a relatedness matrix that messes things up, or something else odd in the MACAU model itself. Hopefully by the time all of the samples are done running on Emu we'll have a better idea 
