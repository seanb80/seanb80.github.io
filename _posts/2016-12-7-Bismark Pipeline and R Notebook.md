So I think I created a pipeline to bring a user through Bismark alignment/methylation extraction and methylkit clustering analysis. 

Can be found [Here](https://github.com/seanb80/seanb80.github.io/blob/master/code/bismarkMethylKitPipeline.R)

I'm currently testing it on four files, but since each one takes ~ 2 hours to run, I won't know if it fails until tomorrow. Fingers crossed.

Also, I ran Methylkit on the 8 Oly samples from Steven using R notebook, which provides way prettier output than this. 

Found [Here](http://rpubs.com/seanb80/233608)

It doesn't look like there's good evidence for clustering based on treatment, but after getting ahold of Claire's old notebook
where she did similar analysis on the Pacific oyster, I'll continue to explore. 

Update: Don't run this in R-Studio, run it from the command line via RScript. The console window probably runs in to some sort of buffer overrun or something and locks up hard, though may still be running in the background. Found this out one Emu restart later. Oops.
