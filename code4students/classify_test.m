%%HERE IS WHERE YOU NEED TO ENTER THE COLUMNS OF NUM YOUR FINAL MODEL
%%INCLUDES!
include_cols = [3];

%import clinical data - this is the basis of the static model
clinical_data = load('clinical_data_training.mat');

%generate your final static glm here (replace the code below with your
%model)

Y = clinical_data.num(:,2);
X = clinical_data.num(:,include_cols);
[B,dev,stats] = glmfit(X,Y,'binomial');
Phat = 1./(1+exp(-[ones(size(X,1),1) X]*B));

[thresh] = test_performance(Phat, Y);

%bring in testing data
clinical_data_test = load('clinical_data_testing.mat');

%modify line below to incoporate your final covariates
X_test = clinical_data_test.num(:,include_cols);

Phat_test = 1./(1+exp(-[ones(size(X_test,1),1) X_test]*B));
Y_test = clinical_data_test.num(:,2);

Y_test_bestguess = Phat_test>thresh;
PercentCorrect = (1 - sum(abs(Y_test-Y_test_bestguess))/length(Y_test))*100

%You can add code to output sensitivity and specificity below

