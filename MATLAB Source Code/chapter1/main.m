
% This file is used to produce color noises in Chapter 1. 

clc, clear all
rng(100, 'twister');


NumChannels = 1;
NumSamples = 8e2;

 
dt= 1/NumSamples;
t = dt:dt:1; t=t.';

alpha = 2;
bm= dt^(alpha/2-0.5)* f_alpha_gaussian ( NumSamples, 1, alpha);

alpha=1;
pn = dt^(alpha/2-0.5)* f_alpha_gaussian ( NumSamples, 1, alpha);

alpha=0;
wn =dt^(alpha/2-0.5)* f_alpha_gaussian ( NumSamples, 1, alpha);

alpha=0.5;
wnhalf = dt^(alpha/2-0.5)* f_alpha_gaussian ( NumSamples, 1, alpha);

alpha=0.1;
wnoneten = dt^(alpha/2-0.5)* f_alpha_gaussian ( NumSamples, 1, alpha);

alpha=0.05;
wnonetw = dt^(alpha/2-0.5)* f_alpha_gaussian ( NumSamples, 1, alpha);

alpha=1.5;
wnthreehalf = dt^(alpha/2-0.5)* f_alpha_gaussian ( NumSamples, 1, alpha);

%alpha=-1;
%bn = dt^(alpha/2-0.5)* f_alpha_gaussian ( NumSamples, 1, alpha);

figure(1)
plot(t,bm,'r')
saveas(1,'bm_intro.eps','epsc2')

figure(2)
plot(t,wnthreehalf,'color', [205 92 92]/255)   % Indian Red 	205-92-92
saveas(2,'alphathreehalf_intro.eps','epsc2')

figure(3)
plot(t,pn,'color',[255 	181 	197]/255)
saveas(3,'pink_intro.eps','epsc2')

figure(4)
plot(t,wn,'k'); %'color', [ 	248 	248 	255]/255)
saveas(4,'white_intro.eps','epsc2')

figure(5)
plot(t,wnhalf,'color', [139 137 137]/256)   % snow 4   139-137-137
saveas(5,'alphahalf_intro.eps','epsc2')

figure(6)
plot(t,wnoneten,'color',  [205 201 201]/255)     % snow 3  205-201-201
saveas(6,'alphaonetenth_intro.eps','epsc2')
 
figure(7)
plot(t,wnonetw,'color', [220 220 220]/255)   %220-220-220 Gainsboro
saveas(7,'alphaonetw_intro.eps','epsc2')
 



%{


figure(5)
plot(t,bn,'b')
saveas(5,'blue_intro.eps','epsc2')
%}
