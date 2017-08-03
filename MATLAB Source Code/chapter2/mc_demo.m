  n = 1000;  % the number of sample points
 % Declare the status of random number generators- Merrsen-Twister 
  rng(100, 'twister');  
  X =  randn ( n, 1);  
  p = 2;
  mu_hat =  mean (X.^p);
  mc_int_err = mu_hat - 1;   %  integration error  
  stat_err = 1.96*sqrt( var (X.^2)/n);  %   statistical error
