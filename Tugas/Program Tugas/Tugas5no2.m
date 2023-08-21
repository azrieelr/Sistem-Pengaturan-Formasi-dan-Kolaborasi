% Program untuk tugas 5 no 2

%===================================
%PERSIAPAN

D = [-1 0;1 -1;0 1]; %incidence matrix
W = [0.5 0;0 0.6]; %weight matrix

L = D*W*D'; %Laplacian cara manual

L2 = [0.5 -0.5 0;-0.5 1.1 -0.6;0 -0.6 0.6]; %Laplacian jadian sesuai buku

I = eye(length(L)); %matriks identitas
stepsize = 1; %stepsize 
M = I - stepsize*L; %matriks M

x(1:3,1) = [0.1;1;0.4]; %initial state
%===================================
%UPDATE States
for k = 1:30
    x(:,k+1) = M*x(:,k);
end

%===================================
%Plotting
plot(x(1,:));
hold on
plot(x(2,:));
plot(x(3,:));
legend('x1','x2','x3');
