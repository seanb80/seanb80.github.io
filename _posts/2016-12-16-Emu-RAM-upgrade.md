Came in to lab today to a present!

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1830.JPG  />

Exciting!

I've found Emu tends to be memory bound with most of the analyses we've been doing, so quadrupling the ram available in it should speed that up a significant bit.

Using a combination of Sam's notebook found [here](http://onsnetwork.org/kubu4/2016/06/09/ram-upgrade-roadrunner-apple-xserve-to-48gb-ram/) and the X-serve owners manual [here](http://www.apple.com/server/docs/Xserve_Setup_Guide12202006.pdf) I got the new RAM installed and only had a few minor heart attacks along the way.

First I opened the back door

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1831.JPG  />

Then unplugged all the cables associated with Emu. I tied them together with lab tape just in case.

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1832.JPG />

Then I opened the front door, and unscrewed the thumbscrews that keep Emu in.

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1833.JPG />

Almost free!

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1834.JPG />

These are the little tabs that Sam points out. I'll add that you have to push down on them

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1835.JPG />

Emu free and on the bench

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1836.JPG />

Next we'll take the top cover off by removing the thumbscrews on the back, pulling back a little bit and then up. There's not much of a handle to pull, so this was a little annoying.

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1837.JPG />

The current ram, installed as instructed using channels 1,2, and 3. We thankfully don't have to worry about this as we're populating all of the slots. 

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1838.JPG />

CPU 1 all full 

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1839.JPG />

CPU 2 all full. Of note: RAM sticks are keyed with a short and long end, and the short side of the stick switches sides between CPUs 1 and 2 so you have to switch your sticks around as you're doing this.

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1841.JPG />

After putting Emu back in it's slot, reconnecting all of the cables and powering it on I got some error lights, all 16 CPU usage lights were blinking. I consulted the X-Serve users guide and it said this signifies a bad DIMM. I pulled EMU out and reseated all of the sticks, and put everything back together. This seems to have somewhat appeased the Computer gods, as Emu began to boot, but threw a hard drive error (Flashing File Folder w/ Question Mark on POST screen). I turned Emu off once more, pulled the hard drive tray and reseated it and had success! 

More RAM!

<img src=https://raw.githubusercontent.com/seanb80/seanb80.github.io/872609ea9227aa4eda87647b6895d6e87623a851/images/emuram/IMG_1847.JPG />

I originally did this post in R notebook, but was unable to publish to the rpubs website due to the images being too large, even when resized. I then tried to link them to my github account, but that did not work either. Something to work on in the future, but may limit the usefulness of rpubs and R notebook for non-code related updates.
