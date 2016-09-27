%import clinical data - this is the basis of the simple model

clinical_data = load('clinical_data_training.mat');

%generate simple glm

%define Y = observations which should be loaded from clinical table
Y = num(:,2);

%define X = covariate matrix by taking features from clinical table and
%waveform table. This currently only uses Gender as a covariate.
X = num(:,3);

%compute glm
[B,dev,stats] = glmfit(X,Y,'binomial');



%construct phat from parameters and X 
Phat = 1./(1+exp(-[ones(size(X,1),1) X]*B)); %equivalent way to compute Phat


%plot phat versus patient along with its confidence bounds (1.96*stats.se)

Phat_UB = ???
Phat_LB = ???

figure(1)
clf
plot(Phat)
hold on
plot(Phat_LB,'b-')
hold on
plot(Phat_UB,'b-')
hold on
plot(Y,'r*')
title('Models for Each Patient')

%test performance of models
[threshold] = test_performance(Phat, Y);


