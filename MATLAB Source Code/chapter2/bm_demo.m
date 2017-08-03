% One realization of W(t) at time grids k*dt 
clc, clear all
t =2.5;
n= 1000;
dt = t / n;
%  Increments of Brownian motion
Winc  = zeros ( n + 1,1);
% Declare the status of random number generator -- Mersenne Twister
rng(100, 'twister');
Winc(1:n) = sqrt ( dt ) * randn ( n, 1);
%  Brownian motion - cumulative sum of all previous increments 
W(2:n+1,1) = cumsum ( Winc(1:n) );
figure(10)
plot((1:n+1).'*dt,W,'b-','Linewidth',2);
xlabel('t')
ylabel('W(t)') 
axis tight  
