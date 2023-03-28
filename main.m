printf('\n----------------------------------------\n');
printf('| Welcome To Hospital Kiosk Simulation |\n');
printf('----------------------------------------\n\n');
n = input('Enter number of patients: ');
while true
    fprintf('Choose type of random number generator:\n');
    fprintf('1 - Linear Congruential Generator (LCG)\n');
    fprintf('2 - Random Variate Generator for Uniform Distribution\n');
    type = input('Choice: ');
    if (type == 1)
        fprintf('LCG: Xn = ((a*Xn-1)+c) mod m\n');
        x = input('Enter seed value X0: ');
        randomServiceTime = LCG(n,x);
        randomInterArrivalTime = LCG(n,x);
        break;
    elseif (type == 2)
        fprintf('Random Variate Generate for Uniform Distribution:\nXn = a+(b-a)*Rn\n');
        a = input('Enter a: ');
        b = input('Enter b: ');
        randomServiceTime = RVG(n,a,b);
        randomInterArrivalTime = RVG(n,a,b);
        break;
    else
        fprintf('Choose between 1 and 2 only\n');
    end
end

while true
    fprintf('Choose rule for waiting line:\n');
    fprintf('1 - Patients go to kiosks in sequential manner (i.e patient 1 got to kios 1, patient 2 go to kiosk 2 and so on)\n');
    fprintf('2 - Patients go to idle kiosk, and if all kiosks idle go to kiosk 1\n');
    lineRule = input('Choice: ');
    if (lineRule == 1 | lineRule == 2)
        break;
    else
        fprintf('Choose between 1 and 2 only\n');
    end
end

serviceTime =[10,20,30,40,50,60,70,80,90,100;
0.1f,0.07f,0.03f,0.2f,0.12f,0.08f,0.02f,0.08f,0.2f,0.1f;
0.1f,0.17f,0.2f,0.4f,0.52f,0.6f,0.62f,0.7f,0.9f,1.0f;
1,11,18,21,41,53,61,63,71,91;
10,17,20,40,52,60,62,70,90,100];

interArrivalTime =[2,3,1,5,10,15,7,4,6,11;
0.1f,0.1f,0.1f,0.1f,0.1f,0.1f,0.1f,0.1f,0.1f,0.1f;
0.1f,0.2f,0.3f,0.4f,0.5f,0.6f,0.7f,0.8f,0.9f,1.0f;
1,11,21,31,41,51,61,71,81,91;
10,20,30,40,50,60,70,80,90,100];

for (i=1:n)
    randomAge(i) = ceil(rand()*100);
end

p = Patient(randomInterArrivalTime, randomServiceTime, n, randomAge);

if (lineRule == 1)
    SequentialKiosk(p, n);    
elseif (lineRule == 2)
    IdleKiosk(p, n);
end

printPatients(p, n);