%% plot
res_h = 1/100;
res_v = 1/100;
lon = (-120.5+res_h/2):res_h: (-120-res_h/2);
lat = (39-res_v/2):-res_v: (38.5+res_v/2);

[lons,lats]=meshgrid(lon,lat);


for grid_i = 1
    
    load(['data/' 'no_LAI_11year_average_1km_grid_' num2str(grid_i) '_plevel.mat']);
    %% %%%%%%%%%%%% 1km
    
    for month_i = 8
        
        FSA_top_1km_i = fsas_tops(:,:,month_i);
        FSH_top_1km_i = shs_tops(:,:,month_i);
        FSNO_top_1km_i = fsnos_tops(:,:,month_i);
        FPSN_top_1km_i = fpsns_tops(:,:,month_i);
        LH_top_1km_i = lhs_tops(:,:,month_i);
        
         FSA_notop_1km_i = fsas_pps(:,:,month_i);
        FSH_notop_1km_i = shs_pps(:,:,month_i);
        FSNO_notop_1km_i = fsnos_pps(:,:,month_i);
        FPSN_notop_1km_i = fpsns_pps(:,:,month_i);
        LH_notop_1km_i = lhs_pps(:,:,month_i);
        
                FSA_top_1km_i = flipud(FSA_top_1km_i');
        FSH_top_1km_i = flipud(FSH_top_1km_i');
        FSNO_top_1km_i = flipud(FSNO_top_1km_i');
        FPSN_top_1km_i = flipud(FPSN_top_1km_i');
        LH_top_1km_i = flipud(LH_top_1km_i');
        
            FSA_notop_1km_i = flipud(FSA_notop_1km_i');
        FSH_notop_1km_i = flipud(FSH_notop_1km_i');
        FSNO_notop_1km_i = flipud(FSNO_notop_1km_i');
        FPSN_notop_1km_i = flipud(FPSN_notop_1km_i');
        LH_notop_1km_i = flipud(LH_notop_1km_i');

        %% FSA
        colors = flipud(brewermap(16, 'Spectral'));
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FSA_top_1km_i, 0, 300, "FSA TOP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FSA_TOP.svg'])
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FSA_notop_1km_i, 0, 300, "FSA PP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FSA_PP.svg'])
        
        
        %% difference
        colors = flipud(brewermap(16, 'BrBG'));
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FSA_top_1km_i - FSA_notop_1km_i, -30, 30, "FSA TOP-PP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FSA_difference.svg'])
        
        
        
        %% FSH
        colors = flipud(brewermap(16, 'Spectral'));
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FSH_top_1km_i, 0, 150, "FSH TOP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FSH_TOP.svg'])
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FSH_notop_1km_i, 0, 150, "FSH PP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FSH_PP.svg'])
        
        
        
        %% difference
        colors = flipud(brewermap(16, 'BrBG'));
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FSH_top_1km_i - FSH_notop_1km_i, -30, 30, "FSH TOP-PP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FSH_difference.svg'])
        
        
        
        %% SNOW
        colors = flipud(brewermap(16, 'Spectral'));
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FSNO_top_1km_i, 0, 0.3, "FSNO TOP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FSNO_TOP.svg'])
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FSNO_notop_1km_i, 0, 0.3, "FSNO PP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FSNO_PP.svg'])
        
        
        %% difference
        colors = flipud(brewermap(16, 'BrBG'));
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FSNO_top_1km_i - FSNO_notop_1km_i, -0.1, 0.1, "FSNO TOP-PP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FSNO_difference.svg'])
        
        close all
        
        
        %% FPSN
        colors = flipud(brewermap(16, 'Spectral'));
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FPSN_top_1km_i, 0, 3, "FPSN TOP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FPSN_TOP.svg'])
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FPSN_notop_1km_i, 0, 3, "FPSN PP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FPSN_PP.svg'])
        
        
        %% difference
        colors = flipud(brewermap(16, 'BrBG'));
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, FPSN_top_1km_i - FPSN_notop_1km_i, -0.3, 0.3, "FPSN TOP-PP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_FPSN_difference.svg'])
        
        
        %% LH
        colors = flipud(brewermap(16, 'Spectral'));
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, LH_top_1km_i, 0, 50, "LH TOP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300',  ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_LH_TOP.svg'])
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, LH_notop_1km_i, 0, 50, "LH PP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_LH_PP.svg'])
        
        %% difference
        colors = flipud(brewermap(16, 'BrBG'));
        
        figure;
        
        set(gcf,'unit','normalized','position',[0.1,0.1,0.22,0.3]);
        set(gca, 'Position', [0.1 0.1 0.82 0.82])
        
        plot_global_map(lats, lons, LH_top_1km_i - LH_notop_1km_i, -10, 10, "LH TOP-PP", colors, 1, 1);
        colorbar
        print(gcf, '-dsvg', '-r300', ['figures/no_LAI_11year_' num2str(grid_i) '_'  num2str(month_i) '_LH_difference.svg'])
        close all
        
    end
end
