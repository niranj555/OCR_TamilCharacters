function [J, grad] = lrCostFunction(theta, X, y, lambda)
 


m = length(y); % number of training examples
 
J = 0;
grad = zeros(size(theta));




htheta=sigmoid(X*theta);
J=(y(:)')*(log(htheta(:)))+((1-y(:))')*(log(1-htheta(:)));
sum1=theta(2:end)' * theta(2:end);
J=((-1)*J/m)+(lambda*sum1/(2*m));

grad(1)=(((((htheta(:)-y(:))'))*X(:,1))/m);

grad(2:end)=(((((htheta(:)-y(:))'))*X(:,2:end))/m);
grad(2:end)=grad(2:end)+(lambda/m)*theta(2:end);










% =============================================================

grad = grad(:);

end
