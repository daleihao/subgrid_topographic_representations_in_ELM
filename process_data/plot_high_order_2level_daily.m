clear all
close all
DataDir = 'data/';

grid_i = 1;

file_1km = [DataDir 'all_daily_11year_average_1km_grid_' num2str(grid_i) '_plevel.mat'];

load(file_1km);

load('LC_ELM_Data_1km_soilgrid.mat');
LCs_tmp = LC_ELM_Data;
switch grid_i
    case 1
        LCs_tmp = LCs_tmp(1:50, 1:50);
    case 2
        LCs_tmp = LCs_tmp(1:50, 51:100);
    case 3
        LCs_tmp = LCs_tmp(51:100, 1:50);
    case 4
        LCs_tmp = LCs_tmp(51:100, 51:100);
end
LCs_tmp(LCs_tmp>16) = nan;
LCs_tmp(LCs_tmp>=0 & LCs_tmp<=16) = 1;

LCs_tmp = (flipud(LCs_tmp))';


lhs_tops_all(lhs_tops_all>150) = nan;
lhs_pps_all(lhs_pps_all>150) = nan;
for ss = 1:365
    
    lhs_tops_all(:,:,ss) = squeeze(lhs_tops_all(:,:,ss)).*LCs_tmp;
    shs_tops_all(:,:,ss)= squeeze(shs_tops_all(:,:,ss)).*LCs_tmp;
    rhos_tops_all(:,:,ss)= squeeze(rhos_tops_all(:,:,ss)).*LCs_tmp;
    tsas_tops_all(:,:,ss)= squeeze(tsas_tops_all(:,:,ss)).*LCs_tmp;
    qs_tops_all(:,:,ss)= squeeze(qs_tops_all(:,:,ss)).*LCs_tmp;
    ufs_tops_all(:,:,ss)= squeeze(ufs_tops_all(:,:,ss)).*LCs_tmp;
    psurfs_tops_all(:,:,ss)= squeeze(psurfs_tops_all(:,:,ss)).*LCs_tmp;
    
    lhs_pps_all(:,:,ss) = squeeze(lhs_pps_all(:,:,ss)).*LCs_tmp;
    shs_pps_all(:,:,ss)= squeeze(shs_pps_all(:,:,ss)).*LCs_tmp;
    rhos_pps_all(:,:,ss)= squeeze(rhos_pps_all(:,:,ss)).*LCs_tmp;
    tsas_pps_all(:,:,ss)= squeeze(tsas_pps_all(:,:,ss)).*LCs_tmp;
    qs_pps_all(:,:,ss)= squeeze(qs_pps_all(:,:,ss)).*LCs_tmp;
    ufs_pps_all(:,:,ss)= squeeze(ufs_pps_all(:,:,ss)).*LCs_tmp;
    psurfs_pps_all(:,:,ss)= squeeze(psurfs_pps_all(:,:,ss)).*LCs_tmp;    
end

lhs_top_1km = lhs_tops_all;
shs_top_1km = shs_tops_all;
rhos_top_1km = rhos_tops_all;
tsas_top_1km = tsas_tops_all;
qs_top_1km = qs_tops_all;
ufs_top_1km = ufs_tops_all;
Psurfs_top_1km = psurfs_tops_all;

%% reshape;
shs_top_1km=reshape(shs_top_1km, [], size(shs_top_1km,3),1);
lhs_top_1km=reshape(lhs_top_1km, [], size(lhs_top_1km,3),1);
rhos_top_1km=reshape(rhos_top_1km, [], size(rhos_top_1km,3),1);
tsas_top_1km=reshape(tsas_top_1km, [], size(tsas_top_1km,3),1);
qs_top_1km=reshape(qs_top_1km, [], size(qs_top_1km,3),1);
ufs_top_1km=reshape(ufs_top_1km, [], size(ufs_top_1km,3),1);
Psurfs_top_1km =reshape(Psurfs_top_1km, [], size(Psurfs_top_1km,3),1);

