Started Yaamini's PECAN run on a subset of samples and wanted to document the `pecanpie` command I use. I gave it access to 12 of the 16 logical cores on Roadrunner, and 30gb of the 48gb of available ram to hopefully avoid the complete non-functionality that is currently afflicting Emu.  

`pecanpie -o /home/srlab/Documents/DNR_PECAN_Run_3_output -s gigas -n DNR_oyster_SpLibrary --pecanMemRequest 30 /home/srlab/Documents/DNR_PECAN_Run_3_20170308/2017-03-08-mzML-file-path-list.txt /home/srlab/Documents/DNR_PECAN_Run_3_20170308/2017-03-08-background-peptides-path-list.txt /home/srlab/Documents/DNR_PECAN_Run_3_20170308/2017-03-03-isolation-windows.csv --fido --jointPercolator --isolationSchemeType BOARDER --overwrite`

The --overwrite is only there because I ran it once before forgetting the spelling of "BORDER" used so I had to tell it to overwrite the directory already created.

After this I moved to `/home/srlab/Documents/DNR_PECAN_Run_3_output` and ran `./run_search.sh` which spooled up the jobs properly with Grid Engine.

Looking at `qstat -f` and `top` it looks like it is running properly. Hopefully we'll get some results in some tractable amount of time.
