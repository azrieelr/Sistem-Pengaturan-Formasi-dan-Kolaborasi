clc; clf; clear all 

% Define Laplacian matrix
L = [2 -1 0 0 -1;
     -1 2 -1 0 0;
     0 -1 2 -1 0;
     0 0 -1 2 -1;
     -1 0 0 -1 2];

% Define initial state
x0 = [1; 2; 3; 4; 5];

% Define time range and step size
tspan = [0 10];
dt = 0.01;

% Define ODE function
odefun = @(t, x) -L*x;

% Solve ODE
[t, x] = ode45(odefun, tspan, x0);

% Plot results
plot(t, x);
legend('Vertex 1', 'Vertex 2', 'Vertex 3', 'Vertex 4', 'Vertex 5');
xlabel('Time');
ylabel('State');