f2ds_top_1km = ones(size(ufs_top_1km))/nansum(LCs_tmp(:));
f2ds_top_1km = f2ds_top_1km.*LCs_tmp(:);
lh_mean_top_1km = nanmean(lhs_top_1km,1);
sh_mean_top_1km = nanmean(shs_top_1km,1);
rho_mean_top_1km = nanmean(rhos_top_1km,1);
uf_mean_top_1km = nanmean(ufs_top_1km,1);

[wp2_hom_top_1km, thlp2_hom_top_1km, rtp2_hom_top_1km, rtpthlp_hom_top_1km] = cal_hom(lh_mean_top_1km, sh_mean_top_1km, rho_mean_top_1km, uf_mean_top_1km);
[wp2_het_top_1km, thlp2_het_top_1km, rtp2_het_top_1km, rtpthlp_het_top_1km] = cal_het(f2ds_top_1km, lhs_top_1km, shs_top_1km, rhos_top_1km, tsas_top_1km, qs_top_1km, ufs_top_1km, Psurfs_top_1km);


%shs = ncread(file_notop_1km, 'FSH');
lhs_pp_1km = lhs_pps_all;
shs_pp_1km = shs_pps_all;
rhos_pp_1km = rhos_pps_all;
tsas_pp_1km = tsas_pps_all;
qs_pp_1km = qs_pps_all;
ufs_pp_1km = ufs_pps_all;
Psurfs_pp_1km = psurfs_pps_all;

%% reshape;
shs_pp_1km=reshape(shs_pp_1km, [], size(shs_pp_1km,3),1);
lhs_pp_1km=reshape(lhs_pp_1km, [], size(lhs_pp_1km,3),1);
rhos_pp_1km=reshape(rhos_pp_1km, [], size(rhos_pp_1km,3),1);
tsas_pp_1km=reshape(tsas_pp_1km, [], size(tsas_pp_1km,3),1);
qs_pp_1km=reshape(qs_pp_1km, [], size(qs_pp_1km,3),1);
ufs_pp_1km=reshape(ufs_pp_1km, [], size(ufs_pp_1km,3),1);
Psurfs_pp_1km =reshape(Psurfs_pp_1km, [], size(Psurfs_pp_1km,3),1);

f2ds_pp_1km = ones(size(ufs_pp_1km))/nansum(LCs_tmp(:));
f2ds_pp_1km = f2ds_pp_1km.*LCs_tmp(:);

lh_mean_pp_1km = nanmean(lhs_pp_1km,1);
sh_mean_pp_1km = nanmean(shs_pp_1km,1);
rho_mean_pp_1km = nanmean(rhos_pp_1km,1);
uf_mean_pp_1km = nanmean(ufs_pp_1km,1);

[wp2_hom_pp_1km, thlp2_hom_pp_1km, rtp2_hom_pp_1km, rtpthlp_hom_pp_1km] = cal_hom(lh_mean_pp_1km, sh_mean_pp_1km, rho_mean_pp_1km, uf_mean_pp_1km);
[wp2_het_pp_1km, thlp2_het_pp_1km, rtp2_het_pp_1km, rtpthlp_het_pp_1km] = cal_het(f2ds_pp_1km, lhs_pp_1km, shs_pp_1km, rhos_pp_1km, tsas_pp_1km, qs_pp_1km, ufs_pp_1km, Psurfs_pp_1km);

%% topunit

load([DataDir 'Pecr_Topunit_'   num2str(grid_i)  '.mat']);

file_topunit = [DataDir 'all_daily_11year_average_topunit_grid_' num2str(grid_i) '_plevel.mat'];

load(file_topunit);



