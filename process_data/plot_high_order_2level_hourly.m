

%% plot thlp2
figure;
subplot(1,3,1)
hold on
colormap jet
scatter(thlp2_het_pp_1km_all(:,38), thlp2_het_top_1km_all(:,38))
plot([0 2],[0 2],'k')
ylim([0 2])
xlim([0 2])
xlabel('1km-PP')
ylabel('1km-TOP')
subplot(1,3,2)
hold on
colormap jet
scatter(thlp2_het_pp_1km_all(:,38), thlp2_het_pp_topunit_all(:,38))
plot([0 2],[0 2],'k')
ylim([0 2])
xlim([0 2])
xlabel('1km-PP')
ylabel('Topunit-PP')

subplot(1,3,3)
hold on
colormap jet
scatter(thlp2_het_pp_1km_all(:,38), thlp2_het_pp_default_all(:,38))
plot([0 2],[0 2],'k')
ylim([0 2])
xlim([0 2])
xlabel('1km-PP')
ylabel('Default-PP')

suptitle('Temperature Variance')

figure;
subplot(1,3,1)
hold on
colormap jet
scatter(rtp2_het_pp_1km_all(:), rtp2_het_top_1km_all(:))
plot([0 2],[0 2],'k')
ylim([0 5e-7])
xlim([0 5e-7])
xlabel('1km-PP')
ylabel('1km-TOP')
subplot(1,3,2)
hold on
colormap jet
scatter(rtp2_het_pp_1km_all(:), rtp2_het_pp_topunit_all(:))
plot([0 2],[0 2],'k')
ylim([0 5e-7])
xlim([0 5e-7])
xlabel('1km-PP')
ylabel('Topunit-PP')

subplot(1,3,3)
hold on
colormap jet
scatter(rtp2_het_pp_1km_all(:), rtp2_het_pp_default_all(:))
plot([0 2],[0 2],'k')
ylim([0 5e-7])
xlim([0 5e-7])
xlabel('1km-PP')
ylabel('Default-PP')

suptitle('Moisture Variance')

% 
% plot(thlp2_het_pp_topunit_all(:,38)-thlp2_het_pp_1km_all(:,38), 'g-','linewidth',1)
% plot(thlp2_het_pp_topunit_all(:,38)-thlp2_het_pp_1km_all(:,38), 'b-','linewidth',1)
% %legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
%title('Temperature Variance Difference')
% box on
% xlabel('DOY')
% ylim([-4 4])
% 
% xlim([1 365])
% set(gca,'linewidth',1)
% 
% 
% %% rtpthlp
% subplot(2,2,2)
% hold on
% plot(rtpthlp_het_top_1km_all(:)-rtpthlp_het_pp_1km_all(:), 'r-','linewidth',1)
% plot(rtpthlp_het_pp_topunit_all(:)-rtpthlp_het_pp_1km_all(:), 'g-','linewidth',1)
% plot(rtpthlp_het_pp_default_all(:)-rtpthlp_het_pp_1km_all(:), 'b-','linewidth',1)
% %legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
% title('Temp. Moist. Covariance')
% ylim([-1e-4 1e-4])
% box on
% xlabel('DOY')
% xlim([1 365*48])
% set(gca,'linewidth',1)
% 
% 
% %% plot rtp2
% subplot(2,2,3)
% hold on
% plot(rtp2_het_top_1km_all(:)-rtp2_het_pp_1km_all(:), 'r-','linewidth',1)
% plot(rtp2_het_pp_topunit_all(:)-rtp2_het_pp_1km_all(:), 'g-','linewidth',1)
% plot(rtp2_het_pp_default_all(:)-rtp2_het_pp_1km_all(:), 'b-','linewidth',1)
% %legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
% title('Moisture Covariance')
% ylim([-2e-7 2e-7])
% box on
% xlabel('DOY')
% xlim([1 365*48])
% set(gca,'linewidth',1)
% 
% %% plot wp2
% subplot(2,2,4)
% hold on
% plot(wp2_het_top_1km_all(:)-wp2_het_pp_1km_all(:), 'r-','linewidth',1)
% plot(wp2_het_pp_topunit_all(:)-wp2_het_pp_1km_all(:), 'g-','linewidth',1)
% plot(wp2_het_pp_default_all(:)-wp2_het_pp_1km_all(:), 'b-','linewidth',1)
% legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP','Location','South')
% title('Vertical Velocity Variance')
% ylim([-0.1 0.1])
% box on
% xlabel('DOY')
% xlim([1 365*48])
% set(gca,'linewidth',1)
% print(gcf, '-dsvg', '-r300', ['figures_all/high_order_difference.svg'])
        %         close all
%% all
%%%%%%%%%%%%%%%%%%%%%%%%
%% plot thlp2
figure;
subplot(2,2,1)
%thlp2_het_top_1km_all = thlp2_het_top_1km_all';
hold on
plot(thlp2_het_top_1km_all(:,30), 'k-','linewidth',1)
plot(thlp2_het_pp_1km_all(:,30), 'r-','linewidth',1)
plot(thlp2_het_pp_topunit_all(:,30), 'g-','linewidth',1)
plot(thlp2_het_pp_default_all(:,30), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Temperature Variance')
ylim([0 6])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)


%% rtpthlp
subplot(2,2,2)
hold on
plot(rtpthlp_het_top_1km_all(:), 'k-','linewidth',1)
plot(rtpthlp_het_pp_1km_all(:), 'r-','linewidth',1)
plot(rtpthlp_het_pp_topunit_all(:), 'g-','linewidth',1)
plot(rtpthlp_het_pp_default_all(:), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Temp. Moist. Covariance')
ylim([-1e-4 1e-4])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)


