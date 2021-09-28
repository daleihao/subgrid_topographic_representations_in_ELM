file_top_1km = 'top_11years_1km_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2006-02-01-00000.nc';
file_notop_1km = 'notop_11years_1km_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2006-02-01-00000.nc';

file_top_topunit = 'top_11years_topunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2006-02-01-00000.nc';
file_notop_topunit = 'notop_11years_topunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2006-02-01-00000.nc';

file_top_notopunit = 'top_11years_notopunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2006-02-01-00000.nc';
file_notop_notopunit = 'notop_11years_notopunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h2.2006-02-01-00000.nc';


%% %%%%%%%%%%%% 1km

%% FSA
FSA_top_1km = double(ncread(file_top_1km, 'FSA'));
FSA_notop_1km = double(ncread(file_notop_1km, 'FSA'));

FSA_top_1km_2 = squeeze(FSA_top_1km(:,:,2));
FSA_notop_1km_2= squeeze(FSA_notop_1km(:,:,2));

FSA_top_1km_2 = flipud(FSA_top_1km_2');
FSA_notop_1km_2 = flipud(FSA_notop_1km_2');


%% snow cover
FSNO_top_1km = double(ncread(file_top_1km, 'FSNO'));
FSNO_notop_1km = double(ncread(file_notop_1km, 'FSNO'));

FSNO_top_1km_2 = squeeze(FSNO_top_1km(:,:,2));
FSNO_notop_1km_2= squeeze(FSNO_notop_1km(:,:,2));

FSNO_top_1km_2 = flipud(FSNO_top_1km_2');
FSNO_notop_1km_2 = flipud(FSNO_notop_1km_2');


%% FSH
FSH_top_1km = double(ncread(file_top_1km, 'FSH'));
FSH_notop_1km = double(ncread(file_notop_1km, 'FSH'));

FSH_top_1km_2 = squeeze(FSH_top_1km(:,:,2));
FSH_notop_1km_2= squeeze(FSH_notop_1km(:,:,2));

FSH_top_1km_2 = flipud(FSH_top_1km_2');
FSH_notop_1km_2 = flipud(FSH_notop_1km_2');


%% FPSN
FPSN_top_1km = double(ncread(file_top_1km, 'FPSN'));
FPSN_notop_1km = double(ncread(file_notop_1km, 'FPSN'));

FPSN_top_1km_2 = squeeze(FPSN_top_1km(:,:,2));
FPSN_notop_1km_2= squeeze(FPSN_notop_1km(:,:,2));

FPSN_top_1km_2 = flipud(FPSN_top_1km_2');
FPSN_notop_1km_2 = flipud(FPSN_notop_1km_2');

%% LH
LH_top_1km = double(ncread(file_top_1km, 'EFLX_LH_TOT'));
LH_notop_1km = double(ncread(file_notop_1km, 'EFLX_LH_TOT'));

LH_top_1km_2 = squeeze(LH_top_1km(:,:,2));
LH_notop_1km_2= squeeze(LH_notop_1km(:,:,2));

LH_top_1km_2 = flipud(LH_top_1km_2');
LH_notop_1km_2 = flipud(LH_notop_1km_2');


%% plot

res_h = 1/100;
res_v = 1/100;
lon = (-120.5+res_h/2):res_h: (-120-res_h/2);
lat = (39-res_v/2):-res_v: (38.5+res_v/2);

[lons,lats]=meshgrid(lon,lat);


%% FSA
colors = flipud(brewermap(16, 'Spectral'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FSA_top_1km_2, 200, 300, "FSA TOP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FSA_TOP_8.svg')

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FSA_notop_1km_2, 200, 299, "FSA PP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FSA_PP_8.svg')


%% difference
colors = flipud(brewermap(16, 'BrBG'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FSA_top_1km_2 - FSA_notop_1km_2, -30, 30, "FSA TOP-PP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FSA_difference_8.svg')



%% FSH
colors = flipud(brewermap(16, 'Spectral'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FSH_top_1km_2, 0, 200, "FSH TOP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FSH_TOP_8.svg')

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FSH_notop_1km_2, 0, 200, "FSH PP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FSH_PP_8.svg')



%% difference
colors = flipud(brewermap(16, 'BrBG'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FSH_top_1km_2 - FSH_notop_1km_2, -30, 30, "FSH TOP-PP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FSH_difference_8.svg')



%% SNOW
colors = flipud(brewermap(16, 'Spectral'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FSNO_top_1km_2, 0, 0.1, "FSNO TOP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FSNO_TOP_8.svg')

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FSNO_notop_1km_2, 0, 0.1, "FSNO PP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FSNO_PP_8.svg')


%% difference
colors = flipud(brewermap(16, 'BrBG'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FSNO_top_1km_2 - FSNO_notop_1km_2, -0.1, 0.1, "FSNO TOP-PP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FSNO_difference_8.svg')

close all


%% FPSN
colors = flipud(brewermap(16, 'Spectral'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FPSN_top_1km_2, 0, 3, "FPSN TOP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FPSN_TOP_8.svg')

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FPSN_notop_1km_2, 0, 3, "FPSN PP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FPSN_PP_8.svg')


%% difference
colors = flipud(brewermap(16, 'BrBG'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, FPSN_top_1km_2 - FPSN_notop_1km_2, -0.3, 0.3, "FPSN TOP-PP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/FPSN_difference_8.svg')


%% LH
colors = flipud(brewermap(16, 'Spectral'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, LH_top_1km_2, 200, 300, "LH TOP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/LH_TOP_8.svg')

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, LH_notop_1km_2, 200, 299, "LH PP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/LH_PP_8.svg')

%% difference
colors = flipud(brewermap(16, 'BrBG'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, LH_top_1km_2 - LH_notop_1km_2, -30, 30, "LH TOP-PP", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/LH_difference_8.svg')


close all
