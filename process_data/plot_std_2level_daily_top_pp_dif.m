clear all
close all

symbols1 = {'r.','g.','b.'};
symbols2 = {'k.','k.','k.'};

for grid_i = 1:1
    
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
    
    figure(6);
    hax6=axes;
    hold on
    box on
    gcf6 = gcf;
    
    figure(7);
    hax7=axes;
    hold on
    box on
    gcf7 = gcf;
    
    figure(8);
    hax8=axes;
    hold on
    box on
    gcf8 = gcf;
    
    figure(9);
    hax9=axes;
    hold on
    box on
    gcf9 = gcf;
    
    figure(10);
    hax10=axes;
    hold on
    box on
    gcf10 = gcf;
    
    figure(11);
    hax11=axes;
    hold on
    box on
    gcf11 = gcf;
    
    figure(12);
    hax12=axes;
    hold on
    box on
    gcf12 = gcf;
    
    figure(13);
    hax13=axes;
    hold on
    box on
    gcf13 = gcf;
    
    figure(14);
    hax14=axes;
    hold on
    box on
    gcf14 = gcf;
    
    figure(15);
    hax15=axes;
    hold on
    box on
    gcf15 = gcf;
    
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
                
            end
            
            fsa_top_mean = nanmean(fsas_tops_all, [1 2]);
            fsno_top_mean = nanmean(fsnos_tops_all, [1 2]);
            sh_top_mean = nanmean(shs_tops_all, [1 2]);
            lh_top_mean = nanmean(lhs_tops_all, [1 2]);
            fpsn_top_mean = nanmean(fpsns_tops_all, [1 2]);
            
            fsa_top_std = nanstd(fsas_tops_all,[], [1 2]);
            fsno_top_std = nanstd(fsnos_tops_all,[], [1 2]);
            sh_top_std = nanstd(shs_tops_all,[], [1 2]);
            lh_top_std = nanstd(lhs_tops_all,[], [1 2]);
            fpsn_top_std = nanstd(fpsns_tops_all,[], [1 2]);
            
            fsa_pp_mean = nanmean(fsas_pps_all, [1 2]);
            fsno_pp_mean = nanmean(fsnos_pps_all, [1 2]);
            sh_pp_mean = nanmean(shs_pps_all, [1 2]);
            lh_pp_mean = nanmean(lhs_pps_all, [1 2]);
            fpsn_pp_mean = nanmean(fpsns_pps_all, [1 2]);
            
            fsa_pp_std = nanstd(fsas_pps_all,[], [1 2]);
            fsno_pp_std = nanstd(fsnos_pps_all,[], [1 2]);
            sh_pp_std = nanstd(shs_pps_all,[], [1 2]);
            lh_pp_std = nanstd(lhs_pps_all,[], [1 2]);
            fpsn_pp_std = nanstd(fpsns_pps_all,[], [1 2]);
            
            
            
            fsa_pp_mean_pp_1km = squeeze(nanmean(fsas_pps_all, [1 2]));
            fsno_pp_mean_pp_1km = squeeze(nanmean(fsnos_pps_all, [1 2]));
            sh_pp_mean_pp_1km = squeeze(nanmean(shs_pps_all, [1 2]));
            lh_pp_mean_pp_1km = squeeze(nanmean(lhs_pps_all, [1 2]));
            fpsn_pp_mean_pp_1km = squeeze(nanmean(fpsns_pps_all, [1 2]));
            
            fsa_pp_std_pp_1km = squeeze(nanstd(fsas_pps_all,[], [1 2]));
            fsno_pp_std_pp_1km = squeeze(nanstd(fsnos_pps_all,[], [1 2]));
            sh_pp_std_pp_1km = squeeze(nanstd(shs_pps_all,[], [1 2]));
            lh_pp_std_pp_1km = squeeze(nanstd(lhs_pps_all,[], [1 2]));
            fpsn_pp_std_pp_1km = squeeze(nanstd(fpsns_pps_all,[], [1 2]));
            
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
            
            fsa_top_mean = nansum(fsas_tops_all.*f2ds_top_pft);
            fsno_top_mean = nansum(fsnos_tops_all.*f2ds_top_col);
            lh_top_mean = nansum(lhs_tops_all.*f2ds_top_pft);
            sh_top_mean = nansum(shs_tops_all.*f2ds_top_pft);
            fpsn_top_mean = nansum(fpsns_tops_all.*f2ds_top_pft);
            
            fsa_top_std = std(fsas_tops_all,f2ds_top_pft, 1,'omitnan');
            fsno_top_std = std(fsnos_tops_all,f2ds_top_col, 1,'omitnan');
            lh_top_std = std(lhs_tops_all,f2ds_top_pft, 1,'omitnan');
            sh_top_std = std(shs_tops_all,f2ds_top_pft, 1,'omitnan');
            fpsn_top_std = std(fpsns_tops_all,f2ds_top_pft, 1,'omitnan');
            
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
        if strcmp(type_i,'1km')
            time = (1:365)';
            %%% fsa
            plot(hax1, time, fsa_top_std(time)-fsa_pp_std_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% fsno
            plot(hax2, time, fsno_top_std(time)-fsno_pp_std_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% lh
            plot(hax3, time, lh_top_std(time)-lh_pp_std_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% sh
            plot(hax4, time, sh_top_std(time)-sh_pp_std_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% fpsn
            plot(hax5, time, fpsn_top_std(time)-fpsn_pp_std_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            
            %%% fsa
            plot(hax6, time, fsa_top_mean(time)-fsa_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% fsno
            plot(hax7, time, fsno_top_mean(time)-fsno_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% lh
            plot(hax8, time, lh_top_mean(time)-lh_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% sh
            plot(hax9, time, sh_top_mean(time)-sh_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% fpsn
            plot(hax10, time, fpsn_top_mean(time)-fpsn_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            
            %%% fsa
            plot(hax11, time, fsa_top_std(time)./fsa_top_mean(time)-fsa_pp_std_pp_1km(time)./fsa_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% fsno
            plot(hax12, time, fsno_top_std(time)./fsno_top_mean(time)-fsno_pp_std_pp_1km(time)./fsno_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% lh
            plot(hax13, time, lh_top_std(time)./lh_top_mean(time)-lh_pp_std_pp_1km(time)./lh_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% sh
            plot(hax14, time, sh_top_std(time)./sh_top_mean(time)-sh_pp_std_pp_1km(time)./sh_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% fpsn
            plot(hax15, time, fpsn_top_std(time)./fpsn_top_mean(time)-fpsn_pp_std_pp_1km(time)./fpsn_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
        else
            time = (1:365)';
            %%% fsa
            plot(hax1, time, fsa_pp_std(time)-fsa_pp_std_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% fsno
            plot(hax2, time, fsno_pp_std(time)-fsno_pp_std_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% lh
            plot(hax3, time, lh_pp_std(time)-lh_pp_std_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% sh
            plot(hax4, time, sh_pp_std(time)-sh_pp_std_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% fpsn
            plot(hax5, time, fpsn_pp_std(time)-fpsn_pp_std_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% fsa
            plot(hax6, time, fsa_pp_mean(time)-fsa_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% fsno
            plot(hax7, time, fsno_pp_mean(time)-fsno_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% lh
            plot(hax8, time, lh_pp_mean(time)-lh_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% sh
            plot(hax9, time, sh_pp_mean(time)-sh_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% fpsn
            plot(hax10, time, fpsn_pp_mean(time)-fpsn_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            
            %%% fsa
            plot(hax11, time, fsa_pp_std(time)./fsa_pp_mean(time)-fsa_pp_std_pp_1km(time)./fsa_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% fsno
            plot(hax12, time, fsno_pp_std(time)./fsno_pp_mean(time)-fsno_pp_std_pp_1km(time)./fsno_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            %%% lh
            plot(hax13, time, lh_pp_std(time)./lh_pp_mean(time)-lh_pp_std_pp_1km(time)./lh_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% sh
            plot(hax14, time, sh_pp_std(time)./sh_pp_mean(time)-sh_pp_std_pp_1km(time)./sh_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
            %%% fpsn
            plot(hax15, time, fpsn_pp_std(time)./fpsn_pp_mean(time)-fpsn_pp_std_pp_1km(time)./fpsn_pp_mean_pp_1km(time), symbols1{tmp}, 'LineWidth', 1);
            
        end
    end
    
    legend(hax1,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax1,'DOY')
    ylabel(hax1,'std difference')
    title(hax1,'Net solar radiation')
    set(hax1, 'fontsize',15)
    xlim(hax1,[1 365])
    
    legend(hax2,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax2,'DOY')
    ylabel(hax2,'std difference')
    title(hax2,'Snow cover')
    set(hax2, 'fontsize',15)
    xlim(hax2,[1 365])
    
    legend(hax3,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax3,'DOY')
    ylabel(hax3,'std difference')
    title(hax3,'Latent heat flux')
    set(hax3, 'fontsize',15)
    xlim(hax3,[1 365])
    
    legend(hax4,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax4,'DOY')
    ylabel(hax4,'std difference')
    title(hax4,'Sensible heat flux')
    set(hax4, 'fontsize',15)
    xlim(hax4,[1 365])
    
    legend(hax5,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax5,'DOY')
    ylabel(hax5,'std difference')
    title(hax5,'Photosynthesis')
    set(hax5, 'fontsize',15)
    xlim(hax5,[1 365])
    
    
    
    legend(hax6,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax6,'DOY')
    ylabel(hax6,'mean difference')
    title(hax6,'Net solar radiation')
    set(hax6, 'fontsize',15)
    xlim(hax6,[1 365])
    
    legend(hax7,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax7,'DOY')
    ylabel(hax7,'mean difference')
    title(hax7,'Snow cover')
    set(hax7, 'fontsize',15)
    xlim(hax7,[1 365])
    
    legend(hax8,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax8,'DOY')
    ylabel(hax8,'mean difference')
    title(hax8,'Latent heat flux')
    set(hax8, 'fontsize',15)
    xlim(hax8,[1 365])
    
    legend(hax9,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax9,'DOY')
    ylabel(hax9,'mean difference')
    title(hax9,'Sensible heat flux')
    set(hax9, 'fontsize',15)
    xlim(hax9,[1 365])
    
    legend(hax10,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax10,'DOY')
    ylabel(hax10,'mean difference')
    title(hax10,'Photosynthesis')
    set(hax10, 'fontsize',15)
    xlim(hax10,[1 365])
    
    
    legend(hax11,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax11,'DOY')
    ylabel(hax11,'cv difference')
    title(hax11,'Net solar radiation')
    set(hax11, 'fontsize',15)
    xlim(hax11,[1 365])
    
    legend(hax12,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax12,'DOY')
    ylabel(hax12,'cv difference')
    title(hax12,'Snow cover')
    ylim(hax12,[-2 2])
    set(hax12, 'fontsize',15)
    xlim(hax12,[1 365])
    
    legend(hax13,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax13,'DOY')
    ylabel(hax13,'cv difference')
    title(hax13,'Latent heat flux')
    set(hax13, 'fontsize',15)
    xlim(hax13,[1 365])
    
    legend(hax14,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax14,'DOY')
    ylabel(hax14,'cv difference')
    title(hax14,'Sensible heat flux')
    ylim(hax14,[-2 2])
    set(hax14, 'fontsize',15)
    xlim(hax14,[1 365])
    
    legend(hax15,'1km-top - 1km-pp','topunit-pp - 1km-pp','default-pp - 1km-pp')
    xlabel(hax15,'DOY')
    ylabel(hax15,'cv difference')
    title(hax15,'Photosynthesis')
    set(hax15, 'fontsize',15)
    xlim(hax15,[1 365])
    
    
    print(gcf1, '-dsvg', '-r300', ['figures_all/dif_std_fsa_' num2str(grid_i)  '.svg'])
    print(gcf2, '-dsvg', '-r300', ['figures_all/dif_std__fsno_' num2str(grid_i)  '.svg'])
    print(gcf3, '-dsvg', '-r300', ['figures_all/dif_std__lh_' num2str(grid_i)  '.svg'])
    print(gcf4, '-dsvg', '-r300', ['figures_all/dif_std__sh_' num2str(grid_i)  '.svg'])
    print(gcf5, '-dsvg', '-r300', ['figures_all/dif_std__fspn_' num2str(grid_i) '.svg'])
    
    print(gcf6, '-dsvg', '-r300', ['figures_all/dif_mean_fsa_' num2str(grid_i)  '.svg'])
    print(gcf7, '-dsvg', '-r300', ['figures_all/dif_mean_fsno_' num2str(grid_i)  '.svg'])
    print(gcf8, '-dsvg', '-r300', ['figures_all/dif_mean_lh_' num2str(grid_i)  '.svg'])
    print(gcf9, '-dsvg', '-r300', ['figures_all/dif_mean_sh_' num2str(grid_i)  '.svg'])
    print(gcf10, '-dsvg', '-r300', ['figures_all/dif_mean_fspn_' num2str(grid_i) '.svg'])
    
    
    print(gcf11, '-dsvg', '-r300', ['figures_all/dif_cv_fsa_' num2str(grid_i)  '.svg'])
    print(gcf12, '-dsvg', '-r300', ['figures_all/dif_cv_fsno_' num2str(grid_i)  '.svg'])
    print(gcf13, '-dsvg', '-r300', ['figures_all/dif_cv_lh_' num2str(grid_i)  '.svg'])
    print(gcf14, '-dsvg', '-r300', ['figures_all/dif_cv_sh_' num2str(grid_i)  '.svg'])
    print(gcf15, '-dsvg', '-r300', ['figures_all/dif_cv_fspn_' num2str(grid_i) '.svg'])
    
    close all
end