%% pft num
file_top_default  = ['data/' 'elm_plevel_top_11years_topunit_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];
f2ds_top_pft = ncread(file_top_default, 'pfts1d_wtgcell');
f2ds_top_pft = repmat(f2ds_top_pft, 1, 1);

f2ds_top_grid = ncread(file_top_default, 'pfts1d_itype_veg');
nums_tmp = find(f2ds_top_grid == 1);
nums_tmp = [nums_tmp-1; size(f2ds_top_pft,1)+1];

%rhos_top_topunit = rhos_tops_all(1,1);
rhos_top_topunit = nan(size(lhs_tops_all,1), size(lhs_tops_all,2));
%Psurfs_top_topunit = psurfs_tops_all(1,1);
Psurfs_top_topunit = nan(size(lhs_tops_all,1), size(lhs_tops_all,2));

f2ds_top_topunit = zeros(size(f2ds_top_grid, 1),1);
     for tmp_i = 1:11
                tmp_t = f2ds_top_pft(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:);
                tmp_t(18:end) = 0;
                tmp_t = tmp_t/sum(tmp_t);
                tmp_t = tmp_t*Perc_Topunit(tmp_i);
                f2ds_top_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = tmp_t;
                sum(f2ds_top_pft(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:),1)
                rhos_top_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = repmat(rhos_tops_all(tmp_i,:),nums_tmp(tmp_i+1) - nums_tmp(tmp_i),1);
                Psurfs_top_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = repmat(psurfs_tops_all(tmp_i,:),nums_tmp(tmp_i+1) - nums_tmp(tmp_i),1);
                rhos_pp_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = repmat(rhos_pps_all(tmp_i,:),nums_tmp(tmp_i+1) - nums_tmp(tmp_i),1);
                Psurfs_pp_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = repmat(psurfs_pps_all(tmp_i,:),nums_tmp(tmp_i+1) - nums_tmp(tmp_i),1);

     end

f2ds_pp_ppunit = f2ds_top_topunit;

%shs1 = ncread(file_top_topunit, 'FSH');
lhs_top_topunit = lhs_tops_all;
shs_top_topunit = shs_tops_all;
tsas_top_topunit = tsas_tops_all;
qs_top_topunit = qs_tops_all;
ufs_top_topunit = ufs_tops_all;


%f2ds_top_topunit = Perc_Topunit;
%f2ds_top_topunit = repmat(f2ds_top_topunit, [1 12]);

lh_mean_top_topunit = nansum(lhs_top_topunit.*f2ds_top_topunit);
sh_mean_top_topunit = nansum(shs_top_topunit.*f2ds_top_topunit);
rho_mean_top_topunit = nansum(rhos_top_topunit.*f2ds_top_topunit);
uf_mean_top_topunit = nansum(ufs_top_topunit.*f2ds_top_topunit);


[wp2_hom_top_topunit, thlp2_hom_top_topunit, rtp2_hom_top_topunit, rtpthlp_hom_top_topunit] = cal_hom(lh_mean_top_topunit, sh_mean_top_topunit, rho_mean_top_topunit, uf_mean_top_topunit);
[wp2_het_top_topunit, thlp2_het_top_topunit, rtp2_het_top_topunit, rtpthlp_het_top_topunit] = cal_het(f2ds_top_topunit, lhs_top_topunit, shs_top_topunit, rhos_top_topunit, tsas_top_topunit, qs_top_topunit, ufs_top_topunit, Psurfs_top_topunit);



%shs = ncread(file_notop_topunit, 'FSH');
lhs_pp_topunit = lhs_pps_all;
shs_pp_topunit = shs_pps_all;
tsas_pp_topunit = tsas_pps_all;
qs_pp_topunit = qs_pps_all;
ufs_pp_topunit = ufs_pps_all;


%f2ds_pp_topunit = Perc_Topunit;
%f2ds_pp_topunit = repmat(f2ds_pp_topunit, [1 12]);
f2ds_pp_topunit=f2ds_top_topunit;


lh_mean_pp_topunit = nansum(lhs_pp_topunit.*f2ds_pp_topunit);
sh_mean_pp_topunit = nansum(shs_pp_topunit.*f2ds_pp_topunit);
rho_mean_pp_topunit = nansum(rhos_pp_topunit.*f2ds_pp_topunit);
uf_mean_pp_topunit = nansum(ufs_pp_topunit.*f2ds_pp_topunit);


[wp2_hom_pp_topunit, thlp2_hom_pp_topunit, rtp2_hom_pp_topunit, rtpthlp_hom_pp_topunit] = cal_hom(lh_mean_pp_topunit, sh_mean_pp_topunit, rho_mean_pp_topunit, uf_mean_pp_topunit);
[wp2_het_pp_topunit, thlp2_het_pp_topunit, rtp2_het_pp_topunit, rtpthlp_het_pp_topunit] = cal_het(f2ds_pp_topunit, lhs_pp_topunit, shs_pp_topunit, rhos_pp_topunit, tsas_pp_topunit, qs_pp_topunit, ufs_pp_topunit, Psurfs_pp_topunit);



%% default
file_top_default = [DataDir 'elm_top_11years_default_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];


file_default = [DataDir 'all_daily_11year_average_default_grid_' num2str(grid_i) '_plevel.mat'];

load(file_default);


%shs1 = ncread(file_top_default, 'FSH');
lhs_top_default = lhs_tops_all;
shs_top_default = shs_tops_all;
rhos_top_default = rhos_tops_all;
tsas_top_default = tsas_tops_all;
qs_top_default = qs_tops_all;
ufs_top_default = ufs_tops_all;
Psurfs_top_default = psurfs_tops_all;

f2ds_top_default = ncread(file_top_default, 'pfts1d_wtgcell');
f2ds_top_default(18:end) = 0;
f2ds_top_default = f2ds_top_default/nansum(f2ds_top_default);

%f2ds_top_default = repmat(f2ds_top_default, [1 12]);

lh_mean_top_default = nansum(lhs_top_default.*f2ds_top_default);
sh_mean_top_default = nansum(shs_top_default.*f2ds_top_default);
rho_mean_top_default = nansum(rhos_top_default.*f2ds_top_default);
uf_mean_top_default = nansum(ufs_top_default.*f2ds_top_default);

[wp2_hom_top_default, thlp2_hom_top_default, rtp2_hom_top_default, rtpthlp_hom_top_default] = cal_hom(lh_mean_top_default, sh_mean_top_default, rho_mean_top_default, uf_mean_top_default);
[wp2_het_top_default, thlp2_het_top_default, rtp2_het_top_default, rtpthlp_het_top_default] = cal_het(f2ds_top_default, lhs_top_default, shs_top_default, rhos_top_default, tsas_top_default, qs_top_default, ufs_top_default, Psurfs_top_default);



%shs = ncread(file_notop_default, 'FSH');
lhs_pp_default = lhs_pps_all;
shs_pp_default = shs_pps_all;
rhos_pp_default = rhos_pps_all;
tsas_pp_default = tsas_pps_all;
qs_pp_default = qs_pps_all;
ufs_pp_default = ufs_pps_all;
Psurfs_pp_default = psurfs_pps_all;

%f2ds_pp_default = ncread(file_top_default, 'pfts1d_wtgcell');
%f2ds_pp_default = repmat(f2ds_pp_default, [1 12]);
f2ds_pp_default = f2ds_top_default;

lh_mean_pp_default = nansum(lhs_pp_default.*f2ds_pp_default);
sh_mean_pp_default = nansum(shs_pp_default.*f2ds_pp_default);
rho_mean_pp_default = nansum(rhos_pp_default.*f2ds_pp_default);
uf_mean_pp_default = nansum(ufs_pp_default.*f2ds_pp_default);

[wp2_hom_pp_default, thlp2_hom_pp_default, rtp2_hom_pp_default, rtpthlp_hom_pp_default] = cal_hom(lh_mean_pp_default, sh_mean_pp_default, rho_mean_pp_default, uf_mean_pp_default);
[wp2_het_pp_default, thlp2_het_pp_default, rtp2_het_pp_default, rtpthlp_het_pp_default] = cal_het(f2ds_pp_default, lhs_pp_default, shs_pp_default, rhos_pp_default, tsas_pp_default, qs_pp_default, ufs_pp_default, Psurfs_pp_default);




%% plot thlp2
figure;
subplot(2,2,1)
hold on
plot(thlp2_het_top_1km(1:365)-thlp2_het_pp_1km(1:365), 'r-','linewidth',1)
plot(thlp2_het_pp_topunit(1:365)-thlp2_het_pp_1km(1:365), 'g-','linewidth',1)
plot(thlp2_het_pp_default(1:365)-thlp2_het_pp_1km(1:365), 'b-','linewidth',1)
%legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
title('Temperature Variance Difference')
box on
xlabel('DOY')
ylim([-0.3 0.3])

xlim([1 365])
set(gca,'linewidth',1)


%% rtpthlp
subplot(2,2,2)
hold on
plot(rtpthlp_het_top_1km(1:365)-rtpthlp_het_pp_1km(1:365), 'r-','linewidth',1)
plot(rtpthlp_het_pp_topunit(1:365)-rtpthlp_het_pp_1km(1:365), 'g-','linewidth',1)
plot(rtpthlp_het_pp_default(1:365)-rtpthlp_het_pp_1km(1:365), 'b-','linewidth',1)
%legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
title('Temp. Moist. Covariance')
ylim([-1e-4 1e-4])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)


%% plot rtp2
subplot(2,2,3)
hold on
plot(rtp2_het_top_1km(1:365)-rtp2_het_pp_1km(1:365), 'r-','linewidth',1)
plot(rtp2_het_pp_topunit(1:365)-rtp2_het_pp_1km(1:365), 'g-','linewidth',1)
plot(rtp2_het_pp_default(1:365)-rtp2_het_pp_1km(1:365), 'b-','linewidth',1)
%legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
title('Moisture Covariance')
ylim([-2e-7 2e-7])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)

