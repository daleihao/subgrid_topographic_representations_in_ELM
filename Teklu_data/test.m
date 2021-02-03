res_h = 1/1200;
res_v = 1/1200;
lon = (-120.5+res_h/2):res_h: (-119.5-res_h/2);
lat = (39-res_v/2):-res_v: (38+res_v/2);

[lons_all,lats_all]=meshgrid(lon,lat);


data = imread('SierraNevada_tpu_map.tif');

tile1 = data(1:600,1:600)-100;
tile2 = data(1:600,601:1200)-200;
tile3 = data(601:1200,1:600)-300;
tile4 = data(601:1200,601:1200)-400;

colors = flipud(brewermap(11, 'Spectral'));


lons1 = lons_all(1:600,1:600);
lons2 = lons_all(1:600,601:1200);
lons3 = lons_all(601:1200,1:600);
lons4 = lons_all(601:1200,601:1200);



lats1 = lats_all(1:600,1:600);
lats2 = lats_all(1:600,601:1200);
lats3 = lats_all(601:1200,1:600);
lats4 = lats_all(601:1200,601:1200);


%% elevation
figure;

set(gcf,'unit','normalized','position',[0.1,0.1,0.2,0.3]);
set(gca, 'Position', [0.1 0.05 0.9 0.9])

plot_global_map(lats1, lons1, tile1, 1, 11, "Grid-1", colors, 1, 1);
colorbar
h2 = axes('pos',[0.5 0.2 0.2 0.2])
plot_global_map(lats2, lons2, tile2, 1, 11, "Grid-2", colors, 1, 1);
colorbar
print(gcf, '-dsvg', '-r300', 'results/Topunit2.svg')

