clc, clear all
t_final = 1;   X_ini= 1;
N= 40;  h =t_final/N;
sparse_grid_dim = N-1;
sparse_grid_level = 2;
[sparse_grid_nodes, sparse_grid_weights]=nwspgr('GQN', ...
    sparse_grid_dim,  sparse_grid_level);
num_sample_path=size(sparse_grid_weights,1);
% time marching, Euler scheme
W_k = 0;
X_k = X_ini* ones(num_sample_path,1);
for  k= 1: N-1    
    W_k = W_k + sqrt(h)* sparse_grid_nodes(:,k);
    X_k = X_k + W_k.*X_k*h;    
end
X_mean = sum(X_k.*sparse_grid_weights);
X_second_moment = sum(X_k.^2.*sparse_grid_weights);
