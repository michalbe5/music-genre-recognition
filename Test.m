%% TEST
% C - nazwa stworzonego modelu

%zadzia³anie danymi testowymi na model
y_fit=C.predictFcn(X_test);
confMat = confusionmat(y_test,y_fit);

%pobranie dok³adnych wyników identyfikacji
result=[];
T=0;
F=0;
for k=1:length(y)
    if y(k,1)==y_fit(k,1)
        x=[1];
        result=horzcat(result, x);
        T=T+1;
    else 
        x=[0];
        k;
        result=horzcat(result, x);
        F=F+1;
    end
end

 Accuracy=T/(T+F)*100   %wyliczenie skutecznoœci

%wyliczenie precyzji
for i =1:size(confMat,1)
    precision(i)=confMat(i,i)/sum(confMat(:,i));
end

Precision=sum(precision)/size(confMat,1)

%wyliczenie czu³oœci
for i =1:size(confMat,1)
    recall(i)=confMat(i,i)/sum(confMat(i,:));
end

recall(isnan(recall))=[];

recall=mean(recall)

%wyliczenie wspó³czynnika F1
F1_score=2*recall*Precision/(Precision+recall)

F1_score=2*1./((1./Precision)+(1./recall));
