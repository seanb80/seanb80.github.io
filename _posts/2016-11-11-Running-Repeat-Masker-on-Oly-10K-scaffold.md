Today I'm re-running the repeat masker operation on the 10k Olympia Oyster scaffold. RepeatMasker requires a linux system,
in my case I'm using a VMWare container running Ubuntu 16.04

command to start the process

```
sudo perl /usr/local/RepeatMasker/RepeatMasker -species "crassostrea gigas" -gff -s Ostrea_lurida-Scaff-10k.fa
```

![](/images/repeat-masker/repeatmasker%20running.png)

The -species argument allows for you to specify the reference genome used. If it's not used, the program defaults to
using the human genome.

The -gff argument produces a general feature format file in addition to it's normal output.

The -s argument runs a more thorough search, ~5% more sensitive with a penalty of running 50% as fast.

Will update with results as soon as it's finished!
