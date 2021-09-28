
function [wp2_sfc, thlp2, rtp2, rtpthlp] = cal_hom(lh, sh, rho, uf)

%% uf -> ustar
%% lh -> latent heat flux
%% wprtp -> sensible heat flux


% define constant
cpair = 1004.64; %heat capacity dry air at const pres (J/kg/k)
lv = 2.501e6; %latent heat of evaporation (J/Kg)
thl_tol=1.e-2; %(K)
rt_tol=1.e-8; %(kg/kg)
w_tol=2.e-2; %(m/s)
w_tol_sqd=w_tol^2;
a_const=1.8;
reduce_coef=0.2;
t0=300;
grav=9.80616;
z_const=1;
ufmin=0.01;
up2_vp2_factor = 2.0;


%%
%%def surface_varnce(upwp, vpwp, wpthlp, wprtp):
%%ustar2 = np.sqrt(upwp**2 + vpwp**2)
%%wstar = np.copy(wpthlp)*np.nan
%%wstar[wpthlp > 0] = (1./t0 * grav * wpthlp[wpthlp > 0] * z_const)**(1./3.)
%%wstar[wpthlp <= 0] = 0.
%%uf = np.sqrt(ustar2 + 0.3 * wstar**2)
%%uf = np.where(uf > ufmin, uf, ufmin)
%%wp2_sfc = a_const * uf**2
%%up2_sfc = up2_vp2_factor * a_const * uf**2
%%vp2_sfc = up2_vp2_factor * a_const * uf**2
%%thlp2=0.4 * a_const * (wpthlp/uf)**2
%%thlp2=np.where(thlp2<thl_tol**2, thl_tol**2, thlp2)
%%rtp2=0.4 * a_const * (wprtp/uf)**2
%%rtp2=np.where(rtp2<rt_tol**2, rt_tol**2, rtp2)
%%rtpthlp=0.2*a_const*(wpthlp/uf)*(wprtp/uf)
%%return wp2_sfc, thlp2, rtp2, rtpthlp

wprtp = lh./(lv.*rho);
wpthlp= sh./(cpair.*rho);


wp2_sfc = a_const .* uf.^2;
%up2_sfc = up2_vp2_factor .* a_const .* uf.^2;
%vp2_sfc = up2_vp2_factor .* a_const .* uf.^2;
thlp2=0.4 * a_const .* (wpthlp./uf).^2;
thlp2(thlp2<thl_tol.^2) =  thl_tol.^2;

rtp2=0.4 * a_const .* (wprtp./uf).^2;
rtp2(rtp2<rt_tol.^2) = rt_tol.^2;

rtpthlp=0.2*a_const*(wpthlp./uf).*(wprtp./uf);