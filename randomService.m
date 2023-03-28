function serviceTime = randomService(randomNumber);
    if (randomNumber < 11)
       serviceTime = 10;
    elseif (randomNumber < 18)
        serviceTime = 20;
    elseif (randomNumber < 21)
        serviceTime = 30;
    elseif (randomNumber < 41)
        serviceTime = 40;
    elseif (randomNumber < 53)
        serviceTime = 50;
    elseif (randomNumber < 61)
        serviceTime = 60;
    elseif (randomNumber < 63)
        serviceTime = 70;
    elseif (randomNumber < 71)
        serviceTime = 80;
    elseif (randomNumber < 91)
        serviceTime = 90;
    else
        serviceTime = 100;
    end
    