function interArrivalTime = randomInterArrival(randomNumber);
    if (randomNumber < 11)
       interArrivalTime = 2;
    elseif (randomNumber < 21)
        interArrivalTime = 3;
    elseif (randomNumber < 31)
        interArrivalTime = 1;
    elseif (randomNumber < 41)
        interArrivalTime = 5;
    elseif (randomNumber < 51)
        interArrivalTime = 10;
    elseif (randomNumber < 61)
        interArrivalTime = 15;
    elseif (randomNumber < 71)
        interArrivalTime = 7;
    elseif (randomNumber < 81)
        interArrivalTime = 4;
    elseif (randomNumber < 91)
        interArrivalTime = 6;
    else
        interArrivalTime = 11;
    end