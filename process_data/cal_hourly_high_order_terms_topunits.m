clear all
close all
DataDir = '/global/cscratch1/sd/daleihao/e3sm_scratch/cori-knl/ELM_PFT_data/hourly/topunit_hourly/';
fractionDir = '/global/u2/d/daleihao/model/code_pft/';
saveDir = '/global/u2/d/daleihao/model/code_pft/data_topunit/';
for t = {'','no_PFT_soil_','no_PFT_','no_soil_'}
    
    for grid_i = 1:4
        
        for doy_i = 1:365
            
            %% topunit
            load([fractionDir 'Pecr_Topunit_'   num2str(grid_i)  '.mat']);
            
            file_topunit = [DataDir 'hourly_11year_average_topunit_grid_' num2str(grid_i) '_plevel_doy_' num2str(doy_i) '.mat'];
            
            load(file_topunit);
            
            
            
            %% pft num
            file_top_default  = [fractionDir 'elm_plevel_top_11years_topunit_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel.clm2.h2.2010-02-01-00000.nc'];
            f2ds_top_pft = ncread(file_top_default, 'pfts1d_wtgcell');
            f2ds_top_pft = repmat(f2ds_top_pft, 1, 1);
            
            f2ds_top_grid = ncread(file_top_default, 'pfts1d_itype_veg');
            nums_tmp = find(f2ds_top_grid == 1);
            nums_tmp = [nums_tmp-1; size(f2ds_top_pft,1)+1];
            
            %rhos_top_topunit = rhos_tops_all(1,1);
            rhos_top_topunit = nan(size(lhs_tops,1), size(lhs_tops,2));
            %Psurfs_top_topunit = psurfs_tops_all(1,1);
            Psurfs_top_topunit = nan(size(lhs_tops,1), size(lhs_tops,2));
            
            rhos_pp_topunit = nan(size(lhs_pps,1), size(lhs_pps,2));
            %Psurfs_top_topunit = psurfs_tops_all(1,1);
            Psurfs_pp_topunit = nan(size(lhs_pps,1), size(lhs_pps,2));
            
            f2ds_top_topunit = zeros(size(f2ds_top_grid, 1),1);
            for tmp_i = 1:11
                tmp_t = f2ds_top_pft(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:);
                tmp_t(18:end) = 0;
                tmp_t = tmp_t/sum(tmp_t);
                tmp_t = tmp_t*Perc_Topunit(tmp_i);
                f2ds_top_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = tmp_t;
                sum(f2ds_top_pft(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:),1)
                rhos_top_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = repmat(rhos_tops(tmp_i,:),nums_tmp(tmp_i+1) - nums_tmp(tmp_i),1);
                Psurfs_top_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = repmat(psurfs_tops(tmp_i,:),nums_tmp(tmp_i+1) - nums_tmp(tmp_i),1);
                rhos_pp_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = repmat(rhos_pps(tmp_i,:),nums_tmp(tmp_i+1) - nums_tmp(tmp_i),1);
                Psurfs_pp_topunit(nums_tmp(tmp_i):(nums_tmp(tmp_i+1)-1),:) = repmat(psurfs_pps(tmp_i,:),nums_tmp(tmp_i+1) - nums_tmp(tmp_i),1);
                
            end
            
            f2ds_top_topunit = repmat(f2ds_top_topunit, 1, 48);
            f2ds_pp_ppunit = f2ds_top_topunit;
            
            %shs1 = ncread(file_top_topunit, 'FSH');
            lhs_top_topunit = lhs_tops;
            shs_top_topunit = shs_tops;
            tsas_top_topunit = tsas_tops;
            qs_top_topunit = qs_tops;
            ufs_top_topunit = ufs_tops;
            
            
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
            tsas_pp_topunit = tsas_pps;
            qs_pp_topunit = qs_pps;
            ufs_pp_topunit = ufs_pps;
            
            
            %f2ds_pp_topunit = Perc_Topunit;
            %f2ds_pp_topunit = repmat(f2ds_pp_topunit, [1 12]);
            f2ds_pp_topunit=f2ds_top_topunit;
            
            
            lh_mean_pp_topunit = nansum(lhs_pp_topunit.*f2ds_pp_topunit);
            sh_mean_pp_topunit = nansum(shs_pp_topunit.*f2ds_pp_topunit);
            rho_mean_pp_topunit = nansum(rhos_pp_topunit.*f2ds_pp_topunit);
            uf_mean_pp_topunit = nansum(ufs_pp_topunit.*f2ds_pp_topunit);
            
            
            [wp2_hom_pp_topunit, thlp2_hom_pp_topunit, rtp2_hom_pp_topunit, rtpthlp_hom_pp_topunit] = cal_hom(lh_mean_pp_topunit, sh_mean_pp_topunit, rho_mean_pp_topunit, uf_mean_pp_topunit);
            [wp2_het_pp_topunit, thlp2_het_pp_topunit, rtp2_het_pp_topunit, rtpthlp_het_pp_topunit] = cal_het(f2ds_pp_topunit, lhs_pp_topunit, shs_pp_topunit, rhos_pp_topunit, tsas_pp_topunit, qs_pp_topunit, ufs_pp_topunit, Psurfs_pp_topunit);
            
            
            if(doy_i == 1)
                
                
                wp2_hom_pp_topunit_all = wp2_hom_pp_topunit;
                thlp2_hom_pp_topunit_all = thlp2_hom_pp_topunit;
                rtp2_hom_pp_topunit_all = rtp2_hom_pp_topunit;
                rtpthlp_hom_pp_topunit_all = rtpthlp_hom_pp_topunit;
                wp2_het_pp_topunit_all = wp2_het_pp_topunit;
                thlp2_het_pp_topunit_all = thlp2_het_pp_topunit;
                rtp2_het_pp_topunit_all = rtp2_het_pp_topunit;
                rtpthlp_het_pp_topunit_all = rtpthlp_het_pp_topunit;
                
                
                wp2_hom_top_topunit_all = wp2_hom_top_topunit;
                thlp2_hom_top_topunit_all = thlp2_hom_top_topunit;
                rtp2_hom_top_topunit_all = rtp2_hom_top_topunit;
                rtpthlp_hom_top_topunit_all = rtpthlp_hom_top_topunit;
                wp2_het_top_topunit_all = wp2_het_top_topunit;
                thlp2_het_top_topunit_all = thlp2_het_top_topunit;
                rtp2_het_top_topunit_all = rtp2_het_top_topunit;
                rtpthlp_het_top_topunit_all = rtpthlp_het_top_topunit;
                
                
            else
                
                wp2_hom_pp_topunit_all = [wp2_hom_pp_topunit_all;wp2_hom_pp_topunit];
                thlp2_hom_pp_topunit_all = [thlp2_hom_pp_topunit_all;thlp2_hom_pp_topunit];
                rtp2_hom_pp_topunit_all = [rtp2_hom_pp_topunit_all;rtp2_hom_pp_topunit];
                rtpthlp_hom_pp_topunit_all = [rtpthlp_hom_pp_topunit_all;rtpthlp_hom_pp_topunit];
                wp2_het_pp_topunit_all = [wp2_het_pp_topunit_all;wp2_het_pp_topunit];
                thlp2_het_pp_topunit_all = [thlp2_het_pp_topunit_all;thlp2_het_pp_topunit];
                rtp2_het_pp_topunit_all = [rtp2_het_pp_topunit_all;rtp2_het_pp_topunit];
                rtpthlp_het_pp_topunit_all = [rtpthlp_het_pp_topunit_all;rtpthlp_het_pp_topunit];
                
                wp2_hom_top_topunit_all = [wp2_hom_top_topunit_all;wp2_hom_top_topunit];
                thlp2_hom_top_topunit_all = [thlp2_hom_top_topunit_all;thlp2_hom_top_topunit];
                rtp2_hom_top_topunit_all = [rtp2_hom_top_topunit_all;rtp2_hom_top_topunit];
                rtpthlp_hom_top_topunit_all = [rtpthlp_hom_top_topunit_all;rtpthlp_hom_top_topunit];
                wp2_het_top_topunit_all = [wp2_het_top_topunit_all;wp2_het_top_topunit];
                thlp2_het_top_topunit_all = [thlp2_het_top_topunit_all;thlp2_het_top_topunit];
                rtp2_het_top_topunit_all = [rtp2_het_top_topunit_all;rtp2_het_top_topunit];
                rtpthlp_het_top_topunit_all = [rtpthlp_het_top_topunit_all;rtpthlp_het_top_topunit];
                
            end
            
        end
        save([saveDir 'hourly_turbulent_terms_' num2str(grid_i) '.mat'],'wp2_hom_pp_default_all', 'thlp2_hom_pp_default_all', 'rtp2_hom_pp_default_all', 'rtpthlp_hom_pp_default_all',...
            'wp2_het_pp_default_all', 'thlp2_het_pp_default_all', 'rtp2_het_pp_default_all', 'rtpthlp_het_pp_default_all', ...
            'wp2_hom_pp_topunit_all', 'thlp2_hom_pp_topunit_all', 'rtp2_hom_pp_topunit_all', 'rtpthlp_hom_pp_topunit_all',...
            'wp2_het_pp_topunit_all', 'thlp2_het_pp_topunit_all', 'rtp2_het_pp_topunit_all', 'rtpthlp_het_pp_topunit_all', ...
            'wp2_hom_pp_1km_all', 'thlp2_hom_pp_1km_all', 'rtp2_hom_pp_1km_all', 'rtpthlp_hom_pp_1km_all',...
            'wp2_het_pp_1km_all', 'thlp2_het_pp_1km_all', 'rtp2_het_pp_1km_all', 'rtpthlp_het_pp_1km_all' ,...
            'wp2_hom_top_default_all', 'thlp2_hom_top_default_all', 'rtp2_hom_top_default_all', 'rtpthlp_hom_top_default_all',...
            'wp2_het_top_default_all', 'thlp2_het_top_default_all', 'rtp2_het_top_default_all', 'rtpthlp_het_top_default_all', ...
            'wp2_hom_top_topunit_all', 'thlp2_hom_top_topunit_all', 'rtp2_hom_top_topunit_all', 'rtpthlp_hom_top_topunit_all',...
            'wp2_het_top_topunit_all', 'thlp2_het_top_topunit_all', 'rtp2_het_top_topunit_all', 'rtpthlp_het_top_topunit_all', ...
            'wp2_hom_top_1km_all', 'thlp2_hom_top_1km_all', 'rtp2_hom_top_1km_all', 'rtpthlp_hom_top_1km_all',...
            'wp2_het_top_1km_all', 'thlp2_het_top_1km_all', 'rtp2_het_top_1km_all', 'rtpthlp_het_top_1km_all'...
            );
        
    end
end

