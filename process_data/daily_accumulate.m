clear all
close all
DataDir = '/global/u2/d/daleihao/model/code_pft/daily/';
for grid_i = 1:4
    for type_i = {'1km','topunit','default'}
        
        type_i = type_i{1};
        
        
        lhs_tops_all =  nan(size(lhs_tops),365);
        shs_tops_all = nan(size(shs_tops),365);
        rhos_tops_all = nan(size(rhos_tops),365);
        tsas_tops_all = nan(size(tsas_tops),365);
        qs_tops_all = nan(size(qs_tops),365);
        ufs_tops_all = nan(size(ufs_tops),365);
        psurfs_tops_all = nan(size(psurfs_tops),365);
        fsnos_tops_all = nan(size(fsnos_tops),365);
        tvs_tops_all = nan(size(tvs_tops),365);
        fpsns_tops_all = nan(size(fpsns_tops),365);
        fsrs_tops_all = nan(size(fsrs_tops),365);
        fsas_tops_all = nan(size(fsas_tops),365);
        fires_tops_all = nan(size(fires_tops),365);
        
        lhs_pps_all = nan(size(lhs_pps),365);
        shs_pps_all = nan(size(shs_pps),365);
        rhos_pps_all = nan(size(rhos_pps),365);
        tsas_pps_all = nan(size(tsas_pps),365);
        qs_pps_all = nan(size(qs_pps),365);
        ufs_pps_all = nan(size(ufs_pps),365);
        psurfs_pps_all = nan(size(psurfs_pps),365);
        fsnos_pps_all = nan(size(fsnos_pps),365);
        tvs_pps_all = nan(size(tvs_pps),365);
        fpsns_pps_all = nan(size(fpsns_pps),365);
        fsrs_pps_all = nan(size(fsrs_pps),365);
        fsas_pps_all = nan(size(fsas_pps),365);
        fires_pps_all = nan(size(fires_pps),365);
        
        for doy_i = 1:365
            
            FileName = [DataDir 'daily_11year_average_' type_i '_grid_' num2str(grid_i) '_plevel_doy_' num2str(doy_i) '.mat'];
            
            load(FileName);
            
            
            
            if strcmp(type_i, '1km')
                %% average
                lhs_tops_all(:,:,doy_i) = lhs_tops;
                shs_tops_all(:,:,doy_i) = shs_tops;
                rhos_tops_all(:,:,doy_i) = rhos_tops;
                tsas_tops_all(:,:,doy_i) = tsas_tops;
                qs_tops_all(:,:,doy_i) = qs_tops;
                ufs_tops_all(:,:,doy_i) = ufs_tops;
                psurfs_tops_all(:,:,doy_i) = psurfs_tops;
                fsnos_tops_all(:,:,doy_i) = fsnos_tops;
                tvs_tops_all(:,:,doy_i) = tvs_tops;
                fpsns_tops_all(:,:,doy_i) = fpsns_tops;
                fsrs_tops_all(:,:,doy_i) = fsrs_tops;
                fsas_tops_all(:,:,doy_i) = fsas_tops;
                fires_tops_all(:,:,doy_i) = fires_tops;
                
                lhs_pps_all(:,:,doy_i) = lhs_pps;
                shs_pps_all(:,:,doy_i) = shs_pps;
                rhos_pps_all(:,:,doy_i) = rhos_pps;
                tsas_pps_all(:,:,doy_i) = tsas_pps;
                qs_pps_all(:,:,doy_i) = qs_pps;
                ufs_pps_all(:,:,doy_i) = ufs_pps;
                psurfs_pps_all(:,:,doy_i) = psurfs_pps;
                fsnos_pps_all(:,:,doy_i) = fsnos_pps;
                tvs_pps_all(:,:,doy_i) = tvs_pps;
                fpsns_pps_all(:,:,doy_i) = fpsns_pps;
                fsrs_pps_all(:,:,doy_i) = fsrs_pps;
                fsas_pps_all(:,:,doy_i) = fsas_pps;
                fires_pps_all(:,:,doy_i) = fires_pps;
                
            else
                %% average
                lhs_tops_all(:,doy_i) = lhs_tops;
                shs_tops_all(:,doy_i) = shs_tops;
                rhos_tops_all(:,doy_i) = rhos_tops;
                tsas_tops_all(:,doy_i) = tsas_tops;
                qs_tops_all(:,doy_i) = qs_tops;
                ufs_tops_all(:,doy_i) = ufs_tops;
                psurfs_tops_all(:,doy_i) = psurfs_tops;
                fsnos_tops_all(:,doy_i) = fsnos_tops;
                tvs_tops_all(:,doy_i) = tvs_tops;
                fpsns_tops_all(:,doy_i) = fpsns_tops;
                fsrs_tops_all(:,doy_i) = fsrs_tops;
                fsas_tops_all(:,doy_i) = fsas_tops;
                fires_tops_all(:,doy_i) = fires_tops;
                
                lhs_pps_all(:,doy_i) = lhs_pps;
                shs_pps_all(:,doy_i) = shs_pps;
                rhos_pps_all(:,doy_i) = rhos_pps;
                tsas_pps_all(:,doy_i) = tsas_pps;
                qs_pps_all(:,doy_i) = qs_pps;
                ufs_pps_all(:,doy_i) = ufs_pps;
                psurfs_pps_all(:,doy_i) = psurfs_pps;
                fsnos_pps_all(:,doy_i) = fsnos_pps;
                tvs_pps_all(:,doy_i) = tvs_pps;
                fpsns_pps_all(:,doy_i) = fpsns_pps;
                fsrs_pps_all(:,doy_i) = fsrs_pps;
                fsas_pps_all(:,doy_i) = fsas_pps;
                fires_pps_all(:,doy_i) = fires_pps;
            end
            %% save
            save([ 'daily/all_daily_11year_average_' type_i '_grid_' num2str(grid_i) '_plevel.mat'], 'lhs_tops_all',  'shs_tops_all',   'rhos_tops_all',  'tsas_tops_all',    'qs_tops_all' ,       'ufs_tops_all',         'psurfs_tops_all', ...
                'fsnos_tops_all' , 'tvs_tops_all' ,  'fpsns_tops_all' ,     'fsrs_tops_all',         'fsas_tops_all',   'fires_tops_all' , ...
                'lhs_pps_all',  'shs_pps_all',   'rhos_pps_all',  'tsas_pps_all',    'qs_pps_all' ,       'ufs_pps_all',         'psurfs_pps_all', ...
                'fsnos_pps_all' , 'tvs_pps_all' ,  'fpsns_pps_all' ,     'fsrs_pps_all',         'fsas_pps_all',   'fires_pps_all' );
            
        end
    end
end

