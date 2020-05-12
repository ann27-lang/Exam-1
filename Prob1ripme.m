%Problem 1
%I did this thinking this could help me somehow.
input = [0 1 1 1 1 1 1];
RNAP = [1 1 1 1 1 1 1];

for i = 1:length(input)
    if input(i) == 0
        IPTG = zeros(1,20);
    else
        IPTG = ones(1,20);
    end
    if RNAP(i) == 0
        pol = zeros(1,20);
    else
        pol = ones(1,20);
    end
        Prob1logic(IPTG,pol,20)
end

icannolonger = [0 1.67 16.67 40 176.67 720 3333];
dothis = [2.04E+05 2.25E+05 4.39E+05 7.18E+05 9.21E+05 9.96E+05 9.96E+05];

figure
semilogx(icannolonger, dothis)
xlabel("IPTG")
ylabel("<n>/B")



