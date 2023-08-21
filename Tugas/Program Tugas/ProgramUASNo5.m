clc; clear; clf;

% number of agents
N = 5;

% adjacency matrix for a cycle graph
A = [0 1 0 0 1; 
     1 0 1 0 0; 
     0 1 0 1 0; 
     0 0 1 0 1; 
     1 0 0 1 0];

% input node and floating nodes
input_node = 1;
floating_nodes = 2:N;

% Laplacian matrix
L = diag(sum(A)) - A;

% Af and Bf matrices
Af = L(floating_nodes, floating_nodes);
Bf = L(floating_nodes, input_node);

% time steps
T = 50;

% control signal
u = zeros(T, 1);
u(1) = 1; % initial control signal

% initial states
xf = randn(N-1, T); % initial states of floating nodes

% output
y = zeros(T, 1);

% simulation
for k = 1:T-1
    % update states of floating nodes
    xf(:,k+1) = xf(:,k) + 0.1*(-Af*xf(:,k) - Bf*u(k));
    
    % calculate output
    y(k) = -Bf' * xf(:,k);
    
    % update control signal
    u(k+1) = -y(k); % feedback control
end

% plot the states of floating nodes
figure(1);
plot(1:T, xf');
title('States of floating nodes');
xlabel('Time step');
ylabel('State');

% plot the control signal
figure(2);
plot(1:T, u);
title('Control signal');
xlabel('Time step');
ylabel('u[k]');

% plot the output
figure(3);
plot(1:T, y);
title('Output');
xlabel('Time step');
ylabel('y[k]');