%% plot wp2
subplot(2,2,4)
hold on
plot(wp2_het_top_1km(1:365)-wp2_het_pp_1km(1:365), 'r-','linewidth',1)
plot(wp2_het_pp_topunit(1:365)-wp2_het_pp_1km(1:365), 'g-','linewidth',1)
plot(wp2_het_pp_default(1:365)-wp2_het_pp_1km(1:365), 'b-','linewidth',1)
legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP','Location','South')
title('Vertical Velocity Variance')
ylim([-0.1 0.1])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)
print(gcf, '-dsvg', '-r300', ['figures_all/high_order_difference.svg'])
        %         close all
%% all
%%%%%%%%%%%%%%%%%%%%%%%%
%% plot thlp2
figure;
subplot(2,2,1)

hold on
plot(thlp2_het_top_1km(1:365), 'k-','linewidth',1)
plot(thlp2_het_pp_1km(1:365), 'r-','linewidth',1)
plot(thlp2_het_pp_topunit(1:365), 'g-','linewidth',1)
plot(thlp2_het_pp_default(1:365), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Temperature Variance')
ylim([0 0.6])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)


%% rtpthlp
subplot(2,2,2)
hold on
plot(rtpthlp_het_top_1km(1:365), 'k-','linewidth',1)
plot(rtpthlp_het_pp_1km(1:365), 'r-','linewidth',1)
plot(rtpthlp_het_pp_topunit(1:365), 'g-','linewidth',1)
plot(rtpthlp_het_pp_default(1:365), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Temp. Moist. Covariance')
ylim([-1e-4 1e-4])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)


