%-----------------------------------------------------------------------
% merging 3D volumes (CAT12 denoising result) into a single 4D NIfTI file
%
%_______________________________________________________________________
% $Id: cat_merge.m 1733 2021-05-19 11:24:42 jhuguetn $

% data field, that will be dynamically replaced by cat_standalone.sh
matlabbatch{1}.spm.util.cat.vols = '<UNDEFINED>';
matlabbatch{1}.spm.util.cat.name = '/tmp/denoised.nii';
matlabbatch{1}.spm.util.cat.dtype = 0;
matlabbatch{1}.spm.util.cat.RT = NaN;
