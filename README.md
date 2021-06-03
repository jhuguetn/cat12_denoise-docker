# cat12_denoise-docker
CAT12 image denoising as a Docker container

CAT12_denoise-docker
====================
[CAT](http://www.neuro.uni-jena.de/cat/) SANLM denoising filter implementation
([Manjon et al. 2010](http://dx.doi.org/10.1002/jmri.22003)) made available as 
a dockerized command. 

Container default execution expects an `input_directory` with a single NIfTI 
image and an `output_directory` where the denoised version of the image is 
created (same name as the input image with `_dn` suffix). Command is compatible 
with eith 3D or 4D MRI images. 

This Docker image derives from the baseline CAT12 standalone 
[Docker image](https://github.com/jhuguetn/cat12-docker).


Usage
-----
```bash
 docker pull jhuguetn/cat12_denoise
 ...
 docker run -v /data:/data jhuguetn/cat12_denoise /indir /outdir
```

Example
-------
```bash
 docker run -it --rm -v `pwd`/data:/data jhuguetn/cat12_denoise \
 /data/my_dataset/sub-0001/anat/sub-0001_T1w.nii /tmp/out
 
 fslinfo /tmp/out/sub-0001_T1w_dn.nii
```

Credits
-------
Jordi Huguet ([BarcelonaBeta Brain Research Center](http://barcelonabeta.org))