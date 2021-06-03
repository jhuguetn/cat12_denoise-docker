%-----------------------------------------------------------------------
% CAT12 denoising for SPM12 standalone installation
%
%_______________________________________________________________________
% $Id: cat_denoise.m 1733 2021-05-18 15:51:01 jhuguetn $

% data field, that will be dynamically replaced by cat_standalone.sh
matlabbatch{1}.spm.util.split.vol = '<UNDEFINED>';
matlabbatch{1}.spm.util.split.outdir = {'/tmp'};
matlabbatch{2}.spm.tools.cat.tools.sanlm.data(1) = cfg_dep('4D to 3D File Conversion: Series of 3D Volumes', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','splitfiles'));
matlabbatch{2}.spm.tools.cat.tools.sanlm.spm_type = 0;
matlabbatch{2}.spm.tools.cat.tools.sanlm.prefix = 'sanlm_';
%matlabbatch{2}.spm.tools.cat.tools.sanlm.suffix = '_dn';
matlabbatch{2}.spm.tools.cat.tools.sanlm.addnoise = 0.5;
matlabbatch{2}.spm.tools.cat.tools.sanlm.rician = 0;
matlabbatch{2}.spm.tools.cat.tools.sanlm.replaceNANandINF = 1;
matlabbatch{2}.spm.tools.cat.tools.sanlm.nlmfilter.expert.NCstr = -Inf;
matlabbatch{2}.spm.tools.cat.tools.sanlm.nlmfilter.expert.iter = 0;
matlabbatch{2}.spm.tools.cat.tools.sanlm.nlmfilter.expert.iterm = 0;
matlabbatch{2}.spm.tools.cat.tools.sanlm.nlmfilter.expert.outlier = 1;
matlabbatch{2}.spm.tools.cat.tools.sanlm.nlmfilter.expert.relativeIntensityAdaption = 1;
matlabbatch{2}.spm.tools.cat.tools.sanlm.nlmfilter.expert.relativeIntensityAdaptionTH = 2;
matlabbatch{2}.spm.tools.cat.tools.sanlm.nlmfilter.expert.relativeFilterStengthLimit = 1;
matlabbatch{2}.spm.tools.cat.tools.sanlm.nlmfilter.expert.resolutionDependency = 0;
matlabbatch{2}.spm.tools.cat.tools.sanlm.nlmfilter.expert.resolutionDependencyRange = [1 2.5];
matlabbatch{2}.spm.tools.cat.tools.sanlm.nlmfilter.expert.red = 0;
