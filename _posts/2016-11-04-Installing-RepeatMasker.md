---
layout: post
title: "Installing RepeatMasker"
date: 2016-11-04
---

Today I started working on identifying transposable elements in the Ostrea lurida genome via RepeatMasker.

RepeatMasker is a linux based program that identifies transposable elements, satellites, and regions of 
low DNA complexity from an existing .FASTA file. The program can be found at http://www.repeatmasker.org/RMDownload.html

After downloading the requisite files and dependencies (For me this was RMBlast, TNF, and the repeat database from GIRI, which requires user authentication provided by the GIRI people, a roughly 3 hour turnaround time for me).

<em>Installation Walkthrough</em>:

note: This was done on a Macbook Pro running Ubuntu 16.04 roughly following repeatmasker.org instructions.

1. Check perl version, as RepeatMasker requires version 5.8.0 or greater.

<img src = "https://raw.github.com/seanb80/seanb80.github.io/master/images/perl.png", alt = "perl version check">

2. Unzip blast in to /usr/local

<img src = "https://raw.github.com/seanb80/seanb80.github.io/master/images/unzip%20blast.png", alt = "unzipping Blast">

3. Unzip rmblast in to /usr/local

<img src = "https://raw.github.com/seanb80/seanb80.github.io/master/images/rmblast%unzip.png", alt = "unzipping rmblast">

4. copy rmblast files in to the blast director

<img src = "https://raw.github.com/seanb80/seanb80.github.io/master/images/cp%rmblast%to%blast.png"
