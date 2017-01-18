I've been working on Hollie's Geoduck samples for a while now, and I have some results! Sort of... This is for 4 of the 53 samples, but it serves as a proof of concept for the workflow if nothing else!

Some pictures of what things need to look like.

Predictor file:  
![image1](https://github.com/seanb80/seanb80.github.io/blob/master/images/macauresults/predictor.png?raw=true)

Relatedness file: (Note, Our relatedness values look wonky because there are only 4 samples in the group, and VCFtools calculates expected values directly from the samples)  
![image2](https://github.com/seanb80/seanb80.github.io/blob/master/images/macauresults/relatedness2.png?raw=true)

The above two have no headers or row IDs, and are put in in the same order of sample columns from the Methylation and Total Coverage files.

Methylation Count File:  
![image3](https://github.com/seanb80/seanb80.github.io/blob/master/images/macauresults/meth.png?raw=true)

Total Coverage Count File:  
![image4](https://github.com/seanb80/seanb80.github.io/blob/master/images/macauresults/totcov.png?raw=true)

Feed all of that in to MACAU and you get to see this!  
![image5](https://github.com/seanb80/seanb80.github.io/blob/master/images/macauresults/macaurunning.png?raw=true)

which eventually spits out some results.

![image6](https://github.com/seanb80/seanb80.github.io/blob/master/images/macauresults/results.png?raw=true)

Results can be found [here](https://github.com/seanb80/seanb80.github.io/blob/master/files/result.assoc.txt)

Will follow this with an R notebook of what I did to make the total methylation and total coverage count files shortly.
