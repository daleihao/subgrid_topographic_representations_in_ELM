clear all
close all
DataDir = 'data/';
file_top_1km = [DataDir 'elm_top_11years_1km_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];
file_notop_1km = [DataDir 'elm_notop_11years_1km_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];


%shs1 = ncread(file_top_1km, 'FSH');
lhs_top_1km = ncread(file_top_1km, 'EFLX_LH_TOT');
shs_top_1km = ncread(file_top_1km, 'Qh');

rhos_top_1km = ncread(file_top_1km, 'RHO');
tsas_top_1km = ncread(file_top_1km, 'TSA') ;

qs_top_1km = ncread(file_top_1km, 'Q2M') ;
ufs_top_1km = ncread(file_top_1km, 'ustar_patch') ;
Psurfs_top_1km = ncread(file_top_1km, 'PSurf');

%% reshape;
shs_top_1km=reshape(shs_top_1km, [], size(shs_top_1km,3),1);
lhs_top_1km=reshape(lhs_top_1km, [], size(lhs_top_1km,3),1);
rhos_top_1km=reshape(rhos_top_1km, [], size(rhos_top_1km,3),1);
tsas_top_1km=reshape(tsas_top_1km, [], size(tsas_top_1km,3),1);
qs_top_1km=reshape(qs_top_1km, [], size(qs_top_1km,3),1);
ufs_top_1km=reshape(ufs_top_1km, [], size(ufs_top_1km,3),1);
Psurfs_top_1km =reshape(Psurfs_top_1km, [], size(Psurfs_top_1km,3),1);

f2ds_top_1km = ones(size(ufs_top_1km))/size(ufs_top_1km,1);
lh_mean_top_1km = nanmean(lhs_top_1km,1); 
sh_mean_top_1km = nanmean(shs_top_1km,1);  
rho_mean_top_1km = nanmean(rhos_top_1km,1);  
uf_mean_top_1km = nanmean(ufs_top_1km,1); 

[wp2_hom_top_1km, thlp2_hom_top_1km, rtp2_hom_top_1km, rtpthlp_hom_top_1km] = cal_hom(lh_mean_top_1km, sh_mean_top_1km, rho_mean_top_1km, uf_mean_top_1km);
[wp2_het_top_1km, thlp2_het_top_1km, rtp2_het_top_1km, rtpthlp_het_top_1km] = cal_het(f2ds_top_1km, lhs_top_1km, shs_top_1km, rhos_top_1km, tsas_top_1km, qs_top_1km, ufs_top_1km, Psurfs_top_1km);



%shs = ncread(file_notop_1km, 'FSH');
lhs_pp_1km = ncread(file_notop_1km, 'EFLX_LH_TOT');
shs_pp_1km = ncread(file_notop_1km, 'Qh');
rhos_pp_1km = ncread(file_notop_1km, 'RHO');
tsas_pp_1km = ncread(file_notop_1km, 'TSA') ;
qs_pp_1km = ncread(file_notop_1km, 'Q2M') ;
ufs_pp_1km = ncread(file_notop_1km, 'ustar_patch') ;
Psurfs_pp_1km = ncread(file_notop_1km, 'PSurf');

%% reshape;
shs_pp_1km=reshape(shs_pp_1km, [], size(shs_pp_1km,3),1);
lhs_pp_1km=reshape(lhs_pp_1km, [], size(lhs_pp_1km,3),1);
rhos_pp_1km=reshape(rhos_pp_1km, [], size(rhos_pp_1km,3),1);
tsas_pp_1km=reshape(tsas_pp_1km, [], size(tsas_pp_1km,3),1);
qs_pp_1km=reshape(qs_pp_1km, [], size(qs_pp_1km,3),1);
ufs_pp_1km=reshape(ufs_pp_1km, [], size(ufs_pp_1km,3),1);
Psurfs_pp_1km =reshape(Psurfs_pp_1km, [], size(Psurfs_pp_1km,3),1);

f2ds_pp_1km = ones(size(ufs_pp_1km))/size(ufs_pp_1km,1);
lh_mean_pp_1km = nanmean(lhs_pp_1km,1); 
sh_mean_pp_1km = nanmean(shs_pp_1km,1);  
rho_mean_pp_1km = nanmean(rhos_pp_1km,1);  
uf_mean_pp_1km = nanmean(ufs_pp_1km,1); 

[wp2_hom_pp_1km, thlp2_hom_pp_1km, rtp2_hom_pp_1km, rtpthlp_hom_pp_1km] = cal_hom(lh_mean_pp_1km, sh_mean_pp_1km, rho_mean_pp_1km, uf_mean_pp_1km);
[wp2_het_pp_1km, thlp2_het_pp_1km, rtp2_het_pp_1km, rtpthlp_het_pp_1km] = cal_het(f2ds_pp_1km, lhs_pp_1km, shs_pp_1km, rhos_pp_1km, tsas_pp_1km, qs_pp_1km, ufs_pp_1km, Psurfs_pp_1km);

%% topunit 

load([DataDir 'Pecr_Topunit_1.mat']);

file_top_topunit = [DataDir 'elm_top_11years_topunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];
file_notop_topunit = [DataDir 'elm_notop_11years_topunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];


%shs1 = ncread(file_top_topunit, 'FSH');
lhs_top_topunit = ncread(file_top_topunit, 'EFLX_LH_TOT');
shs_top_topunit = ncread(file_top_topunit, 'Qh');

rhos_top_topunit = ncread(file_top_topunit, 'RHO');
tsas_top_topunit = ncread(file_top_topunit, 'TSA') ;

qs_top_topunit = ncread(file_top_topunit, 'Q2M') ;
ufs_top_topunit = ncread(file_top_topunit, 'ustar_patch') ;
Psurfs_top_topunit = ncread(file_top_topunit, 'PSurf');


f2ds_top_topunit = Perc_Topunit;
f2ds_top_topunit = repmat(f2ds_top_topunit, [1 12]);

lh_mean_top_topunit = nansum(lhs_top_topunit.*f2ds_top_topunit); 
sh_mean_top_topunit = nansum(shs_top_topunit.*f2ds_top_topunit);  
rho_mean_top_topunit = nansum(rhos_top_topunit.*f2ds_top_topunit);  
uf_mean_top_topunit = nansum(ufs_top_topunit.*f2ds_top_topunit); 

[wp2_hom_top_topunit, thlp2_hom_top_topunit, rtp2_hom_top_topunit, rtpthlp_hom_top_topunit] = cal_hom(lh_mean_top_topunit, sh_mean_top_topunit, rho_mean_top_topunit, uf_mean_top_topunit);
[wp2_het_top_topunit, thlp2_het_top_topunit, rtp2_het_top_topunit, rtpthlp_het_top_topunit] = cal_het(f2ds_top_topunit, lhs_top_topunit, shs_top_topunit, rhos_top_topunit, tsas_top_topunit, qs_top_topunit, ufs_top_topunit, Psurfs_top_topunit);



%shs = ncread(file_notop_topunit, 'FSH');
lhs_pp_topunit = ncread(file_notop_topunit, 'EFLX_LH_TOT');
shs_pp_topunit = ncread(file_notop_topunit, 'Qh');
rhos_pp_topunit = ncread(file_notop_topunit, 'RHO');
tsas_pp_topunit = ncread(file_notop_topunit, 'TSA') ;
qs_pp_topunit = ncread(file_notop_topunit, 'Q2M') ;
ufs_pp_topunit = ncread(file_notop_topunit, 'ustar_patch') ;
Psurfs_pp_topunit = ncread(file_notop_topunit, 'PSurf');


f2ds_pp_topunit = Perc_Topunit;
f2ds_pp_topunit = repmat(f2ds_pp_topunit, [1 12]);


lh_mean_pp_topunit = nanmean(lhs_pp_topunit,1); 
sh_mean_pp_topunit = nanmean(shs_pp_topunit,1);  
rho_mean_pp_topunit = nanmean(rhos_pp_topunit,1);  
uf_mean_pp_topunit = nanmean(ufs_pp_topunit,1); 

[wp2_hom_pp_topunit, thlp2_hom_pp_topunit, rtp2_hom_pp_topunit, rtpthlp_hom_pp_topunit] = cal_hom(lh_mean_pp_topunit, sh_mean_pp_topunit, rho_mean_pp_topunit, uf_mean_pp_topunit);
[wp2_het_pp_topunit, thlp2_het_pp_topunit, rtp2_het_pp_topunit, rtpthlp_het_pp_topunit] = cal_het(f2ds_pp_topunit, lhs_pp_topunit, shs_pp_topunit, rhos_pp_topunit, tsas_pp_topunit, qs_pp_topunit, ufs_pp_topunit, Psurfs_pp_topunit);



%% default
file_top_default = [DataDir 'elm_top_11years_default_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];
file_notop_default = [DataDir 'elm_notop_11years_default_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];


%shs1 = ncread(file_top_default, 'FSH');
lhs_top_default = ncread(file_top_default, 'EFLX_LH_TOT');
shs_top_default = ncread(file_top_default, 'Qh');

rhos_top_default = ncread(file_top_default, 'RHO');
tsas_top_default = ncread(file_top_default, 'TSA') ;

qs_top_default = ncread(file_top_default, 'Q2M') ;
ufs_top_default = ncread(file_top_default, 'ustar_patch') ;
Psurfs_top_default = ncread(file_top_default, 'PSurf');

f2ds_top_default = ncread(file_top_default, 'pfts1d_wtgcell');
f2ds_top_default = repmat(f2ds_top_default, [1 12]);

lh_mean_top_default = nansum(lhs_top_default.*f2ds_top_default); 
sh_mean_top_default = nansum(shs_top_default.*f2ds_top_default);  
rho_mean_top_default = nansum(rhos_top_default.*f2ds_top_default);  
uf_mean_top_default = nansum(ufs_top_default.*f2ds_top_default); 

[wp2_hom_top_default, thlp2_hom_top_default, rtp2_hom_top_default, rtpthlp_hom_top_default] = cal_hom(lh_mean_top_default, sh_mean_top_default, rho_mean_top_default, uf_mean_top_default);
[wp2_het_top_default, thlp2_het_top_default, rtp2_het_top_default, rtpthlp_het_top_default] = cal_het(f2ds_top_default, lhs_top_default, shs_top_default, rhos_top_default, tsas_top_default, qs_top_default, ufs_top_default, Psurfs_top_default);



%shs = ncread(file_notop_default, 'FSH');
lhs_pp_default = ncread(file_notop_default, 'EFLX_LH_TOT');
shs_pp_default = ncread(file_notop_default, 'Qh');
rhos_pp_default = ncread(file_notop_default, 'RHO');
tsas_pp_default = ncread(file_notop_default, 'TSA') ;
qs_pp_default = ncread(file_notop_default, 'Q2M') ;
ufs_pp_default = ncread(file_notop_default, 'ustar_patch') ;
Psurfs_pp_default = ncread(file_notop_default, 'PSurf');

f2ds_pp_default = ncread(file_notop_default, 'pfts1d_wtgcell');
f2ds_pp_default = repmat(f2ds_pp_default, [1 12]);

lh_mean_pp_default = nansum(lhs_pp_default.*f2ds_pp_default); 
sh_mean_pp_default = nansum(shs_pp_default.*f2ds_pp_default);  
rho_mean_pp_default = nansum(rhos_pp_default.*f2ds_pp_default);  
uf_mean_pp_default = nansum(ufs_pp_default.*f2ds_pp_default); 

[wp2_hom_pp_default, thlp2_hom_pp_default, rtp2_hom_pp_default, rtpthlp_hom_pp_default] = cal_hom(lh_mean_pp_default, sh_mean_pp_default, rho_mean_pp_default, uf_mean_pp_default);
[wp2_het_pp_default, thlp2_het_pp_default, rtp2_het_pp_default, rtpthlp_het_pp_default] = cal_het(f2ds_pp_default, lhs_pp_default, shs_pp_default, rhos_pp_default, tsas_pp_default, qs_pp_default, ufs_pp_default, Psurfs_pp_default);




%% plot thlp2
figure;
subplot(3,1,1)
hold on
plot(thlp2_hom_top_default, 'r-')
 plot(thlp2_het_top_default, 'b-')
% 
 plot(thlp2_hom_pp_default, 'r*')
plot(thlp2_het_pp_default, 'b*')

ylim([0 0.6])

subplot(3,1,2)
hold on
plot(thlp2_hom_top_topunit, 'r-')
 plot(thlp2_het_top_topunit, 'b-')
 plot(thlp2_hom_pp_topunit, 'r*')
plot(thlp2_het_pp_topunit, 'b*')
ylim([0 0.6])


subplot(3,1,3)
hold on
plot(thlp2_hom_top_1km, 'r-')
 plot(thlp2_het_top_1km, 'b-')
 plot(thlp2_hom_pp_1km, 'r*')
plot(thlp2_het_pp_1km, 'b*')

ylim([0 0.6])



%% rtpthlp
figure;
subplot(3,1,1)
hold on
plot(rtpthlp_hom_top_default, 'r-')
 plot(rtpthlp_het_top_default, 'b-')
% 
 plot(rtpthlp_hom_pp_default, 'r*')
plot(rtpthlp_het_pp_default, 'b*')

ylim([-1e-4 1e-4])

subplot(3,1,2)
hold on
plot(rtpthlp_hom_top_topunit, 'r-')
 plot(rtpthlp_het_top_topunit, 'b-')
 plot(rtpthlp_hom_pp_topunit, 'r*')
plot(rtpthlp_het_pp_topunit, 'b*')
ylim([-1e-4 1e-4])


subplot(3,1,3)
hold on
plot(rtpthlp_hom_top_1km, 'r-')
 plot(rtpthlp_het_top_1km, 'b-')
 plot(rtpthlp_hom_pp_1km, 'r*')
plot(rtpthlp_het_pp_1km, 'b*')

ylim([-1e-4 1e-4])


%% plot rtp2
figure;
subplot(3,1,1)
hold on
plot(rtp2_hom_top_default, 'r-')
 plot(rtp2_het_top_default, 'b-')
% 
 plot(rtp2_hom_pp_default, 'r*')
plot(rtp2_het_pp_default, 'b*')

ylim([0 8e-7])

subplot(3,1,2)
hold on
plot(rtp2_hom_top_topunit, 'r-')
 plot(rtp2_het_top_topunit, 'b-')
 plot(rtp2_hom_pp_topunit, 'r*')
plot(rtp2_het_pp_topunit, 'b*')
ylim([0 8e-7])


subplot(3,1,3)
hold on
plot(rtp2_hom_top_1km, 'r-')
 plot(rtp2_het_top_1km, 'b-')
 plot(rtp2_hom_pp_1km, 'r*')
plot(rtp2_het_pp_1km, 'b*')

ylim([0 8e-7])

%% plot wp2
figure;
subplot(3,1,1)
hold on
plot(wp2_hom_top_default, 'r-')
 plot(wp2_het_top_default, 'b-')
% 
 plot(wp2_hom_pp_default, 'r*')
plot(wp2_het_pp_default, 'b*')

ylim([0 1])

subplot(3,1,2)
hold on
plot(wp2_hom_top_topunit, 'r-')
 plot(wp2_het_top_topunit, 'b-')
 plot(wp2_hom_pp_topunit, 'r*')
plot(wp2_het_pp_topunit, 'b*')
ylim([0 1])


subplot(3,1,3)
hold on
plot(wp2_hom_top_1km, 'r-')
 plot(wp2_het_top_1km, 'b-')
 plot(wp2_hom_pp_1km, 'r*')
plot(wp2_het_pp_1km, 'b*')

ylim([0 1])