%% plot rtp2
subplot(2,2,3)
hold on
plot(rtp2_het_top_1km(1:365), 'k-','linewidth',1)
plot(rtp2_het_pp_1km(1:365), 'r-','linewidth',1)
plot(rtp2_het_pp_topunit(1:365), 'g-','linewidth',1)
plot(rtp2_het_pp_default(1:365), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Moisture Covariance')
ylim([0e-4 4e-7])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)

%% plot wp2
subplot(2,2,4)
hold on
plot(wp2_het_top_1km(1:365), 'k-','linewidth',1)
plot(wp2_het_pp_1km(1:365), 'r-','linewidth',1)
plot(wp2_het_pp_topunit(1:365), 'g-','linewidth',1)
plot(wp2_het_pp_default(1:365), 'b-','linewidth',1)
legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP','Location','NorthEast')
title('Vertical Velocity Variance')
ylim([0 0.5])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)
print(gcf, '-dsvg', '-r300', ['figures_all/high_order.svg'])


%% hourly
%% plot thlp2
figure;
subplot(2,2,1)
hold on
plot(thlp2_hom_top_1km(1:365)-thlp2_hom_pp_1km(1:365), 'r-','linewidth',1)
plot(thlp2_hom_pp_topunit(1:365)-thlp2_hom_pp_1km(1:365), 'g-','linewidth',1)
plot(thlp2_hom_pp_default(1:365)-thlp2_hom_pp_1km(1:365), 'b-','linewidth',1)
%legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
title('Temperature Variance Difference')
box on
xlabel('DOY')
xlim([1 365])
ylim([-0.3 0.3])
set(gca,'linewidth',1)


