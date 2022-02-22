# cat12_denoise-docker
CAT12 image denoising as a Docker container

CAT12_denoise-docker
====================
[CAT](http://www.neuro.uni-jena.de/cat/) SANLM denoising filter implementation
([Manjon et al. 2010](http://dx.doi.org/10.1002/jmri.22003)) made available as 
a dockerized command. 

Container default execution expects a NIfTI-formatted image as `input_file` 
and an `output_directory` where the denoised version of the image is created 
(same name as the input image with `_dn` suffix). Command is compatible with 
either 3D or 4D MRI images. 

This Docker image derives from the baseline CAT12 standalone 
[Docker image](https://github.com/jhuguetn/cat12-docker).


Usage
-----
```bash
 docker pull jhuguetn/cat12_denoise
 ...
 docker run -v /data:/data jhuguetn/cat12_denoise /indir/image.nii /outdir
```

Example
-------
```bash
 docker run -it --rm -v `pwd`/data:/in -v /tmp:/out \
 jhuguetn/cat12_denoise /in/sub-0001_T1w.nii.gz /out
 
 fslinfo /tmp/sub-0001_T1w_dn.nii.gz
```

Credits
-------
Jordi Huguet ([BarcelonaBeta Brain Research Center](http://barcelonabeta.org))