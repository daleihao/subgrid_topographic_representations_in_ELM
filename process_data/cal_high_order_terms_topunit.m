
file_top_topunit = 'top_11years_topunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2006-02-01-00000.nc';
file_notop_topunit = 'notop_11years_topunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2006-02-01-00000.nc';

file_top_notopunit = 'top_11years_notopunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2006-02-01-00000.nc';
file_notop_notopunit = 'notop_11years_notopunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2006-02-01-00000.nc';


shs = ncread(file_top_topunit, 'FSH');
lhs = ncread(file_top_topunit, 'EFLX_LH_TOT');
shs = ncread(file_top_topunit, 'Qh');

rhos = ncread(file_top_topunit, 'RHO');
tsas = ncread(file_top_topunit, 'TSA') ;

qs = ncread(file_top_topunit, 'Q2M') ;
ufs = ncread(file_top_topunit, 'ustar_patch') ;

f2ds = ones(size(ufs))/size(ufs,1);
lh_mean = nanmean(lhs,1); 
sh_mean = nanmean(shs,1);  
rho_mean = nanmean(rhos,1);  
uf_mean = nanmean(ufs,1); 

[wp2_hom_topunit, thlp2_hom_topunit, rtp2_hom_topunit, rtpthlp_hom_topunit] = cal_hom(lh_mean, sh_mean, rho_mean, uf_mean);
[wp2_het_topunit, thlp2_het_topunit, rtp2_het_topunit, rtpthlp_het_topunit] = cal_het(f2ds, lhs, shs, rhos, tsas, qs, ufs);



shs = ncread(file_notop_topunit, 'FSH');
lhs = ncread(file_notop_topunit, 'EFLX_LH_TOT');
rhos = ncread(file_notop_topunit, 'RHO');
tsas = ncread(file_notop_topunit, 'TSA') ;
qs = ncread(file_notop_topunit, 'Q2M') ;
ufs = ncread(file_notop_topunit, 'ustar_patch') ;
shs = ncread(file_top_topunit, 'Qh');

f2ds = ones(size(ufs))/size(ufs,1);
lh_mean = nanmean(lhs,1); 
sh_mean = nanmean(shs,1);  
rho_mean = nanmean(rhos,1);  
uf_mean = nanmean(ufs,1); 

[wp2_hom_pp, thlp2_hom_pp_topunit, rtp2_hom_pp_topunit, rtpthlp_hom_pp_topunit] = cal_hom(lh_mean, sh_mean, rho_mean, uf_mean);
[wp2_het_pp, thlp2_het_pp_topunit, rtp2_het_pp_topunit, rtpthlp_het_pp_topunit] = cal_het(f2ds, lhs, shs, rhos, tsas, qs, ufs);
