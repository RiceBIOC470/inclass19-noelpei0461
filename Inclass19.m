%In class 19

% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 

c=[mean(placebo) mean(treatment1) mean(treatment2)];
bar(c);
hold on;
err=8*ones(size(c))
errorbar(c,err)

%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 
data=[placebo treatment1 treatment2];
groups={'placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2'};
p=anova1(data,groups)
%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 
[p,table,stats]=anova1(data,groups);
multcompare(stats)

%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.
file = load('data.mat');
xdat = file.xdat;
ydat = file.ydat;
ydat2 = file.ydat2;

[coeff,s]=polyfit(xdat',ydat',1);
plot(xdat',ydat','r.','MarkerSize','20');hold on;
plot(xdat',polyval(coeff,xdat'),'k-','LineWidth',3);
hold off;
[coeff,s]=polyfit(xdat',ydat',2);
plot(xdat',ydat','r.','MarkerSize','20');hold on;
plot(xdat',polyval(coeff,xdat'),'k-','LineWidth',3);
hold off;
[coeff,s]=polyfit(xdat',ydat',3);
plot(xdat',ydat','r.','MarkerSize','20');hold on;
plot(xdat',polyval(coeff,xdat'),'k-','LineWidth',3);
hold off;

[coeff,s]=polyfit(xdat',ydat2',1);
plot(xdat',ydat2','r.','MarkerSize','20');hold on;
plot(xdat',polyval(coeff,xdat'),'k-','LineWidth',3);
hold off;
[coeff,s]=polyfit(xdat',ydat2',2);
plot(xdat',ydat2','r.','MarkerSize','20');hold on;
plot(xdat',polyval(coeff,xdat'),'k-','LineWidth',3);
hold off;
[coeff,s]=polyfit(xdat',ydat2',3);
plot(xdat',ydat2','r.','MarkerSize','20');hold on;
plot(xdat',polyval(coeff,xdat'),'k-','LineWidth',3);
hold off;

f2_1=fit(xdat',ydat2','poly1');
f2_2=fit(xdat',ydat2','poly2');
f2_2=fit(xdat',ydat2','poly3');
figure;
plot(xdat',ydat2','k-','MarkerSize','20');
hold on;
plot(f2_1,'r');
plot(f2_2,'g');
plot(f2_3,'b');
legend('data','order 1','order 2','order 3');
% In both cases, 3rd order of nominal best fits the data.
