---
layout: post
title: "Installing RepeatMasker"
date: 2016-11-04
---

![Image description](/images/perl.png)


Today I started working on identifying transposable elements in the Ostrea lurida genome via RepeatMasker.

RepeatMasker is a linux based program that identifies transposable elements, satellites, and regions of 
low DNA complexity from an existing .FASTA file. The program can be found at http://www.repeatmasker.org/RMDownload.html

After downloading the requisite files and dependencies (For me this was RMBlast, TNF, and the repeat database from GIRI, which requires user authentication provided by the GIRI people, a roughly 3 hour turnaround time for me). Dtrx can be gotten from
your favorite package manager, ex. apt-get install dtrx

<em>Installation Walkthrough</em>:

note: This was done on a Macbook Pro running Ubuntu 16.04 roughly following repeatmasker.org instructions.

1. Check perl version, as RepeatMasker requires version 5.8.0 or greater.

![](/images/perl.png)

2. Unzip RepeatMasker in to /usr/local.

3. Unzip blast in to /usr/local

<img src = "https://raw.github.com/seanb80/seanb80.github.io/master/images/unzip%20blast.png", alt = "unzipping Blast">

4. Unzip rmblast in to /usr/local

![](/images/rmblast%20unzip.png)

5. copy rmblast files in to the blast director

![](images/cp%20rmblast%20to%20blast.png)

6. At this point, I switched to using dtrx (do the right extraction) as opposed to using tar/gunzip. 
   Just a quality of life thing. I unzipped the repeat libraries obtained from GIRI at this point.
   note: Be better than I am and use the force overwrite (-o) argument for dtrx, RepeatMasker comes with a 
   Library directory, so dtrx will make a second Libraries directory as opposed to overwrite without that 
   argument. The subsequent pictures show how to fix that. 
   
![](/images/dtrx%libraries.png")
   
   <img src = "https://raw.github.com/seanb80/seanb80.github.io/master/images/mv%20lib.1%20to%20lib.png", alt = "combining the two libraries directories">
  
7. Updating Dfam libraries, the picture below shows dtrx with both the -o and without the -o argument. I took the time 
   to delete the extra copy of the dfam library for cleanliness. Note: I'm not sure this step was necessary for me, as the
   Dfam libraries are only human related transposable elements.
     
![](/images/update%20dfam.png)
   
8. Config time! There's a few little traps, but overall it went smoothly.

![](/images/perl%20config.png)
  
9. First screen, just enter through.

![](/images/Repeat%20Masker%20cfg%201.png)
  
10. Path to perl interpretar, default worked for me.

![](/images/RM%20cfg%202.png)
  
11. Repeat Masker installation location, again default worked for me.

![](/images/RM%20cfg%203.png)
  
12. Next, it asks for the TRF installation location, and an interesting bug came up. TRF has a file name "trf.linux64", 
    but RepeatMasker expects a file name of just "trf" when inspecting the directory given. 
    
![](/images/RM%20cfg%20TRF%20error.png)
    
13. Initially, I tried to rename the file, that was a no-go, so I set up a symlink (symbolic link) to fool RM into thinking 
    TRF existed as it expected. 
    
![](/images/trf%20fix.png)
    
14. Next step asks for Search Engine location, and if you'd like it to be the default. 

![](/images/RMBlast%20Default.png)
  
![](/images/RMBlast%20Configured.png")
  
15. Config done! Err... not so much. The configuration removes some files, which requires sudo as they live in /usr/local. 
    
![](/images/config%20sucessful.png")
    
    So, just rerun the config using sudo perl ./configure. 
    
16. Success! and a new error. Apparently we were missing a required perl module. Easy fix as follows.

![](/images/Success%20and%20new%20error.png)
  
![](/images/perl%20fix%20soundex.png)
  
17. Success for real! 

![](/images/success%20for%20real.png)
  
  

  
