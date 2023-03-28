function sequential(&patients, numOfPatients)
    lastKiosk = 0;
    for (i=1:numOfPatients)
        if (patients(i).Age >= 60)
            patients(i).KioskNo = 3;
        elseif (lastKiosk ~= 1)
            patients(i).KioskNo = 1;
            lastKiosk = 1;
        else
            patients(i).KioskNo = 2;
            lastKiosk = 2;
        end
    end