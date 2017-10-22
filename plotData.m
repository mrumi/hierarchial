function plotData(X, y)
	figure; 
	hold on;
	pos_x=find(y==1);
	neg_x=find(y==2);
	p=find(y==3);
	n=find(y==4);
	f=find(y==5);
	plot(X(pos_x,1),X(pos_x,2),'r+');
	plot(X(neg_x,1),X(neg_x,2),'g*');
	plot(X(p,1),X(p,2),'bx');
	plot(X(n,1),X(n,2),'co');
	plot(X(f,1),X(f,2),'mx');

	xlabel('Feature 1')
	ylabel('Feature 2')


	hold off;

end
