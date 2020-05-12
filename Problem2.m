%% Problem 2
clear all;
close all; warning('off','all')
%part c

%Initial conditions
x0(1) = 0;  %X
x0(2) = 0;  %Z

S = linspace(0,10,1000);
tspan = [0 60];

for i =1:length(S)
    [tspan_out,x0_out] = ode45(@(tspan,x0) myODE(tspan,x0,S(i)),tspan,x0);
    
    Xss(i) = x0_out(length(x0_out),1);
end

figure
hold on
plot(S,Xss)
xlabel('S concentration','FontName','Arial','FontSize',12);
ylabel('X Gene Expression','FontName','Arial','FontSize',12);  
hold off


%% part d

%Initial conditions
x0(1) = 0;  %X
x0(2) = 0;  %Y
x0(3) = 0;  %Z

S = [0.02 10 1e5];
tspan = [0 60];

%Use ODE45 solver
for i = 1:length(S)
    [tspan_out,x0_out] = ode45(@(tspan,x0) myODEd(tspan,x0,S(i)),tspan,x0);

    figure
    hold on
    plot(tspan_out,x0_out(:,1))
    xlabel('time','FontName','Arial','FontSize',12);
    ylabel('X Gene Expression','FontName','Arial','FontSize',12);  
    title(["For S =" S(i)])
    hold off

end

%% part e
%Hopf
SH = 0.4;
tspan = [0 1000];

[tspan_out,x0_out] = ode45(@(tspan,x0) myODEd(tspan,x0,SH),tspan,x0);

figure
subplot(1,3,1)
hold on
plot(tspan_out,x0_out(:,1))
xlabel('time','FontName','Arial','FontSize',12);
ylabel('X Gene Expression','FontName','Arial','FontSize',12);  
title(["For S =" SH])
subplot(1,3,2)
hold on
plot(tspan_out,x0_out(:,2))
xlabel('time','FontName','Arial','FontSize',12);
ylabel('Y Gene Expression','FontName','Arial','FontSize',12);  
title(["For S =" SH])
subplot(1,3,3)
hold on
plot(tspan_out,x0_out(:,3))
xlabel('time','FontName','Arial','FontSize',12);
ylabel('Z Gene Expression','FontName','Arial','FontSize',12);  
title(["For S =" SH])
hold off

% cells
%Initial conditions
x0(1) = 0;  %X
x0(2) = 0;  %Y
x0(3) = 0;  %Z

cell = [1 2 3];
figure
for k = 1:length(cell)
    [tspan_out,x0_out] = ode45(@(tspan,x0) myODEdcell(tspan,x0,SH,cell(k)),tspan,x0);

    if cell(k) == 2
        x0_out = x0_out+(0.25.*x0_out);
    elseif cell(k) == 3
        x0_out = x0_out-(0.25.*x0_out);
    end

    subplot(1,3,k)
    hold on
    plot(tspan_out,x0_out(:,3))
    xlabel('time','FontName','Arial','FontSize',12);
    ylabel('Z Gene Expression','FontName','Arial','FontSize',12);  
    title(["For cell" cell(k)])
end

hold off

%% Saddle

SH = 7744;
tspan = [0 1000];

[tspan_out,x0_out] = ode45(@(tspan,x0) myODEd(tspan,x0,SH),tspan,x0);

figure
subplot(1,3,1)
hold on
plot(tspan_out,x0_out(:,1))
xlabel('time','FontName','Arial','FontSize',12);
ylabel('X Gene Expression','FontName','Arial','FontSize',12);  
title(["For S =" SH])
subplot(1,3,2)
hold on
plot(tspan_out,x0_out(:,2))
xlabel('time','FontName','Arial','FontSize',12);
ylabel('Y Gene Expression','FontName','Arial','FontSize',12);  
title(["For S =" SH])
subplot(1,3,3)
hold on
plot(tspan_out,x0_out(:,3))
xlabel('time','FontName','Arial','FontSize',12);
ylabel('Z Gene Expression','FontName','Arial','FontSize',12);  
title(["For S =" SH])
hold off

% cells

cell = [1 2 3];
figure
for k = 1:length(cell)
    [tspan_out,x0_out] = ode45(@(tspan,x0) myODEdcell(tspan,x0,SH,cell(k)),tspan,x0);

    if cell(k) == 2
        x0_out = x0_out+(0.25.*x0_out);
    elseif cell(k) == 3
        x0_out = x0_out-(0.25.*x0_out);
    end

    subplot(1,3,k)
    hold on
    plot(tspan_out,x0_out(:,3))
    xlabel('time','FontName','Arial','FontSize',12);
    ylabel('Z Gene Expression','FontName','Arial','FontSize',12);  
    title(["For cell" cell(k)])
end

hold off

