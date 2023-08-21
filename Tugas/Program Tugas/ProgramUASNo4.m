clc; clear; clf

% set the number of nodes
N = 4;

% set the weighting matrix
W = [0 0.6 0 0.6; 0.4 0 0.4 0; 0 0.6 0 0.6; 0.4 0 0.4 0];

% set the step size
delta = 1/N;

% initial state
x = randn(N,1);
x_history = x; % history of states for each node

% noise
v = randn(N,1);

% observations
z = zeros(N,1);

% identity matrix
H = eye(N);

% number of iterations
num_iter = 20;

% update states
for t = 1:num_iter
    for i = 1:N
        z(i) = H(i,:) * x + v(i);
        x = x + delta * (W * z - x);
    end
    x_history = [x_history x]; % append the new states to the history
end
disp(x)

% plot the state history for each node
figure(1);
for i = 1:N
    plot(1:num_iter+1, x_history(i,:));
    hold on;
end

title('State updates for each node over time');
xlabel('Time step');
ylabel('State');
legend('Node 1', 'Node 2', 'Node 3', 'Node 4');
