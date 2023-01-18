clear all
close all
clc
%% Parâmetros
% Condições de contorno
T1  = 273;
T2  = 100+273; 
 
%VC's nas direções x e y
nx = 100; 
ny = 100; 
row = ny; col = nx;

% Dimensões
W   = 0.5; 
L   = 0.5;
dx = L/nx;
dy = W/ny;

%% Solução Analítica
T = zeros(row,col);

x_cont = col; 
y_cont = row; 

for x = (dx/2:dx:L-dx/2) 
    for y = (dy/2:dy:W-dy/2)
        Sum = 0;
        for n = 1:100
            Sum = Sum + ( (-1)^(n+1) + 1 ) / n * sin(n*pi*x/L) * sinh(n*pi*y/L) / sinh(n*pi*W/L);
        end

        T(x_cont, y_cont) = 2*Sum/pi * (T2-T1) + T1;
        y_cont = y_cont-1;
    end
y_cont = row;
x_cont = x_cont -1;
end

% Plot
Temp_fig = figure('Units','normalized');
imagesc(reshape(T',row,col));
colorbar;
axis ij;
title('Solução analítica');
xlabel('x [m]');
ylabel('y [m]');
