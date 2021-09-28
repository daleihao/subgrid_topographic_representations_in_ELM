
function [wp2_het, thlp2_het, rtp2_het, rtpthlp_het] = cal_het(f2d, lh, sh, rho, tsa_pft, q_pft, uf, ps2d)

%t_pft = tsa_pft;
t_pft = tsa_pft.*(100000./ps2d).^0.286;  % potential temperature
twa = nansum(f2d.*t_pft, 1);  % TSA 2m air temperature
qwa = nansum(f2d.*q_pft, 1); % Q2M 2m specific humidity

[wp2_pft, thlp2_pft, rtp2_pft, rtpthlp_pft] = cal_hom(lh, sh, rho, uf);

wp2_het = nansum(f2d.*wp2_pft, 1);
thlp2_het = nansum(f2d.*thlp2_pft, 1)+nansum(f2d.*((t_pft-twa).^2), 1);
rtp2_het = nansum(f2d.*rtp2_pft, 1)+nansum(f2d.*((q_pft-qwa).^2), 1);
rtpthlp_het = nansum(f2d.*rtpthlp_pft, 1)+nansum(f2d.*(t_pft-twa).*(q_pft-qwa), 1);

