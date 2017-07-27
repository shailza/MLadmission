function plotData(X, y)
figure; hold on;
pos=find(y==1);
neg=find(y==0);
plot(X(pos,1),X(pos,2),'k+','LineWidth',3,'MarkerSize',5);
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','y','MarkerSize',5);
hold off;
end
