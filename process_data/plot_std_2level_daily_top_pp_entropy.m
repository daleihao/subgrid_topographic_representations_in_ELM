clear all
close all

symbols1 = {'r-','g-','b-'};
symbols2 = {'ro--','go--','bo--'};

for grid_i = 1:4
    
    figure(1);
    hax1=axes;
    hold on
    box on
    gcf1 = gcf;
    
    figure(2);
    hax2=axes;
    hold on
    box on
    gcf2 = gcf;
    
    figure(3);
    hax3=axes;
    hold on
    box on
    gcf3 = gcf;
    
    figure(4);
    hax4=axes;
    hold on
    box on
    gcf4 = gcf;
    
    figure(5);
    hax5=axes;
    hold on
    box on
    gcf5 = gcf;
    
    
    for type_i = {'1km','topunit','default'}
        
        type_i = type_i{1};
        load(['data/' 'all_daily_11year_average_' type_i '_grid_' num2str(grid_i) '_plevel.mat']);
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
        if strcmp(type_i,'1km')
            tmp = 1;
            
             lhs_tops_all(lhs_tops_all>150) = nan;
                lhs_pps_all(lhs_pps_all>150) = nan;
            for ss = 1:365
               
            fsas_tops_all(:,:,ss) = squeeze(fsas_tops_all(:,:,ss)).*LCs_tmp;
            fsnos_tops_all(:,:,ss)= squeeze(fsnos_tops_all(:,:,ss)).*LCs_tmp;
            shs_tops_all(:,:,ss)= squeeze(shs_tops_all(:,:,ss)).*LCs_tmp;
            lhs_tops_all(:,:,ss)= squeeze(lhs_tops_all(:,:,ss)).*LCs_tmp;
            fpsns_tops_all(:,:,ss)= squeeze(fpsns_tops_all(:,:,ss)).*LCs_tmp;
            
              fsas_pps_all(:,:,ss) = squeeze(fsas_pps_all(:,:,ss)).*LCs_tmp;
            fsnos_pps_all(:,:,ss)= squeeze(fsnos_pps_all(:,:,ss)).*LCs_tmp;
            shs_pps_all(:,:,ss)= squeeze(shs_pps_all(:,:,ss)).*LCs_tmp;
            lhs_pps_all(:,:,ss)= squeeze(lhs_pps_all(:,:,ss)).*LCs_tmp;
            fpsns_pps_all(:,:,ss)= squeeze(fpsns_pps_all(:,:,ss)).*LCs_tmp;
  
            fsa_top_entropy = cal_entropy(fsas_tops_all(:,:,ss));
            fsno_top_entropy = nanmean(fsnos_tops_all(:,:,ss));
            sh_top_entropy = nanmean(shs_tops_all(:,:,ss));
            lh_top_entropy = nanmean(lhs_tops_all(:,:,ss));
            fpsn_top_entropy = nanmean(fpsns_tops_all(:,:,ss));

             fsa_pp_entropy = cal_entropy(fsas_pps_all(:,:,ss));
            fsno_pp_entropy = nanmean(fsnos_pps_all(:,:,ss));
            sh_pp_entropy = nanmean(shs_pps_all(:,:,ss));
            lh_pp_entropy = nanmean(lhs_pps_all(:,:,ss));
            fpsn_pp_entropy = nanmean(fpsns_pps_all(:,:,ss));
            end
            
                        
        elseif strcmp(type_i,'topunit')
            
            tmp = 2;
            load(['data/' 'Pecr_Topunit_' num2str(grid_i) '.mat']);
            
            file_top_default  = ['data/' 'elm_plevel_top_11years_topunit_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];
            f2ds_top_pft = ncread(file_top_default, 'pfts1d_wtgcell');
            f2ds_top_pft = repmat(f2ds_top_pft, 1, 1);
            
            
            
            
            %% pft num
            file_top_default  = ['data/' 'elm_plevel_top_11years_topunit_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];
            f2ds_top_pft = ncread(file_top_default, 'pfts1d_wtgcell');
            f2ds_top_pft = repmat(f2ds_top_pft, 1, 1);
            
            f2ds_top_grid = ncread(file_top_default, 'pfts1d_itype_veg');
            nums_tmp = find(f2ds_top_grid == 1);
            nums_tmp = [nums_tmp-1; size(f2ds_top_pft,1)+1];
            
            
            f2ds_top_topunit = zeros(size(f2ds_top_grid, 1),1);
            
            for tmp_i = 1:11
                tmp_t = f2ds_top_pft(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:);
                tmp_t(18:end) = 0;
                tmp_t = tmp_t/sum(tmp_t);
                tmp_t = tmp_t*Perc_Topunit(tmp_i);
                f2ds_top_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = tmp_t;
                sum(f2ds_top_pft(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:),1)
            end
            
            f2ds_pp_ppunit = f2ds_top_topunit;
            
            %% col num
            f2ds_top_cols = ncread(file_top_default, 'cols1d_wtgcell');
            % f2ds_top_cols = repmat(f2ds_top_cols, 1, 12);
            
            f2ds_top_grid = ncread(file_top_default, 'cols1d_itype_lunit');
            nums_tmp = find(f2ds_top_grid == 1);
            nums_tmp = [nums_tmp; size(f2ds_top_cols,1)+1];
            
            load(['data/' 'Pecr_Topunit_' num2str(grid_i) '.mat']);
            
            f2ds_top_col = zeros(size(f2ds_top_grid, 1),1);
            
            for tmp_i = 1:11
                tmp_dd = f2ds_top_cols(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:);
                tmo_dd(1) = 1;
                tmo_dd(2:end) = 0;
                f2ds_top_col(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = tmp_dd*Perc_Topunit(tmp_i);
                sum(f2ds_top_cols(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:),1)
            end
            
            f2ds_pp_col = f2ds_top_col;
            
            
            %%%%
            fsa_top_mean = nansum(fsas_tops_all.*f2ds_top_topunit);
            fsno_top_mean = nansum(fsnos_tops_all.*f2ds_top_col);
            lh_top_mean = nansum(lhs_tops_all.*f2ds_top_topunit);
            sh_top_mean = nansum(shs_tops_all.*f2ds_top_topunit);
            fpsn_top_mean = nansum(fpsns_tops_all.*f2ds_top_topunit);
            
            fsa_top_std = std(fsas_tops_all,f2ds_top_topunit, 1,'omitnan');
            fsno_top_std = std(fsnos_tops_all,f2ds_top_col, 1,'omitnan');
            lh_top_std = std(lhs_tops_all,f2ds_top_topunit, 1,'omitnan');
            sh_top_std = std(shs_tops_all,f2ds_top_topunit, 1,'omitnan');
            fpsn_top_std = std(fpsns_tops_all,f2ds_top_topunit, 1,'omitnan');
            
            fsa_pp_mean = nansum(fsas_pps_all.*f2ds_pp_ppunit);
            fsno_pp_mean = nansum(fsnos_pps_all.*f2ds_pp_col);
            lh_pp_mean = nansum(lhs_pps_all.*f2ds_pp_ppunit);
            sh_pp_mean = nansum(shs_pps_all.*f2ds_pp_ppunit);
            fpsn_pp_mean = nansum(fpsns_pps_all.*f2ds_pp_ppunit);
            
            fsa_pp_std = std(fsas_pps_all,f2ds_pp_ppunit, 1,'omitnan');
            fsno_pp_std = std(fsnos_pps_all,f2ds_pp_col, 1,'omitnan');
            lh_pp_std = std(lhs_pps_all,f2ds_pp_ppunit, 1,'omitnan');
            sh_pp_std = std(shs_pps_all,f2ds_pp_ppunit, 1,'omitnan');
            fpsn_pp_std = std(fpsns_pps_all,f2ds_pp_ppunit, 1,'omitnan');
            
            fsa_top_mean = fsa_top_mean';
            fsno_top_mean = fsno_top_mean';
            lh_top_mean = lh_top_mean';
            sh_top_mean = sh_top_mean';
            fpsn_top_mean = fpsn_top_mean';
            
            fsa_top_std = fsa_top_std';
            fsno_top_std = fsno_top_std';
            lh_top_std = lh_top_std';
            sh_top_std = sh_top_std';
            fpsn_top_std = fpsn_top_std';
            
            fsa_pp_mean = fsa_pp_mean';
            fsno_pp_mean = fsno_pp_mean';
            lh_pp_mean = lh_pp_mean';
            sh_pp_mean = sh_pp_mean';
            fpsn_pp_mean = fpsn_pp_mean';
            
            fsa_pp_std = fsa_pp_std';
            fsno_pp_std = fsno_pp_std';
            lh_pp_std = lh_pp_std';
            sh_pp_std = sh_pp_std';
            fpsn_pp_std = fpsn_pp_std';
            
        elseif strcmp(type_i,'default')
            
            tmp = 3;
            file_top_default  = ['data/' 'elm_top_11years_default_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];
            f2ds_top_topunit = ncread(file_top_default, 'pfts1d_wtgcell');
            f2ds_pp_ppunit = ncread(file_top_default, 'pfts1d_wtgcell');
            %f2ds_top_default = repmat(f2ds_top_default, [1 12]);
            f2ds_top_pft = ncread(file_top_default, 'pfts1d_wtgcell');
            f2ds_top_pft(18:end) = 0;
            f2ds_top_pft = f2ds_top_pft/nansum(f2ds_top_pft);
           
            f2ds_top_pft = repmat(f2ds_top_pft, 1, 1);
            f2ds_pp_ppunit = f2ds_top_pft;
             
            f2ds_top_col = ncread(file_top_default, 'cols1d_wtgcell');
            f2ds_top_col = repmat(f2ds_top_col, [1 1]);
            f2ds_top_col(1) = 1;
            f2ds_top_col(2:end) = 0;
                
            f2ds_pp_col = f2ds_top_col;
            
           
            
          
            
        end
        
        fsa_top_mean = squeeze(fsa_top_mean);
        fsno_top_mean = squeeze(fsno_top_mean);
        lh_top_mean = squeeze(lh_top_mean);
        sh_top_mean = squeeze(sh_top_mean);
        fpsn_top_mean = squeeze(fpsn_top_mean);
        
        fsa_top_std = squeeze(fsa_top_std);
        fsno_top_std = squeeze(fsno_top_std);
        lh_top_std = squeeze(lh_top_std);
        sh_top_std = squeeze(sh_top_std);
        fpsn_top_std = squeeze(fpsn_top_std);
        
        fsa_pp_mean = squeeze(fsa_pp_mean);
        fsno_pp_mean = squeeze(fsno_pp_mean);
        lh_pp_mean = squeeze(lh_pp_mean);
        sh_pp_mean = squeeze(sh_pp_mean);
        fpsn_pp_mean = squeeze(fpsn_pp_mean);
        
        fsa_pp_std = squeeze(fsa_pp_std);
        fsno_pp_std = squeeze(fsno_pp_std);
        lh_pp_std = squeeze(lh_pp_std);
        sh_pp_std = squeeze(sh_pp_std);
        fpsn_pp_std = squeeze(fpsn_pp_std);
        
        %% plot
        
        time = (1:365)';
        %%% fsa
        plot(hax1, time, fsa_pp_std(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax1, time, fsa_top_std(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% fsno
        plot(hax2, time, fsno_pp_std(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax2, time, fsno_top_std(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% lh
        plot(hax3, time, lh_pp_std(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax3, time, lh_top_std(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% sh
        plot(hax4, time, sh_pp_std(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax4, time, sh_top_std(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% fpsn
        plot(hax5, time, fpsn_pp_std(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax5, time, fpsn_top_std(time), symbols2{tmp}, 'LineWidth', 1);
        
        
        %%% fsa
        plot(hax6, time, fsa_pp_mean(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax6, time, fsa_top_mean(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% fsno
        plot(hax7, time, fsno_pp_mean(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax7, time, fsno_top_mean(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% lh
        plot(hax8, time, lh_pp_mean(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax8, time, lh_top_mean(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% sh
        plot(hax9, time, sh_pp_mean(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax9, time, sh_top_mean(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% fpsn
        plot(hax10, time, fpsn_pp_mean(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax10, time, fpsn_top_mean(time), symbols2{tmp}, 'LineWidth', 1);
  
        
                %%% fsa
        plot(hax11, time, fsa_pp_std(time)./fsa_pp_mean(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax11, time, fsa_top_std(time)./fsa_top_mean(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% fsno
        plot(hax12, time, fsno_pp_std(time)./fsno_pp_mean(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax12, time, fsno_top_std(time)./fsno_top_mean(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% lh
        plot(hax13, time, lh_pp_std(time)./lh_pp_mean(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax13, time, lh_top_std(time)./lh_top_mean(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% sh
        plot(hax14, time, sh_pp_std(time)./sh_pp_mean(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax14, time, sh_top_std(time)./sh_top_mean(time), symbols2{tmp}, 'LineWidth', 1);
        
        %%% fpsn
        plot(hax15, time, fpsn_pp_std(time)./fpsn_pp_mean(time), symbols1{tmp}, 'LineWidth', 1);
        plot(hax15, time, fpsn_top_std(time)./fpsn_top_mean(time), symbols2{tmp}, 'LineWidth', 1);
    
    end
    
    legend(hax1,'1km-pp','1km-top','topunit-pp','topunit-top','default-pp','default-top')
    xlabel(hax1,'DOY')
    ylabel(hax1,'std')
    title(hax1,'Net solar radiation')
    
    legend(hax2,'1km-pp','1km-top','topunit-pp','topunit-top','default-pp','default-top')
    xlabel(hax2,'DOY')
    ylabel(hax2,'std')
    title(hax2,'Snow cover')
    
    legend(hax3,'1km-pp','1km-top','topunit-pp','topunit-top','default-pp','default-top')
    xlabel(hax3,'DOY')
    ylabel(hax3,'std')
    title(hax3,'Latent heat flux')
    
    legend(hax4,'1km-pp','1km-top','topunit-pp','topunit-top','default-pp','default-top')
    xlabel(hax4,'DOY')
    ylabel(hax4,'std')
    title(hax4,'Sensible heat flux')
    
    legend(hax5,'1km-pp','1km-top','topunit-pp','topunit-top','default-pp','default-top')
    xlabel(hax5,'DOY')
    ylabel(hax5,'std')
    title(hax5,'Photosynthesis')
    
    
    
   
    
    print(gcf1, '-dsvg', '-r300', ['figures/zoom_all_entropy_daily_fsa_' num2str(grid_i)  '.svg'])
    print(gcf2, '-dsvg', '-r300', ['figures/zoom_all_entropy_daily_fsno_' num2str(grid_i)  '.svg'])
    print(gcf3, '-dsvg', '-r300', ['figures/zoom_all_entropy_daily_lh_' num2str(grid_i)  '.svg'])
    print(gcf4, '-dsvg', '-r300', ['figures/zoom_all_entropy_daily_sh_' num2str(grid_i)  '.svg'])
    print(gcf5, '-dsvg', '-r300', ['figures/zoom_all_entropy_daily_fspn_' num2str(grid_i) '.svg'])
    

    close all
end