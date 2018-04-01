c1 = [0 0 1]; c2 = [0 1 0]; c3 = [0 1 1]; c4 = [1 0 0]; c5 = [1 0 1];
c6 = [1 1 0]; c7 = [0 0.65 0]; c8 = [0.5 0 0.5]; c9 = [0.6 0.4 0.2]; c10 = [1 0.5 0.2];
p1 = scatter(proto(1,1,i), proto(1,2,i), 100,'MarkerEdgeColor',c1,'MarkerFaceColor',c1,'LineWidth',1.5); hold on;
p2 = scatter(proto(2,1,i), proto(2,2,i), 100,'MarkerEdgeColor',c2,'MarkerFaceColor',c2,'LineWidth',1.5);
p3 = scatter(proto(3,1,i), proto(3,2,i), 100,'MarkerEdgeColor',c3,'MarkerFaceColor',c3,'LineWidth',1.5);
p4 = scatter(proto(4,1,i), proto(4,2,i), 100,'MarkerEdgeColor',c4,'MarkerFaceColor',c4,'LineWidth',1.5);
p5 = scatter(proto(5,1,i), proto(5,2,i), 100,'MarkerEdgeColor',c5,'MarkerFaceColor',c5,'LineWidth',1.5);
p6 = scatter(proto(6,1,i), proto(6,2,i), 100,'MarkerEdgeColor',c6,'MarkerFaceColor',c6,'LineWidth',1.5);
p7 = scatter(proto(7,1,i), proto(7,2,i), 100,'MarkerEdgeColor',c7,'MarkerFaceColor',c7,'LineWidth',1.5);
p8 = scatter(proto(8,1,i), proto(8,2,i), 100,'MarkerEdgeColor',c8,'MarkerFaceColor',c8,'LineWidth',1.5);
p9 = scatter(proto(9,1,i), proto(9,2,i), 100,'MarkerEdgeColor',c9,'MarkerFaceColor',c9,'LineWidth',1.5);
p10 = scatter(proto(10,1,i), proto(10,2,i), 100,'MarkerEdgeColor',c10,'MarkerFaceColor',c10,'LineWidth',1.5);
xlabel('x1'); ylabel('x2');
title('K-Means Unlabelled Clustering');
legend([p1 p2 p3 p4 p5 p6 p7 p8 p9 p10], 'Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5',...
    'Class 6', 'Class 7', 'Class 8', 'Class 9', 'Class 10','Location','northwest'); 