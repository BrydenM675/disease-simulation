%HPV.m
%Author Bryden Mollenauer
%Desciption This is a simulation of HPV

clear all  %erases the memory
close all

%Variable and parameters
days = 365;
dt = 0.01; %1 hundreth of a day
total_steps = floor(days/dt);
S(1) = 100; %starting pop
I(1) = 1; %starting infected pop
V(1) = 0;
b = 5/365; %assume five babies born per year
r = 0; % takes a week to recover
dS = 1/(80 * 365); %average death age is 80
dI = dS + 0.001 *dS; %one percent increase in death
alpha = 0.0002; %guess at infection rate
v = 0.0015;



%Simulation
for i = 1:total_steps
    S(i+1) = S(i) + dt * (b + r * I(i) - dS * S(i) - alpha * S(i) * I(i) - v * S(i));
    I(i+1) = I(i) + dt * (alpha * S(i) * I(i) - dI * I(i) - r * I(i));
    V(i+1) = V(i) + dt * (v * S(i) - dS * V(i));
end

 
%plot the results 
figure(1)
plot(S, 'b') %plots S in blue
hold
plot(I, 'r') %plots I in red
plot(V, 'g')
title('The spread of Human Papillomavirus')
xlabel('Time steps')
ylabel('Populations')
legend('Susceptible', 'Infected', 'Vacinated')
