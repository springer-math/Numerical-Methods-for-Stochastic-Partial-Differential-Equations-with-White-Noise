clc, clear all
t_final = 1;   X_ini= 1;
N= 10000;  h =t_final/N;
n=40;  % truncation of specral approximation
sparse_grid_dim = n;    % n
sparse_grid_level = 2;  %  less than 5
[sparse_grid_nodes, sparse_grid_weights]=nwspgr('GQN', ...
    sparse_grid_dim,  sparse_grid_level);
num_sample_path=size(sparse_grid_weights,1);
% time marching, Euler scheme
W_k = 0;
X_k = X_ini* ones(num_sample_path,1);
for  k= 1: N-1    
    t_k=k*h;
    W_k = t_k*sparse_grid_nodes(:,1);    
    for i=2:n
        W_k = W_k+ sqrt(2)* sparse_grid_nodes(:,i)*sin(pi*(i-1)*t_k)/(i-1)/pi;
    end    
    X_k = X_k + W_k.*X_k*h;    
end
X_mean = sum(X_k.*sparse_grid_weights);
X_second_moment = sum(X_k.^2.*sparse_grid_weights);
