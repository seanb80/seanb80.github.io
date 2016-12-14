I'm currently running an R notebook that converts Thermo Mass Spec .raw files to .mzxml files for Comet analysis. I wanted to get the notebook preserved in case anything happens during the running of the script so this is just a placeholder the R notebook finishes running. It has no output, but the spirit should be understandable.


------------

I've spent the last few days installing a bunch of proteomic analysis programs on Emu and wanted to give them a test run one some data to make sure all the supporting programs/dependencies are properly installed and configured.

I copied Rhonda's 2016 C. gigas from Owl (~/web/trocophora/C_gigas_proteome2016)
and ran a "quick" MD5 check outputted to a text file then set out reading Emma's suggestions for analysis and the documentation for the various programs associated with the TPP pipeline.

```{r}
setwd("~/Documents/GigasProteome")

system("md5sum *.* >> md5.txt")
```

I picked up a reference gigas proteome here (http://www.uniprot.org/proteomes/UP000005408) and uncompressed it. I also renamed it for ease in future use. 

```{r}

system("mv ~/Downloads/uniprot-proteome%3AUP000005408.fasta.gz ~/Documents/GigasProteome")
system("gunzip uniprot-proteome%3AUP000005408.fasta.gz")
system("mv ~/Documents/GigasProteome/uniprot-proteome%3AUP000005408.fasta ~/Documents/GigasProteome/gigas-proteome.fasta")

```
A quick departure from proteomics. Some things have to be ran as sudo, which is difficult in scripts such as this due to an inability to interact with the terminal (type your password in). A way to fix this is to add "username ALL=(ALL) NOPASSWD: /path/to/script" to /etc/sudoers via your favorite text editor. This is not the greatest fix, as you're allowing a command to run as root without any protections, so use at your own risk.

Moving on.


It looks like the pipeline starts with Comet, which requires a parameters file. I made an assumption on the mass spec the samples were run on based upon what others in the lab are running on (Thermo Orbitrap Fusion Lumos Tribrid) and downloaded the comet.params.high-low from http://comet-ms.sourceforge.net/parameters/parameters_201601/

```{r}
system("/home/shared/comet/comet.2016012.linux.exe -Pcomet.params.high-low -Dgigas-proteome.fasta *.raw")
```
Well, that didn't work. Looks like comet doesn't place nicely with .raw files, and instead prefers .mzXML files. I downloaded Proteowiz, which contains mscovert to do this conversion and tried to run it


```{r}
system("/home/shared/proteowiz/msconvert 20161205_Sample_44A.raw --mzXML")
```

Well. This is a larger problem, and a first for me. Lots of things only work on Linux, I haven't come across a bioinformatics tool that only works in windows. After some googling I found https://github.com/princelab/katamari/wiki/msconvert-on-linux hoping that would work. It did not due to changes in winetricks as they implement it.

Next I tried Proteowizard from http://proteowizard.sourceforge.net/downloads.shtml which looked like it would be great. Unfortunetly, I was unable to find a suite of .Net upgrades via winetricks to properly install .Net 4.0 in a 64-bit environment, as the current version of Proteowizard requires. I was also unable to find an older, 32-bit, version of ProteoWizard. 

More googling led me to https://github.com/PedrioliLab/ReAdW which had promise, but required me to be able to install a 32-bit version of Thermo's msconvert to extract the right DLLs to use it. For some unknown reason, Thermo doesn't make these DLLs available, they're only able to be gotten via this install. The correct file is 
https://thermo.flexnetoperations.com/control/thmo/download?element=5628721

This... actually worked. Here's what I had to do to actually get this to work, so you can avoid my spending a day flailing.

-Install Wine via: sudo apt-get install wine

-Install Winetricks via sudo apt-get install winetricks

-Run Winetricks to install .Net 2.0, SP1, and SP2 via WINEPREFIX=~/.wine32 winetricks dotnet20 dotnet20sp1 dotnet20sp2
NOTE: that WINEPREFIX=~/.wine32 is really important, it forces wine into a 32bit emulation mode, which is required for the .NET installs. 

-Download the older version of msconvert from Thermo, using the URL above. You have to create a login for this. Unzip it to your favorite place.

-run WINEPREFIX=~/.wine32 wine MSFileReader.exe found in /MSFileReader 3.0 Sp1/MSFileReader_x86_Standalone/ from the zip. This installs the Thermo program allowing ReAdW to deal with .raw files. I took the step to find the three .DLLs that actaully make the whole thing run (Fileio.dll, fregistry.dll, and XRawFile2.dll) and save them, if I can find a better way for this to work in the future. 

-Download ReAdW.2016010.msfilereader.exe from https://github.com/PedrioliLab/ReAdW/bin 

-run WINEPREFIX=~/.wine32 wine ReAdW.2016010.msfilereader.exe with arguments for your .raw file and the expected .mzXML output and bask in the glory of having spent an entire day figuring this stuff out. 

The script below is the specific script I used to run through the 45 files I had downloaded from Owl. Each one takes ~10 minutes to run, so this is slow. Uncomment the system() command and change the directories to make it work for you. 

```{r}
setwd("~/Documents/ReAdW_DLLs")
test <- list.files(path = "~/Documents/GigasProteome", pattern = "*.raw")

for(i in 1:length(test))   {
  system(paste0("wine ReAdW.2016010.msfilereader.exe /home/sean/Documents/GigasProteome/", test[i], " /home/sean/Documents/mzMXL_files/", gsub(".raw", "", test[i]), ".mzXML"))
}
