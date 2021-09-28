clear all
close all
DataDir = 'data/';

grid_i = 1;

file_1km = [DataDir '11year_average_1km_grid_' num2str(grid_i) '_plevel.mat'];

load(file_1km);

lhs_top_1km = lhs_tops;
shs_top_1km = shs_tops;
rhos_top_1km = rhos_tops;
tsas_top_1km = tsas_tops;
qs_top_1km = qs_tops;
ufs_top_1km = ufs_tops;
Psurfs_top_1km = psurfs_tops;

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
lhs_pp_1km = lhs_pps;
shs_pp_1km = shs_pps;
rhos_pp_1km = rhos_pps;
tsas_pp_1km = tsas_pps;
qs_pp_1km = qs_pps;
ufs_pp_1km = ufs_pps;
Psurfs_pp_1km = psurfs_pps;

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

load([DataDir 'Pecr_Topunit_'   num2str(grid_i)  '.mat']);

file_topunit = [DataDir '11year_average_topunit_grid_' num2str(grid_i) '_plevel.mat'];

load(file_topunit);



%% pft num
file_top_default  = ['data/' 'elm_plevel_top_11years_topunit_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];
f2ds_top_pft = ncread(file_top_default, 'pfts1d_wtgcell');
f2ds_top_pft = repmat(f2ds_top_pft, 1, 1);

f2ds_top_grid = ncread(file_top_default, 'pfts1d_itype_veg');
nums_tmp = find(f2ds_top_grid == 1);
nums_tmp = [nums_tmp-1; size(f2ds_top_pft,1)+1];


f2ds_top_topunit = zeros(size(f2ds_top_grid, 1),1);
for tmp_i = 1:11
    f2ds_top_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = f2ds_top_pft(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:)*Perc_Topunit(tmp_i);
    sum(f2ds_top_pft(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:),1)
end

f2ds_pp_ppunit = f2ds_top_topunit;

%shs1 = ncread(file_top_topunit, 'FSH');
lhs_top_topunit = lhs_tops;
shs_top_topunit = shs_tops;
rhos_top_topunit = rhos_tops(1,1);
rhos_top_topunit = repmat(rhos_top_topunit, size(lhs_top_topunit,1), size(lhs_top_topunit,2));
tsas_top_topunit = tsas_tops;
qs_top_topunit = qs_tops;
ufs_top_topunit = ufs_tops;
Psurfs_top_topunit = psurfs_tops(1,1);
Psurfs_top_topunit = repmat(Psurfs_top_topunit, size(lhs_top_topunit,1), size(lhs_top_topunit,2));


%f2ds_top_topunit = Perc_Topunit;
%f2ds_top_topunit = repmat(f2ds_top_topunit, [1 12]);

lh_mean_top_topunit = nansum(lhs_top_topunit.*f2ds_top_topunit);
sh_mean_top_topunit = nansum(shs_top_topunit.*f2ds_top_topunit);
rho_mean_top_topunit = nansum(rhos_top_topunit.*f2ds_top_topunit);
uf_mean_top_topunit = nansum(ufs_top_topunit.*f2ds_top_topunit);

[wp2_hom_top_topunit, thlp2_hom_top_topunit, rtp2_hom_top_topunit, rtpthlp_hom_top_topunit] = cal_hom(lh_mean_top_topunit, sh_mean_top_topunit, rho_mean_top_topunit, uf_mean_top_topunit);
[wp2_het_top_topunit, thlp2_het_top_topunit, rtp2_het_top_topunit, rtpthlp_het_top_topunit] = cal_het(f2ds_top_topunit, lhs_top_topunit, shs_top_topunit, rhos_top_topunit, tsas_top_topunit, qs_top_topunit, ufs_top_topunit, Psurfs_top_topunit);



%shs = ncread(file_notop_topunit, 'FSH');
lhs_pp_topunit = lhs_pps;
shs_pp_topunit = shs_pps;
rhos_pp_topunit = rhos_pps(1,1);
rhos_pp_topunit = repmat(rhos_pp_topunit, size(lhs_pp_topunit,1), size(lhs_pp_topunit,2));
tsas_pp_topunit = tsas_pps;
qs_pp_topunit = qs_pps;
ufs_pp_topunit = ufs_pps;
Psurfs_pp_topunit = psurfs_pps(1,1);
Psurfs_pp_topunit = repmat(Psurfs_pp_topunit, size(lhs_pp_topunit,1), size(lhs_pp_topunit,2));


%f2ds_pp_topunit = Perc_Topunit;
%f2ds_pp_topunit = repmat(f2ds_pp_topunit, [1 12]);
f2ds_pp_topunit=f2ds_top_topunit;


lh_mean_pp_topunit = nanmean(lhs_pp_topunit,1);
sh_mean_pp_topunit = nanmean(shs_pp_topunit,1);
rho_mean_pp_topunit = nanmean(rhos_pp_topunit,1);
uf_mean_pp_topunit = nanmean(ufs_pp_topunit,1);

[wp2_hom_pp_topunit, thlp2_hom_pp_topunit, rtp2_hom_pp_topunit, rtpthlp_hom_pp_topunit] = cal_hom(lh_mean_pp_topunit, sh_mean_pp_topunit, rho_mean_pp_topunit, uf_mean_pp_topunit);
[wp2_het_pp_topunit, thlp2_het_pp_topunit, rtp2_het_pp_topunit, rtpthlp_het_pp_topunit] = cal_het(f2ds_pp_topunit, lhs_pp_topunit, shs_pp_topunit, rhos_pp_topunit, tsas_pp_topunit, qs_pp_topunit, ufs_pp_topunit, Psurfs_pp_topunit);



%% default
file_top_default = [DataDir 'elm_top_11years_default_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];


file_default = [DataDir '11year_average_default_grid_' num2str(grid_i) '_plevel.mat'];

load(file_default);


%shs1 = ncread(file_top_default, 'FSH');
lhs_top_default = lhs_tops;
shs_top_default = shs_tops;
rhos_top_default = rhos_tops;
tsas_top_default = tsas_tops;
qs_top_default = qs_tops;
ufs_top_default = ufs_tops;
Psurfs_top_default = psurfs_tops;

f2ds_top_default = ncread(file_top_default, 'pfts1d_wtgcell');
f2ds_top_default = repmat(f2ds_top_default, [1 12]);

lh_mean_top_default = nansum(lhs_top_default.*f2ds_top_default);
sh_mean_top_default = nansum(shs_top_default.*f2ds_top_default);
rho_mean_top_default = nansum(rhos_top_default.*f2ds_top_default);
uf_mean_top_default = nansum(ufs_top_default.*f2ds_top_default);

[wp2_hom_top_default, thlp2_hom_top_default, rtp2_hom_top_default, rtpthlp_hom_top_default] = cal_hom(lh_mean_top_default, sh_mean_top_default, rho_mean_top_default, uf_mean_top_default);
[wp2_het_top_default, thlp2_het_top_default, rtp2_het_top_default, rtpthlp_het_top_default] = cal_het(f2ds_top_default, lhs_top_default, shs_top_default, rhos_top_default, tsas_top_default, qs_top_default, ufs_top_default, Psurfs_top_default);



%shs = ncread(file_notop_default, 'FSH');
lhs_pp_default = lhs_pps;
shs_pp_default = shs_pps;
rhos_pp_default = rhos_pps;
tsas_pp_default = tsas_pps;
qs_pp_default = qs_pps;
ufs_pp_default = ufs_pps;
Psurfs_pp_default = psurfs_pps;

f2ds_pp_default = ncread(file_top_default, 'pfts1d_wtgcell');
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
title('default')

ylim([0 0.6])
legend('hom top','het top','hom pp', 'het pp')
subplot(3,1,2)
hold on
plot(thlp2_hom_top_topunit, 'r-')
plot(thlp2_het_top_topunit, 'b-')
plot(thlp2_hom_pp_topunit, 'r*')
plot(thlp2_het_pp_topunit, 'b*')
ylim([0 0.6])

title('topunit')

subplot(3,1,3)
hold on
plot(thlp2_hom_top_1km, 'r-')
plot(thlp2_het_top_1km, 'b-')
plot(thlp2_hom_pp_1km, 'r*')
plot(thlp2_het_pp_1km, 'b*')

ylim([0 0.6])

title('1km')


%% rtpthlp
figure;
subplot(3,1,1)
hold on
plot(rtpthlp_hom_top_default, 'r-')
plot(rtpthlp_het_top_default, 'b-')
%
plot(rtpthlp_hom_pp_default, 'r*')
plot(rtpthlp_het_pp_default, 'b*')
title('default')

legend('hom top','het top','hom pp', 'het pp')

ylim([-1e-4 1e-4])

subplot(3,1,2)
hold on
plot(rtpthlp_hom_top_topunit, 'r-')
plot(rtpthlp_het_top_topunit, 'b-')
plot(rtpthlp_hom_pp_topunit, 'r*')
plot(rtpthlp_het_pp_topunit, 'b*')
ylim([-1e-4 1e-4])
title('topunit')


subplot(3,1,3)
hold on
plot(rtpthlp_hom_top_1km, 'r-')
plot(rtpthlp_het_top_1km, 'b-')
plot(rtpthlp_hom_pp_1km, 'r*')
plot(rtpthlp_het_pp_1km, 'b*')

ylim([-1e-4 1e-4])
title('1km')


%% plot rtp2
figure;
subplot(3,1,1)
hold on
plot(rtp2_hom_top_default, 'r-')
plot(rtp2_het_top_default, 'b-')
%
plot(rtp2_hom_pp_default, 'r*')
plot(rtp2_het_pp_default, 'b*')
title('default')

ylim([0 8e-7])
legend('hom top','het top','hom pp', 'het pp')

subplot(3,1,2)
hold on
plot(rtp2_hom_top_topunit, 'r-')
plot(rtp2_het_top_topunit, 'b-')
plot(rtp2_hom_pp_topunit, 'r*')
plot(rtp2_het_pp_topunit, 'b*')
ylim([0 8e-7])
title('topunit')


subplot(3,1,3)
hold on
plot(rtp2_hom_top_1km, 'r-')
plot(rtp2_het_top_1km, 'b-')
plot(rtp2_hom_pp_1km, 'r*')
plot(rtp2_het_pp_1km, 'b*')

ylim([0 8e-7])
title('1km')

%% plot wp2
figure;
subplot(3,1,1)
hold on
plot(wp2_hom_top_default, 'r-')
plot(wp2_het_top_default, 'b-')
%
plot(wp2_hom_pp_default, 'r*')
plot(wp2_het_pp_default, 'b*')
title('default')

ylim([0 1])
legend('hom top','het top','hom pp', 'het pp')

subplot(3,1,2)
hold on
plot(wp2_hom_top_topunit, 'r-')
plot(wp2_het_top_topunit, 'b-')
plot(wp2_hom_pp_topunit, 'r*')
plot(wp2_het_pp_topunit, 'b*')
ylim([0 1])

title('topunit')

subplot(3,1,3)
hold on
plot(wp2_hom_top_1km, 'r-')
plot(wp2_het_top_1km, 'b-')
plot(wp2_hom_pp_1km, 'r*')
plot(wp2_het_pp_1km, 'b*')

ylim([0 1])
title('1km')

