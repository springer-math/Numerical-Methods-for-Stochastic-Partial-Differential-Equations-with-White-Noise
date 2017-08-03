x_left=0; x_right=2*pi;  % l=2*pi
M=128;
h=(x_right-x_left)/M;
%set up  Fourier spectral differentiation matrix
column=[0  0.5*(-1).^(1:M-1).*cot((1:M-1)*h/2)];
D=toeplitz(column, column([1 M:-1:2]));