%% plot rtp2
subplot(2,2,3)
hold on
plot(rtp2_het_top_1km_all(:), 'k-','linewidth',1)
plot(rtp2_het_pp_1km_all(:), 'r-','linewidth',1)
plot(rtp2_het_pp_topunit_all(:), 'g-','linewidth',1)
plot(rtp2_het_pp_default_all(:), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Moisture Covariance')
ylim([0e-4 4e-7])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)

%% plot wp2
subplot(2,2,4)
hold on
plot(wp2_het_top_1km_all(:), 'k-','linewidth',1)
plot(wp2_het_pp_1km_all(:), 'r-','linewidth',1)
plot(wp2_het_pp_topunit_all(:), 'g-','linewidth',1)
plot(wp2_het_pp_default_all(:), 'b-','linewidth',1)
legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP','Location','NorthEast')
title('Vertical Velocity Variance')
ylim([0 0.5])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)
print(gcf, '-dsvg', '-r300', ['figures_all/high_order.svg'])


%% hourly
%% plot thlp2
figure;
subplot(2,2,1)
hold on
plot(thlp2_hom_top_1km_all(:)-thlp2_hom_pp_1km_all(:), 'r-','linewidth',1)
plot(thlp2_hom_pp_topunit_all(:)-thlp2_hom_pp_1km_all(:), 'g-','linewidth',1)
plot(thlp2_hom_pp_default_all(:)-thlp2_hom_pp_1km_all(:), 'b-','linewidth',1)
%legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
title('Temperature Variance Difference')
box on
xlabel('DOY')
xlim([1 365*48])
ylim([0 6])
set(gca,'linewidth',1)


%% rtpthlp
subplot(2,2,2)
hold on
plot(rtpthlp_hom_top_1km_all(:)-rtpthlp_hom_pp_1km_all(:), 'r-','linewidth',1)
plot(rtpthlp_hom_pp_topunit_all(:)-rtpthlp_hom_pp_1km_all(:), 'g-','linewidth',1)
plot(rtpthlp_hom_pp_default_all(:)-rtpthlp_hom_pp_1km_all(:), 'b-','linewidth',1)
%legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
title('Temp. Moist. Covariance')
ylim([-1e-4 1e-4])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)


%% plot rtp2
subplot(2,2,3)
hold on
plot(rtp2_hom_top_1km_all(:)-rtp2_hom_pp_1km_all(:), 'r-','linewidth',1)
plot(rtp2_hom_pp_topunit_all(:)-rtp2_hom_pp_1km_all(:), 'g-','linewidth',1)
plot(rtp2_hom_pp_default_all(:)-rtp2_hom_pp_1km_all(:), 'b-','linewidth',1)
%legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP')
title('Moisture Covariance')
ylim([-2e-7 2e-7])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)

%% plot wp2
subplot(2,2,4)
hold on
plot(wp2_hom_top_1km_all(:)-wp2_hom_pp_1km_all(:), 'r-','linewidth',1)
plot(wp2_hom_pp_topunit_all(:)-wp2_hom_pp_1km_all(:), 'g-','linewidth',1)
plot(wp2_hom_pp_default_all(:)-wp2_hom_pp_1km_all(:), 'b-','linewidth',1)
legend('1km-TOP - 1km-PP','Topunit-PP - 1km-PP', 'Default-PP - 1km-PP','Location','South')
title('Vertical Velocity Variance')
ylim([-0.1 0.1])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)
print(gcf, '-dsvg', '-r300', ['figures_all/hom_high_order_difference.svg'])
        %         close all
%% all
%%%%%%%%%%%%%%%%%%%%%%%%
%% plot thlp2
figure;
subplot(2,2,1)

hold on
plot(thlp2_hom_top_1km_all(:), 'k-','linewidth',1)
plot(thlp2_hom_pp_1km_all(:), 'r-','linewidth',1)
plot(thlp2_hom_pp_topunit_all(:), 'g-','linewidth',1)
plot(thlp2_hom_pp_default_all(:), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Temperature Variance')
ylim([0 6])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)


%% rtpthlp
subplot(2,2,2)
hold on
plot(rtpthlp_hom_top_1km_all(:), 'k-','linewidth',1)
plot(rtpthlp_hom_pp_1km_all(:), 'r-','linewidth',1)
plot(rtpthlp_hom_pp_topunit_all(:), 'g-','linewidth',1)
plot(rtpthlp_hom_pp_default_all(:), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Temp. Moist. Covariance')
ylim([-1e-4 1e-4])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)


%% plot rtp2
subplot(2,2,3)
hold on
plot(rtp2_hom_top_1km_all(:), 'k-','linewidth',1)
plot(rtp2_hom_pp_1km_all(:), 'r-','linewidth',1)
plot(rtp2_hom_pp_topunit_all(:), 'g-','linewidth',1)
plot(rtp2_hom_pp_default_all(:), 'b-','linewidth',1)
%legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP')
title('Moisture Covariance')
ylim([0e-4 4e-7])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)

%% plot wp2
subplot(2,2,4)
hold on
plot(wp2_hom_top_1km_all(:), 'k-','linewidth',1)
plot(wp2_hom_pp_1km_all(:), 'r-','linewidth',1)
plot(wp2_hom_pp_topunit_all(:), 'g-','linewidth',1)
plot(wp2_hom_pp_default_all(:), 'b-','linewidth',1)
legend('1km-TOP','1km-PP','Topunit-PP', 'Default-PP','Location','NorthEast')
title('Vertical Velocity Variance')
ylim([0 0.5])
box on
xlabel('DOY')
xlim([1 365*48])
set(gca,'linewidth',1)
print(gcf, '-dsvg', '-r300', ['figures_all/hom_high_order.svg'])
