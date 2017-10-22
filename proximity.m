function avg=proximity(X,index1,index2)

n1=size(index1,1);
n2=size(index2,1);

sum=0;
for i=1:n1
	a1=X(index1(i),:);
	for j=1:n2
		a2=X(index2(j),:);
		sum=sum+distance(a1,a2);
	end
end
avg=sum/(n1*n2);
end