clear all
close all

symbols1 = {'r-','ro','r*'};
symbols2 = {'b-','bo','b*'};

for grid_i = 1:4
    
       figure;
        hold on
        
    for type_i = {'1km','topunit','default'}
        
        type_i = type_i{1};
        load(['data/' '11year_average_' type_i '_grid_' num2str(grid_i) '.mat']);
        
        if strcmp(type_i,'1km')
            tmp = 1;
            fsa_top_mean = nanmean(fsas_tops, [1 2]);
            fsno_top_mean = nanmean(fsnos_tops, [1 2]);
            sh_top_mean = nanmean(shs_tops, [1 2]);
            lh_top_mean = nanmean(lhs_tops, [1 2]);
            fpsn_top_mean = nanmean(fpsns_tops, [1 2]);
            
            fsa_top_std = nanstd(fsas_tops,[], [1 2]);
            fsno_top_std = nanstd(fsnos_tops,[], [1 2]);
            sh_top_std = nanstd(shs_tops,[], [1 2]);
            lh_top_std = nanstd(lhs_tops,[], [1 2]);
            fpsn_top_std = nanstd(fpsns_tops,[], [1 2]);
            
            fsa_pp_mean = nanmean(fsas_pps, [1 2]);
            fsno_pp_mean = nanmean(fsnos_pps, [1 2]);
            sh_pp_mean = nanmean(shs_pps, [1 2]);
            lh_pp_mean = nanmean(lhs_pps, [1 2]);
            fpsn_pp_mean = nanmean(fpsns_pps, [1 2]);
            
            fsa_pp_std = nanstd(fsas_pps,[], [1 2]);
            fsno_pp_std = nanstd(fsnos_pps,[], [1 2]);
            sh_pp_std = nanstd(shs_pps,[], [1 2]);
            lh_pp_std = nanstd(lhs_pps,[], [1 2]);
            fpsn_pp_std = nanstd(fpsns_pps,[], [1 2]);
            
        elseif strcmp(type_i,'topunit')
            
            tmp = 2;
            load(['data/' 'Pecr_Topunit_' num2str(grid_i) '.mat']);
            
            
            f2ds_top_topunit = Perc_Topunit;
            f2ds_pp_ppunit = Perc_Topunit;
            %f2ds_top_topunit = repmat(f2ds_top_topunit, [1 12]);
            
            fsa_top_mean = nansum(fsas_tops.*f2ds_top_topunit);
            fsno_top_mean = nansum(fsnos_tops.*f2ds_top_topunit);
            lh_top_mean = nansum(lhs_tops.*f2ds_top_topunit);
            sh_top_mean = nansum(shs_tops.*f2ds_top_topunit);
            fpsn_top_mean = nansum(fpsns_tops.*f2ds_top_topunit);
            
            fsa_top_std = std(fsas_tops,f2ds_top_topunit, 1,'omitnan');
            fsno_top_std = std(fsnos_tops,f2ds_top_topunit, 1,'omitnan');
            lh_top_std = std(lhs_tops,f2ds_top_topunit, 1,'omitnan');
            sh_top_std = std(shs_tops,f2ds_top_topunit, 1,'omitnan');
            fpsn_top_std = std(fpsns_tops,f2ds_top_topunit, 1,'omitnan');
            
            fsa_pp_mean = nansum(fsas_pps.*f2ds_pp_ppunit);
            fsno_pp_mean = nansum(fsnos_pps.*f2ds_pp_ppunit);
            lh_pp_mean = nansum(lhs_pps.*f2ds_pp_ppunit);
            sh_pp_mean = nansum(shs_pps.*f2ds_pp_ppunit);
            fpsn_pp_mean = nansum(fpsns_pps.*f2ds_pp_ppunit);
            
            fsa_pp_std = std(fsas_pps,f2ds_pp_ppunit, 1,'omitnan');
            fsno_pp_std = std(fsnos_pps,f2ds_pp_ppunit, 1,'omitnan');
            lh_pp_std = std(lhs_pps,f2ds_pp_ppunit, 1,'omitnan');
            sh_pp_std = std(shs_pps,f2ds_pp_ppunit, 1,'omitnan');
            fpsn_pp_std = std(fpsns_pps,f2ds_pp_ppunit, 1,'omitnan');
            
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
            
            
            fsa_top_mean = nansum(fsas_tops.*f2ds_top_topunit);
           % fsno_top_mean = nansum(fsnos_tops.*f2ds_top_topunit);
            lh_top_mean = nansum(lhs_tops.*f2ds_top_topunit);
            sh_top_mean = nansum(shs_tops.*f2ds_top_topunit);
            fpsn_top_mean = nansum(fpsns_tops.*f2ds_top_topunit);
            
            fsa_top_std = std(fsas_tops,f2ds_top_topunit, 1,'omitnan');
           % fsno_top_std = std(fsnos_tops,f2ds_top_topunit, 1,'omitnan');
            lh_top_std = std(lhs_tops,f2ds_top_topunit, 1,'omitnan');
            sh_top_std = std(shs_tops,f2ds_top_topunit, 1,'omitnan');
            fpsn_top_std = std(fpsns_tops,f2ds_top_topunit, 1,'omitnan');
            
            fsa_pp_mean = nansum(fsas_pps.*f2ds_pp_ppunit);
          %  fsno_pp_mean = nansum(fsnos_pps.*f2ds_pp_ppunit);
            lh_pp_mean = nansum(lhs_pps.*f2ds_pp_ppunit);
            sh_pp_mean = nansum(shs_pps.*f2ds_pp_ppunit);
            fpsn_pp_mean = nansum(fpsns_pps.*f2ds_pp_ppunit);
            
            fsa_pp_std = std(fsas_pps,f2ds_pp_ppunit, 1,'omitnan');
          %  fsno_pp_std = std(fsnos_pps,f2ds_pp_ppunit, 1,'omitnan');
            lh_pp_std = std(lhs_pps,f2ds_pp_ppunit, 1,'omitnan');
            sh_pp_std = std(shs_pps,f2ds_pp_ppunit, 1,'omitnan');
            fpsn_pp_std = std(fpsns_pps,f2ds_pp_ppunit, 1,'omitnan');
         
            
                        fsa_top_mean = fsa_top_mean';
           % fsno_top_mean = fsno_top_mean';
            lh_top_mean = lh_top_mean';
            sh_top_mean = sh_top_mean';
            fpsn_top_mean = fpsn_top_mean';
            
            fsa_top_std = fsa_top_std';
           % fsno_top_std = fsno_top_std';
            lh_top_std = lh_top_std';
            sh_top_std = sh_top_std';
            fpsn_top_std = fpsn_top_std';
            
            fsa_pp_mean = fsa_pp_mean';
           % fsno_pp_mean = fsno_pp_mean';
            lh_pp_mean = lh_pp_mean';
            sh_pp_mean = sh_pp_mean';
            fpsn_pp_mean = fpsn_pp_mean';
            
            fsa_pp_std = fsa_pp_std';
           % fsno_pp_std = fsno_pp_std';
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
     
        time = (1:12)';
        plot(time, fsa_pp_std, symbols1{tmp}, 'LineWidth', 1);
