%% Rozenfeld et al. 2019 - Figure 4E
clc;clear
load('ACV valance.mat');

bar(1,nanmean(Dm1_RNAi),0.4,'k');
hold on;
bar(2,nanmean(GH298),0.4,'b');
hold on;
bar(3,nanmean(GH298_Dm1_RNAi),0.4,'r');
hold on;
bar(4,nanmean(Orco_DM1_RNAi),0.4,'m');
hold on;
bar(5,nanmean(GH146_DM1_RNAi),0.4,'g');
hold on;
bar(6,nanmean(LN2_Dm1_RNAi),0.4,'y');
hold on;
UnivarScatter([Dm1_RNAi,GH298,GH298_Dm1_RNAi,Orco_DM1_RNAi,GH146_DM1_RNAi,LN2_Dm1_RNAi],...
'Width',0.2,'Compression',15,'Label',{'UAS-mAChR-A RNAi','GH298-GAL4','GH298>mAChR-A RNAi','Orco>mAChR-A RNAi','GH146>mAChR-A RNAi','LN2>mAChR-A RNAi'},'Whiskers','none'...
,'MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6]);
xtickangle(45);
ylim([-110 110]);
box off;


