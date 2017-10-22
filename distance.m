function d = distance(x1,x2)
sz=size(x1,2);
sm=0;
for i=1:sz
	sm=sm+(x1(i)-x2(i))^2;
end
avg=sm/sz;
d=avg^.5;
end
