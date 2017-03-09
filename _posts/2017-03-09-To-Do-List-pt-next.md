Another good conversation with Hollie about where the Geoduck methylation stuff is going resulted in the following things to do:

1. Experiment more with Circilizer to make Circos plots from scaffolds. Circlizer is set up to add a 1* space between pairs of scaffolds, so as it stands we either need to figure out how to group/reduce scaffold numbers, or make a 40,000* circle. 

2. Re-run the methylome stuff with 10x coverage, as opposed to the current 5x coverage requirement. Mostly for consistancy across analysis types.   

3. Run t-tests/one-way ANOVAs for Whole Genome methylation by treatment, ex. At Day 10 Ambient Treatment samples had 40% methylation, ..., 43% methylation, Low Treatment had 50% methylation, ..., etc and then look for differences by treatment. Those numbers are made up from whole-clot by the way.

4. Look at MethLine/RADMeth and do a beta-binomial model to compare with the MACAU mixed-effects model. Mostly just qualitatively decide if we're getting results that make sense in MACAU.  

5. Make a .bed file for the 135WG whole genome sequencing sample. 
