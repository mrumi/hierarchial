
%% Initialization
clear ; close all; clc

data=load('training.txt');
m=size(data,2);
x=data(:,1:m-1);
k=size(x,1)
y=data(:,m);

nCluster=5;
prox=zeros(k,k);
class=zeros(k,1);
for i=1:k
	class(i)=i;
end
for i=1:k
	a1=x(i,:);
	for j=1:k
		if(i==j)
			prox(i,j)=10000;
			continue;
		end
		if(prox(i,j)!=0)
			continue;
		end
		a2=x(j,:);
		d=distance(a1,a2);
		prox(i,j)=d;
		prox(j,i)=d;
	end
end
prox;
num=k;
i=0;

while num>nCluster
	
	mindis=min(prox(:));
	[row,col]=find(prox==mindis);
	b1=row(1);
	b2=col(1);
	if(b1>b2)
		change=b1;
		update=b2;
	else
		change=b2;
		update=b1;
	end
	pos=find(class==change);
	for i=1:size(pos,1)
		class(pos(i))=update;
	end
	pos=find(class>change);
	for i=1:size(pos,1)
		class(pos(i))=class(pos(i))-1;
	end
	prox(change,:)=[];
	prox(:,change)=[];

	index=find(class==update);

	for i=1:num-1
		if(i==update)
			prox(i,i)=10000;
			continue;
		end
		id=find(class==i);
		grp_avg=proximity(x,index,id);
		prox(i,update)=grp_avg;
		prox(update,i)=grp_avg;
	
	end
	num=num-1;
endwhile
class;
%save class.txt class -ascii;
plotData(x,class);
%pause;
cent=zeros(nCluster,m-1);
for i=1:nCluster
	position=find(class==i);
	cent(i,:)=mean(x(position,:));
end
%[ctr,points,assign]=kmeans(x,cent,nCluster);
%plotData(x,assign);





