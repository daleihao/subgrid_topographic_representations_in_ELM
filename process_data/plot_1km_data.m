res_h = 1/100;
res_v = 1/100;
lon = (-120.5+res_h/2):res_h: (-119.5-res_h/2);
lat = (39-res_v/2):-res_v: (38+res_v/2);

[lons,lats]=meshgrid(lon,lat);


%% read Data_Top_PFT
res_h = 1/223;
res_v = 1/223;

lon = (-120.5+res_h/2):res_h: (-119.5-res_h/2);
lat = (39-res_v/2):-res_v: (38+res_v/2);

[lons_2,lats_2]=meshgrid(lon,lat);

TopData = double(geotiffread('topography/ROI_Top_500.tif'));
ElevationData = squeeze(TopData(:,:,1));
SlopeData = squeeze(TopData(:,:,2));
AspectData = squeeze(TopData(:,:,3));

ElevationData = griddata(lons_2,lats_2,ElevationData,lons,lats,'linear');
SlopeData = griddata(lons_2,lats_2,SlopeData,lons,lats,'linear');
AspectData = griddata(lons_2,lats_2,AspectData,lons,lats,'linear');


% for aspect
AspectData(AspectData>=315 + 22.5 | AspectData< 22.5) = 1;
AspectData(AspectData>=22.5 & AspectData<45 + 22.5) = 2;
AspectData(AspectData>=45 + 22.5 & AspectData<90 + 22.5) = 3;
AspectData(AspectData>=90 + 22.5 & AspectData<135 + 22.5) = 4;
AspectData(AspectData>=135 + 22.5 & AspectData<180 + 22.5) = 5;
AspectData(AspectData>=180 + 22.5 & AspectData<225 + 22.5) = 6;
AspectData(AspectData>=225 + 22.5 & AspectData<270 + 22.5) = 7;
AspectData(AspectData>=270 + 22.5 & AspectData<315 + 22.5) = 8;



%% plot
colors = flipud(brewermap(16, 'Spectral'));

% elevation
figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, ElevationData, 0, 4000, "Elevation", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/ROI_Elevation.svg')

%% Slope

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.2,0.3]);
set(gca, 'Position', [0.1 0.05 0.9 0.9])

plot_global_map(lats, lons, SlopeData, 0, 30, "Slope", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/ROI_Slope.svg')

%% Aspect
colors = flipud(brewermap(8, 'Spectral'));

figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.2,0.3]);
set(gca, 'Position', [0.1 0.05 0.9 0.9])

plot_global_map(lats, lons, AspectData, 1, 8, "Aspect", colors, 1, 1);
cbh = colorbar;
cbh.Ticks = linspace(1, 8, 8) ; %Create 8 ticks from zero to 1
 cbh.TickLabels = {'N','WN','W','WS','S','ES','E','EN'}; 
print(gcf, '-dsvg', '-r300', 'figures/ROI_Aspect.svg')

close all

%% plot top

load('Top_1km.mat');
colors = flipud(brewermap(16, 'Spectral'));

% elevation
figure;
set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, SINSL_COSAS, -0.3, 0.3, "SINSL-COSAS", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/ROI_SINSL_COSAS.svg')


% elevation
figure;
set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, SINSL_SINAS, -0.3, 0.3, "SINSL-SINAS", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/ROI_SINSL_SINAS.svg')


% elevation
figure;
set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, SKY_VIEW, 0.9, 1, "SKY-VIEW", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/SKY_VIEW.svg')


% elevation
figure;
set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, STDEV_ELEV, 0, 3000, "STDEV-ELEV", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/ROI_STDEV_ELEV.svg')


% elevation
figure;
set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, TERRAIN_CONFIG, 0, 0.2, "TERRAIN-CONFIG", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/ROI_TERRAIN_CONFIG.svg')




% elevation
figure;
set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, LAI_8_Data, 0, 5, "LAI-August", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/ROI_LAI_8.svg')

figure;
set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
set(gca, 'Position', [0.1 0.1 0.82 0.82])

plot_global_map(lats, lons, LAI_1_Data, 0, 5, "LAI-Jan", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'figures/ROI_LAI_1.svg')