%         inbetween = [fsa_pp_mean + fsa_pp_std; flipud(fsa_pp_mean - fsa_pp_std)];
%         patch([time; flipud(time)], inbetween, 'b', 'LineStyle', 'none');
%         box on
%         ylabel('FSA')
%         alpha(0.3)
%         
%         time = (1:12)';
        plot(time, fsa_top_std, symbols2{tmp}, 'LineWidth', 1);
%         inbetween = [fsa_top_mean + fsa_top_std; flipud(fsa_top_mean - fsa_top_std)];
%         patch([time; flipud(time)], inbetween, 'r', 'LineStyle', 'none');
%         box on
%         ylabel('FSA')
%         alpha(0.3)
        
         
      
%         subplot(2,3,2)
%         hold on
%         time = (1:12)';
%         plot(time, fsno_pp_mean, 'k', 'LineWidth', 1);
%         inbetween = [fsno_pp_mean + fsno_pp_std; flipud(fsno_pp_mean - fsno_pp_std)];
%         patch([time; flipud(time)], inbetween, 'b', 'LineStyle', 'none');
%         box on
%         ylabel('FSNO')
%         alpha(0.3)
%        
%         
%         
%         subplot(2,3,3)
%         hold on
%         time = (1:12)';
%         plot(time, sh_pp_mean, 'k', 'LineWidth', 1);
%         inbetween = [sh_pp_mean + sh_pp_std; flipud(sh_pp_mean - sh_pp_std)];
%         patch([time; flipud(time)], inbetween, 'b', 'LineStyle', 'none');
%         box on
%         ylabel('SH')
%         alpha(0.3)
%         
%         subplot(2,3,4)
%         hold on
%         time = (1:12)';
%         plot(time, lh_pp_mean, 'k', 'LineWidth', 1);
%         inbetween = [lh_pp_mean + lh_pp_std; flipud(lh_pp_mean - lh_pp_std)];
%         patch([time; flipud(time)], inbetween, 'b', 'LineStyle', 'none');
%         box on
%         ylabel('LH')
%         alpha(0.3)
%         
%         subplot(2,3,5)
%         hold on
%         time = (1:12)';
%         plot(time, fpsn_pp_mean, 'k', 'LineWidth', 1);
%         inbetween = [fpsn_pp_mean + fpsn_pp_std; flipud(fpsn_pp_mean - fpsn_pp_std)];
%         patch([time; flipud(time)], inbetween, 'b', 'LineStyle', 'none');
%         box on
%         ylabel('FPSN')
%         alpha(0.3)
        
        
%       print(gcf, '-dsvg', '-r300', ['figures/pp_mean_std_' num2str(grid_i) '_'  type_i '.svg'])
       % close all
       
        
        %% plot
