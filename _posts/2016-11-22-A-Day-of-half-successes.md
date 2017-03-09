Well, I did things today, but it doesn't feel like I got anything completed. 

First, I installed Ubuntu on Emu, since the OS X install decided to die on updates. I had an old v14.04 bootable USB and decided to 
install off of that, and then update to the newest version.

Big mistake.

It installed fine, and I began the update process. First, it takes forever updating via the command line. Secondly, and more importantly, 
after devoting an hour and a half to the update, it didn't work. The update screwed up the boot partition, rendering the whole thing bricked. 

So I updated the USB stick to 16.04.1, and reinstalled. All went well the second time around and I began installing VNC and SSH so we could interact with Emu remotely. Installed the packages, set everything up, and fired up my laptop to connect... and nothing.

After lots of checking, opening of ports, closing of ports, killing of processes I decided I should check the IP that Emu had been using last week. Yup, it changed. Use the right IP and it works fine.

During all of this I was working on some visualization stuff on some sablefish satellite tag data in R. Using Shiny I whipped up some cool graphs that show depth averages by hour (What depth is a fish at at, say 5 pm on every day of the observation) as well as what is the average depth the fish was found at over each day of the obsevation (what depth was the fish at on the 5th of July). It's pretty cool. 

Would be cooler if I could get it to load to the shinyapps.io server so I could share it! The rconnect package provides the error
```Error in bundleFiles(appDir) : 
  The directory/Users/Seancannot be deployed because it is too large (the maximum size is3145728000bytes). Remove some files or adjust the rsconnect.max.bundle.size option.```
  
 which is odd, considerng thats a claimed 3gb of max size, and I'm working with a 4mb csv file. Google isn't a ton of help, but I will continue to do some research as to how to fix it, otherwise I might look in to setting up my own shiny server. Something to consider.
 


