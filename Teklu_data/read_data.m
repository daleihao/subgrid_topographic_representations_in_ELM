data = imread('SierraNevada_tpu_map.tif');

tile1 = data(1:600,1:600)-100;
tile2 = data(1:600,601:1200)-200;
tile3 = data(601:1200,1:600)-300;
tile4 = data(601:1200,601:1200)-400;

figure;
subplot(221)
imagesc(tile1)
subplot(222)
imagesc(tile2)
subplot(223)
imagesc(tile3)
subplot(224)
imagesc(tile4)