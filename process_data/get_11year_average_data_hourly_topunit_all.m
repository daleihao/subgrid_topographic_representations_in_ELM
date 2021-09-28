clear all
close all
parpool(10);
for grid_i = 1:4
    for file_i = {'','no_PFT_soil_','no_PFT_','no_soil_'}

        
        type_i = 'topunit';
        file_i = file_i{1};

            
            DataTopDir = ['/global/cscratch1/sd/daleihao/e3sm_scratch/cori-knl/' file_i 'elm_plevel_top_11years_' type_i '_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel/run/' ];
            
            DataPPDir = ['/global/cscratch1/sd/daleihao/e3sm_scratch/cori-knl/' file_i 'elm_plevel_notop_11years_' type_i '_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel/run/' ];
            
        parfor doy_i = 1:365
            filename = [ 'topunit_hourly/' file_i 'hourly_11year_average_' type_i '_grid_' num2str(grid_i) '_plevel_doy_'  num2str(doy_i) '.mat'];
            if(exist(filename, 'file'))
                continue;
            end
            
            for year_i = 2000:2010
                %% import data
                date_i = datetime(2001, 1, doy_i);
                month_i = month(date_i);
                day_i = day(date_i);
                
                    
                    file_top_tmp = [DataTopDir file_i 'elm_plevel_top_11years_' type_i '_grid' num2str(grid_i) '_CLM_USRDAT.ICLM45.intel.clm2.h0.' num2str(year_i)  '-' num2str(month_i, '%02d') '-' num2str(day_i, '%02d')  '-00000.nc'];
                    file_pp_tmp = [DataPPDir file_i 'elm_plevel_notop_11years_' type_i '_grid'  num2str(grid_i) '_CLM_USRDAT.ICLM45.intel.clm2.h0.' num2str(year_i)   '-' num2str(month_i, '%02d') '-' num2str(day_i, '%02d')  '-00000.nc'];
               
                
                lhs_top = ncread(file_top_tmp, 'EFLX_LH_TOT');
                shs_top = ncread(file_top_tmp, 'Qh');
                rhos_top = ncread(file_top_tmp, 'RHO');
                tsas_top = ncread(file_top_tmp, 'TSA') ;
                qs_top = ncread(file_top_tmp, 'Q2M') ;
                ufs_top = ncread(file_top_tmp, 'ustar_patch') ;
                psurfs_top = ncread(file_top_tmp, 'PSurf');
                fsnos_top = ncread(file_top_tmp, 'FSNO');
                tvs_top = ncread(file_top_tmp, 'TV');
                fpsns_top = ncread(file_top_tmp, 'FPSN') ;
                fsrs_top = ncread(file_top_tmp, 'FSR') ;
                fsas_top = ncread(file_top_tmp, 'FSA') ;
                fires_top = ncread(file_top_tmp, 'FIRE');
                
                %shs = ncread(file_notop_1km, 'FSH');
                lhs_pp = ncread(file_pp_tmp, 'EFLX_LH_TOT');
                shs_pp = ncread(file_pp_tmp, 'Qh');
                rhos_pp = ncread(file_pp_tmp, 'RHO');
                tsas_pp = ncread(file_pp_tmp, 'TSA') ;
                qs_pp = ncread(file_pp_tmp, 'Q2M') ;
                ufs_pp = ncread(file_pp_tmp, 'ustar_patch') ;
                psurfs_pp = ncread(file_pp_tmp, 'PSurf');
                fsnos_pp = ncread(file_pp_tmp, 'FSNO');
                tvs_pp = ncread(file_pp_tmp, 'TV');
                fpsns_pp = ncread(file_pp_tmp, 'FPSN') ;
                fsrs_pp = ncread(file_pp_tmp, 'FSR') ;
                fsas_pp = ncread(file_pp_tmp, 'FSA') ;
                fires_pp = ncread(file_pp_tmp, 'FIRE');
                
                if year_i == 2000
                    
                    lhs_tops = lhs_top;
                    shs_tops = shs_top;
                    rhos_tops = rhos_top;
                    tsas_tops = tsas_top;
                    qs_tops = qs_top;
                    ufs_tops = ufs_top;
                    psurfs_tops = psurfs_top;
                    fsnos_tops = fsnos_top;
                    tvs_tops = tvs_top;
                    fpsns_tops = fpsns_top;
                    fsrs_tops = fsrs_top;
                    fsas_tops = fsas_top;
                    fires_tops = fires_top;
                    
                    lhs_pps = lhs_pp;
                    shs_pps = shs_pp;
                    rhos_pps = rhos_pp;
                    tsas_pps = tsas_pp;
                    qs_pps = qs_pp;
                    ufs_pps = ufs_pp;
                    psurfs_pps = psurfs_pp;
                    fsnos_pps = fsnos_pp;
                    tvs_pps = tvs_pp;
                    fpsns_pps = fpsns_pp;
                    fsrs_pps = fsrs_pp;
                    fsas_pps = fsas_pp;
                    fires_pps = fires_pp;
                    
                else
                    
                    lhs_tops = lhs_tops + lhs_top;
                    shs_tops = shs_tops + shs_top;
                    rhos_tops = rhos_tops + rhos_top;
                    tsas_tops = tsas_tops + tsas_top;
                    qs_tops = qs_tops + qs_top;
                    ufs_tops = ufs_tops + ufs_top;
                    psurfs_tops = psurfs_tops + psurfs_top;
                    fsnos_tops = fsnos_tops + fsnos_top;
                    tvs_tops = tvs_tops + tvs_top;
                    fpsns_tops = fpsns_tops + fpsns_top;
                    fsrs_tops = fsrs_tops + fsrs_top;
                    fsas_tops = fsas_tops + fsas_top;
                    fires_tops = fires_tops + fires_top;
                    
                    lhs_pps = lhs_pps + lhs_pp;
                    shs_pps = shs_pps + shs_pp;
                    rhos_pps = rhos_pps + rhos_pp;
                    tsas_pps = tsas_pps + tsas_pp;
                    qs_pps = qs_pps + qs_pp;
                    ufs_pps = ufs_pps + ufs_pp;
                    psurfs_pps = psurfs_pps + psurfs_pp;
                    fsnos_pps = fsnos_pps + fsnos_pp;
                    tvs_pps = tvs_pps + tvs_pp;
                    fpsns_pps = fpsns_pps + fpsns_pp;
                    fsrs_pps = fsrs_pps + fsrs_pp;
                    fsas_pps = fsas_pps + fsas_pp;
                    fires_pps = fires_pps + fires_pp;
                end
            end
            
            %% average
            lhs_tops = lhs_tops/11;
            shs_tops = shs_tops/11;
            rhos_tops = rhos_tops/11;
            tsas_tops = tsas_tops/11;
            qs_tops = qs_tops/11;
            ufs_tops = ufs_tops/11;
            psurfs_tops = psurfs_tops/11;
            fsnos_tops = fsnos_tops/11;
            tvs_tops = tvs_tops/11;
            fpsns_tops = fpsns_tops/11;
            fsrs_tops = fsrs_tops/11;
            fsas_tops = fsas_tops/11;
            fires_tops = fires_tops/11;
            
            lhs_pps = lhs_pps/11;
            shs_pps = shs_pps/11;
            rhos_pps = rhos_pps/11;
            tsas_pps = tsas_pps/11;
            qs_pps = qs_pps/11;
            ufs_pps = ufs_pps/11;
            psurfs_pps = psurfs_pps/11;
            fsnos_pps = fsnos_pps/11;
            tvs_pps = tvs_pps/11;
            fpsns_pps = fpsns_pps/11;
            fsrs_pps = fsrs_pps/11;
            fsas_pps = fsas_pps/11;
            fires_pps = fires_pps/11;
            
            %% save
            savefiles(filename, lhs_tops,  shs_tops,   rhos_tops,  tsas_tops,    qs_tops ,       ufs_tops,         psurfs_tops, ...
                fsnos_tops , tvs_tops ,  fpsns_tops ,     fsrs_tops,         fsas_tops,   fires_tops , ...
                lhs_pps,  shs_pps,   rhos_pps,  tsas_pps,    qs_pps ,       ufs_pps,         psurfs_pps, ...
                fsnos_pps , tvs_pps ,  fpsns_pps ,     fsrs_pps,         fsas_pps,   fires_pps);
        end
    end
end

