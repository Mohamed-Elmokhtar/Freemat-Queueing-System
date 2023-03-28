function printArrivalandDeparture(patients, numOfPatients)
    for (clock=0:patients(1,numOfPatients).ServiceEnd)
        for (i=1:numOfPatients)
            if (patients(1,i).Arrival == clock)
                printf('Patient %d arrives at minute %d, and gets service at minute %d at kiosk %d\n',i,patients(1,i).Arrival,patients(1,i).ServiceBegin,patients(1,i).KioskNo);
            end
            if (patients(1,i).ServiceEnd == clock)
                printf('Patient %d departs at minute %d, from kiosk %d\n',i,patients(1,i).ServiceEnd,patients(1,i).KioskNo);
            end
        end
    end