%         figure;
%         subplot(2,3,1)
%         hold on
%         time = (1:12)';
%         plot(time, fsa_top_mean, 'k', 'LineWidth', 1);
%         inbetween = [fsa_top_mean + fsa_top_std; flipud(fsa_top_mean - fsa_top_std)];
%         patch([time; flipud(time)], inbetween, 'b', 'LineStyle', 'none');
%         box on
%         ylabel('FSA')
%         alpha(0.3)
        
        
%         subplot(2,3,2)
%         hold on
%         time = (1:12)';
%         plot(time, fsno_top_mean, 'k', 'LineWidth', 1);
%         inbetween = [fsno_top_mean + fsno_top_std; flipud(fsno_top_mean - fsno_top_std)];
%         patch([time; flipud(time)], inbetween, 'b', 'LineStyle', 'none');
%         box on
%         ylabel('FSNO')
%         alpha(0.3)
%         
%         subplot(2,3,3)
%         hold on
%         time = (1:12)';
%         plot(time, sh_top_mean, 'k', 'LineWidth', 1);
%         inbetween = [sh_top_mean + sh_top_std; flipud(sh_top_mean - sh_top_std)];
%         patch([time; flipud(time)], inbetween, 'b', 'LineStyle', 'none');
%         box on
%         ylabel('SH')
%         alpha(0.3)
%         
%         subplot(2,3,4)
%         hold on
%         time = (1:12)';
%         plot(time, lh_top_mean, 'k', 'LineWidth', 1);
%         inbetween = [lh_top_mean + lh_top_std; flipud(lh_top_mean - lh_top_std)];
%         patch([time; flipud(time)], inbetween, 'b', 'LineStyle', 'none');
%         box on
%         ylabel('LH')
%         alpha(0.3)
%         
%         subplot(2,3,5)
%         hold on
%         time = (1:12)';
%         plot(time, fpsn_top_mean, 'k', 'LineWidth', 1);
%         inbetween = [fpsn_top_mean + fpsn_top_std; flipud(fpsn_top_mean - fpsn_top_std)];
%         patch([time; flipud(time)], inbetween, 'b', 'LineStyle', 'none');
%         box on
%         ylabel('FPSN')
%         alpha(0.3)
%         
%         
%         print(gcf, '-dsvg', '-r300', ['figures/top_mean_std_' num2str(grid_i) '_'  type_i '.svg'])
%         close all
    end
     print(gcf, '-dsvg', '-r300', ['figures/mean_std_' num2str(grid_i) '_'  type_i '.svg'])
end