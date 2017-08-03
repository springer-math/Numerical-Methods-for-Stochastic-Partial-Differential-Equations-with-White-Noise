clc, clear all
t_final = 1;   x_ini= 1;
N= 1000;  h =t_final/N;
num_sample_path = 1e4;
rng(100, 'twister');    % for repeatable  randomized quasi-random sequences.
qmc_sequence= haltonset(N-1 ,'Skip',1e3,'Leap',20);    % Halton sequence
qmc_sequence= scramble( qmc_sequence, 'RR2');   % scramble, randomizing
qmc_sequence = net( qmc_sequence, num_sample_path);
qmc_sequence=erfinv(2*qmc_sequence-1)*sqrt(2);  % an inverse transformation for Gaussian
% time marching, Euler scheme
W_k = 0;
X_k = x_ini* ones(num_sample_path,1);
for  k= 1: N-1    
    W_k = W_k + sqrt(h)* qmc_sequence(:,k);
    X_k = X_k + W_k.*X_k*h;    
end
X_mean = mean(X_k);
X_second_moment = mean(X_k.^2);
X_mean_stat_error = 1.96 * sqrt(var(X_k)/ num_sample_path);
X_second_moment_stat_error = 1.96 * sqrt( var (X_k.^2)/ num_sample_path);
