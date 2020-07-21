function p = predictOneVsAll(all_theta, X)


m = size(X, 1);
num_labels = size(all_theta, 1);


p = zeros(size(X, 1), 1);


X = [ones(m, 1) X];



z=sigmoid(X*all_theta');
z
for i=1:m
[maxarray I]=max(z(i,:),[],2);
p(i)=I;
end









% =========================================================================


end
