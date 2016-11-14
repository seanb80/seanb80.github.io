So, been an interesting day. Lots of frustrations with computers, but I built something kind of cool (and mostly useless) for  
as a proof of concept for some future work. 

First, the computer stuff.

I've been tasked with getting a couple of the slave nodes on the X-serve cluster running in standalone mode. Originally
this seemed like a relatively straight forward task. However, I've come across multiple issues.

1. The X-serve runs an older version of OS X, Mountain Lion to be specific. I had access to a copy of the installer, a new 
hard drive to install it on, and an external drive enclosure, so I should be good to go, right? Not so much. 

First I found that my laptop, with OS X Sierra running, would't let me install an older version of OS X on to the external drive.
So with the help of Sam, we hustled up an older Mac Mini lying around, running Lion. Then I was faced with an error that the installer
wouldn't work because it was sourced from an unverified soure (Eagle). Annoying. I think I have a work around that involves using
Restore in Disk Utility and unpackaging the Installer to find the .dmg file. I would test this, but neither the Mac Mini, nor my
laptop will recognize the external enclosure. Will troubleshoot this more tomorrow.

2. Disk Utility times out when trying to image the Nodes

I was trying to clone the drives from the custer nodes to preserve the data on them, but Disk Utility was having none of that.
Every time I tried to set up a clone job, I would get an error code 60, which has something to do with the connection timing out.
After much googling, I was unable to find what this exactly meant, so I did a direct copy between the two drives. I will hold off
on any formatting of the node hard drives until I make sure this is an acceptable way to back up data.

Now for the fun stuff!

The trim job I set Hummingbird on over the weekend completed, so I started the assembly process. I wanted to take a picture of
the terminal screen, but apparently Platanus sucks up every spare resource in the virtual machine, so getting the screenshot off/
posting it to github seems to be more than it can handle at the moment. Platanus's assembly UI also leaves a little to be desired
as it gives no hint on a progress or time to completion. I guess I just come back periodically to see if it's encountered an error, 
or completed. 

The command used to start was ```` ./platanus assemble -o Oly -f *.fa_trimmed ```

Also, I've started experimenting with Shiny. Shiny is a web application development tool for the R programming language.
It allows you to create interactive data visualizations hosted on the web. Way fancier than the typical results of a 
```par(mfrow = c(3,3)``` or whatever paneled plot in R. 

In the coming weeks I'll have some data from satellite tagged sablefish with temperature, depth, and location information.
I want to come up with some interesting ways for people to view and explore this data, and I felt Shiny was a good avenue for this.

I found some open source time series data on CO2 measurements at Mauna Loa to act as a proxy, and tossed in a map that a user can 
define boundaries for, as well as place a point just for fun. Link to the app and the code can be found below.

[Shiny App Experimentation](https://seanb80.shinyapps.io/shiny/)
[Shiny Code](https://github.com/seanb80/seanb80.github.io/blob/master/code/shiny.R)
