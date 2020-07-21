% This program executes the k-fold cross validation using SVM on 4250 images. It may take
% 8-10 mins to run.

%This code uses some function from the Bio-Informatics Toolbox from MATLAB.

%# load dataset
load('nasvm.mat')

%[g gn] = grp2idx(u(:,1)); 
%# nominal class to numeric
meas=set(:,2:42);
%u(:,1)=u(:,1)+1;
g=set(:,1);
gn=1:5;
indices= crossvalind('Kfold',g,10);
cp=classperf(g);

for i=1:10
        testIdx=(indices == i); trainIdx=~testIdx;
pairwise = nchoosek(1:length(gn),2);            %# 1-vs-1 pairwise models
svmModel = cell(size(pairwise,1),1);            %# store binary-classifers
predTest = zeros(sum(testIdx),numel(svmModel)); %# store binary predictions

%# classify using one-against-one approach, SVM with 3rd degree poly kernel
for k=1:numel(svmModel)
    %# get only training instances belonging to this pair
    idx = trainIdx & any( bsxfun(@eq, g, pairwise(k,:)) , 2 );
    
    %# train
   unique(g(idx))
    svmModel{k} = svmtrain(meas(idx,:), g(idx),'BoxConstraint',2e-1, 'Kernel_Function','linear');%'polynomial', 'Polyorder',1);
% svmModel{k} = svmtrain(meas(idx,:) , g(idx),'-t 0 -s 2');
    %# test
    predTest(:,k) = svmclassify(svmModel{k}, meas(testIdx,:));
end
pred = mode(predTest,2);   %# voting: clasify as the class receiving most votes
 classperf(cp,pred,testIdx);
end
%# performance
% cmat = confusionmat(g(testIdx),pred);
% acc = 100*sum(diag(cmat))./sum(cmat(:));
% fprintf('SVM (1-against-1):\naccuracy = %.2f%%\n', acc);
% fprintf('Confusion Matrix:\n'), disp(cmat)