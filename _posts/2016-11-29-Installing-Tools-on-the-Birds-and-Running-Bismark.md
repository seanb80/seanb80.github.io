Started the day off getting the new birds (Roadrunner and Ostrich) loaded up with some bioinformatics tools. 

Wrote a quick bash script (my first!) based on the Hummingbird software list. Got most everything installed, except for fastx_toolkit, as apparently the precompiled version available from the Hannon Lab website is 32bit only and attempting to compile the source code results in an error.

I've found a work around via but need a bit of time to implement it. It may not be feasable to add in to the bash script, as it requires the use of the brew package manager, but will test it out to see if I can get it to play nicely. 

Next on the agenda was fiddling with Bismark to get it to run to completion for analysis. After re-running it on another OS X machine with more memory and it failing with the same sort -k3,3V error, I did some googling and found it may be an issue with the OS X implementation of sort lacking certain arguments required to run. I'm currently testing this on our Emu in a linux environemnt to see if that results in a sucessful run. 

Oh, also got my Shiny script for the depth stuff to finally upload.https://seanb80.shinyapps.io/SablefishDepth/

Bash Script can be found at: https://github.com/seanb80/seanb80.github.io/blob/master/code/install.sh

FastX-Tools workaround via brew can be found at https://github.com/Homebrew/homebrew-science/issues/432#issuecomment-27764407



