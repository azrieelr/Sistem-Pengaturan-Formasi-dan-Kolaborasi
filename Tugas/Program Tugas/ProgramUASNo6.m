clc; clear; clf

% positions of the 7 agents
pos = [3 2; 5 3; 6 4; 5 9; 6 8; 7 2; 1 8];

% check if pos is a 7x2 matrix
if size(pos, 1) ~= 7 || size(pos, 2) ~= 2
    error('Input should be a 7x2 matrix where each row is an (x, y) coordinate of an agent.');
end

% Voronoi Diagram
figure(1);
voronoi(pos(:,1), pos(:,2));
title('Voronoi Diagram');

% Proximity Graph
figure(2);
DT = delaunayTriangulation(pos(:,1), pos(:,2));
triplot(DT);
title('Proximity Graph');
