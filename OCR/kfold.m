load fisheriris
%meas=u2(:,2:257);
%species=u2(:,1);
indices= crossvalind('Kfold',species,10);
cp=classperf(species);
for i=1:10
        test=(indices == i); train=~test;
        class=classify(meas(test,:),meas(train,:),species(train,:));
        classperf(cp,class,test);
        %cp.CountingMatrix
        %pause
end

cp.CorrectRate
cp.ErrorRate
cp.CountingMatrix