%% rtpthlp
subplot(2,2,2)
hold on
plot(rtpthlp_hom_top_1km(1:365)-rtpthlp_hom_pp_1km(1:365), 'r-','linewidth',1)
plot(rtpthlp_hom_pp_topunit(1:365)-rtpthlp_hom_pp_1km(1:365), 'g-','linewidth',1)
plot(rtpthlp_hom_pp_default(1:365)-rtpthlp_hom_pp_1km(1:365), 'b-','linewidth',1)
%legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
title('Temp. Moist. Covariance')
ylim([-1e-4 1e-4])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)


%% plot rtp2
subplot(2,2,3)
hold on
plot(rtp2_hom_top_1km(1:365)-rtp2_hom_pp_1km(1:365), 'r-','linewidth',1)
plot(rtp2_hom_pp_topunit(1:365)-rtp2_hom_pp_1km(1:365), 'g-','linewidth',1)
plot(rtp2_hom_pp_default(1:365)-rtp2_hom_pp_1km(1:365), 'b-','linewidth',1)
%legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
title('Moisture Covariance')
ylim([-2e-7 2e-7])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)

%% plot wp2
subplot(2,2,4)
hold on
plot(wp2_hom_top_1km(1:365)-wp2_hom_pp_1km(1:365), 'r-','linewidth',1)
plot(wp2_hom_pp_topunit(1:365)-wp2_hom_pp_1km(1:365), 'g-','linewidth',1)
plot(wp2_hom_pp_default(1:365)-wp2_hom_pp_1km(1:365), 'b-','linewidth',1)
legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP','Location','South')
title('Vertical Velocity Variance')
ylim([-0.1 0.1])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)
print(gcf, '-dsvg', '-r300', ['figures_all/hom_high_order_difference.svg'])
        %         close all
%% all
%%%%%%%%%%%%%%%%%%%%%%%%
%% plot thlp2
figure;
subplot(2,2,1)

hold on
plot(thlp2_hom_top_1km(1:365), 'k-','linewidth',1)
plot(thlp2_hom_pp_1km(1:365), 'r-','linewidth',1)
plot(thlp2_hom_pp_topunit(1:365), 'g-','linewidth',1)
plot(thlp2_hom_pp_default(1:365), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Temperature Variance')
ylim([0 0.6])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)


%% rtpthlp
subplot(2,2,2)
hold on
plot(rtpthlp_hom_top_1km(1:365), 'k-','linewidth',1)
plot(rtpthlp_hom_pp_1km(1:365), 'r-','linewidth',1)
plot(rtpthlp_hom_pp_topunit(1:365), 'g-','linewidth',1)
plot(rtpthlp_hom_pp_default(1:365), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Temp. Moist. Covariance')
ylim([-1e-4 1e-4])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)


%% plot rtp2
subplot(2,2,3)
hold on
plot(rtp2_hom_top_1km(1:365), 'k-','linewidth',1)
plot(rtp2_hom_pp_1km(1:365), 'r-','linewidth',1)
plot(rtp2_hom_pp_topunit(1:365), 'g-','linewidth',1)
plot(rtp2_hom_pp_default(1:365), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Moisture Covariance')
ylim([0e-4 4e-7])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)

%% plot wp2
subplot(2,2,4)
hold on
plot(wp2_hom_top_1km(1:365), 'k-','linewidth',1)
plot(wp2_hom_pp_1km(1:365), 'r-','linewidth',1)
plot(wp2_hom_pp_topunit(1:365), 'g-','linewidth',1)
plot(wp2_hom_pp_default(1:365), 'b-','linewidth',1)
legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP','Location','NorthEast')
title('Vertical Velocity Variance')
ylim([0 0.5])
box on
xlabel('DOY')
xlim([1 365])
set(gca,'linewidth',1)
print(gcf, '-dsvg', '-r300', ['figures_all/hom_high_order.svg'])
