Yesterday I was working on un-slaving some X-serve nodes and had issues installing Mountain Lion from an executable stored on Eagle.
Apparently the installer is smart enough to know where it came from, and that Eagle is not an "approved" apple source.

Thankfully I've found a workaround!

It involves unpacking the executable and using the restore function in Disk Utility.

Step 1. Unpack the executable by right clicking on the file, and hitting Show Contents

![unpacking the executable](/images/mtnln/1.png)

Step 2. Find "InstallESD.dmg" under the SharedSupport directory. This is the actual OS package.

![Finding the right file](/images/mtnln/2.png)

Step 3. Drag InstallESD.dmg into the Disk Utilty app.

![Disk Utility pt 1](/images/mtnln/3.png)

Step 4. Double Click on the InstallESD.dmg file on the left hand column of Disk Utility. This expands the .dmg file. 
If you don't do this, the Restore will fail with a "Could Not Restore, Invalid Argument" error. 

![Disk Utlity pt 2](/images/mtnln/4.png)

Step 5. Hit go, then wait. At the end collect your fancy new boot drive

![Finished!](/images/mtnln/5.png)

As much as I may love the OS X ecosystem, this was *way* harder than it needed to be. Sometimes I don't need to be protected
from myself quite as much as Apple thinks I do.

Next on the list, freeing Emu and Ostritch from the evil clutches of the Master node.
