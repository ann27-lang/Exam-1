function Prob1logic(IPTG,RNAP,steps)

mRNA = zeros(1,steps+1);

%Initial time step begins at 0
t = 0;
timesteps = linspace(0,steps,steps+1);

%Boolean logic simulation of network
while t <= steps-1
    if IPTG(t+1) == 1 && RNAP(t+1) == 1
        mRNA(t+2) = 1;
    else
        mRNA(t+2) = 0;
    end
    t = t + 1;
end

figure
hold on
plot(timesteps,mRNA)
title('Time steps v mRNA DOM')
xlabel('Time steps')
ylabel('DOM')
end