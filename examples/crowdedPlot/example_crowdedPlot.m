% When a plot has many points, you may want to use white borders
% for points that are superimposed, and whiskers instead of boxes

colors=[ 0    0.4196    0.6431
1.0000    0.5020    0.0549
0.6706    0.6706    0.6706
0.6431         0    0.4196
0.8392    0.4392    0.8039];

data = randn([200,5]);

point_settings = {'MarkerFaceColor',colors,'MarkerEdgeColor','white','PointSize',80,'LineWidth',1};
whiskers_settings = {'Whiskers','lines','SEMColor','k','StdColor','k','WhiskersWidthRatio',3};
plot_settings = [point_settings whiskers_settings];

UnivarScatter(data,plot_settings{:})
set(gcf,'Position',[0,0,600,300])
