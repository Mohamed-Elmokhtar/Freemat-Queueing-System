function statistics(patients, numOfPatients)
    
    noOfKioskOnePatients = 1;
    noOfKioskTwoPatients = 1;
    noOfKioskThreePatients = 1;
    
    kioskOnePatients = struct('Age',cell(1,numOfPatients),'Service',cell(1,numOfPatients),'ServiceBegin',cell(1,numOfPatients),'ServiceEnd',cell(1,numOfPatients),'Waiting',cell(1,numOfPatients),'TotalTime',cell(1,numOfPatients));
    kioskTwoPatients = struct('Age',cell(1,numOfPatients),'Service',cell(1,numOfPatients),'ServiceBegin',cell(1,numOfPatients),'ServiceEnd',cell(1,numOfPatients),'Waiting',cell(1,numOfPatients),'TotalTime',cell(1,numOfPatients));
    kioskThreePatients = struct('Age',cell(1,numOfPatients),'Service',cell(1,numOfPatients),'ServiceBegin',cell(1,numOfPatients),'ServiceEnd',cell(1,numOfPatients),'Waiting',cell(1,numOfPatients),'TotalTime',cell(1,numOfPatients));

    for (i=1:numOfPatients)
        if (patients(1,i).KioskNo == 1)
            kioskOnePatients(1,noOfKioskOnePatients).Age = patients(1,i).Age;
            kioskOnePatients(1,noOfKioskOnePatients).Service = patients(1,i).Service;
            kioskOnePatients(1,noOfKioskOnePatients).ServiceBegin = patients(1,i).ServiceBegin;
            kioskOnePatients(1,noOfKioskOnePatients).ServiceEnd = patients(1,i).ServiceEnd;
            kioskOnePatients(1,noOfKioskOnePatients).Waiting = patients(1,i).Waiting;
            kioskOnePatients(1,noOfKioskOnePatients).TotalTime = patients(1,i).TotalTime;
            noOfKioskOnePatients = noOfKioskOnePatients + 1;
        elseif (patients(1,i).KioskNo == 2)
            kioskTwoPatients(1,noOfKioskTwoPatients).Age = patients(1,i).Age;
            kioskTwoPatients(1,noOfKioskTwoPatients).Service = patients(1,i).Service;
            kioskTwoPatients(1,noOfKioskTwoPatients).ServiceBegin = patients(1,i).ServiceBegin;
            kioskTwoPatients(1,noOfKioskTwoPatients).ServiceEnd = patients(1,i).ServiceEnd;
            kioskTwoPatients(1,noOfKioskTwoPatients).Waiting = patients(1,i).Waiting;
            kioskTwoPatients(1,noOfKioskTwoPatients).TotalTime = patients(1,i).TotalTime;
            noOfKioskTwoPatients = noOfKioskTwoPatients + 1;
        else
            kioskThreePatients(1,noOfKioskThreePatients).Age = patients(1,i).Age;
            kioskThreePatients(1,noOfKioskThreePatients).Service = patients(1,i).Service;
            kioskThreePatients(1,noOfKioskThreePatients).ServiceBegin = patients(1,i).ServiceBegin;
            kioskThreePatients(1,noOfKioskThreePatients).ServiceEnd = patients(1,i).ServiceEnd;
            kioskThreePatients(1,noOfKioskThreePatients).Waiting = patients(1,i).Waiting;
            kioskThreePatients(1,noOfKioskThreePatients).TotalTime = patients(1,i).TotalTime;
            noOfKioskThreePatients = noOfKioskThreePatients + 1;
        end
    end
    
    numOfPatientsWaited = zeros(1,3);
    numOfPatientsInstantlyServiced = zeros(1,3);
    totalWaitingTimeOfKiosk = zeros(1,3);
    totalRestTimeOfKiosk = zeros(1,3);
    totalTimeInKiosk = zeros(1,3);
    totalTimeKioskBusy = zeros(1,3);
    averageWaitingTime = zeros(1,3);
    averageTimeInKiosk = zeros(1,3);
    waitingProbability = zeros(1,3);
    instantServiceProbability = zeros(1,3);
    averageAge = zeros(1,3);
    totalAge = zeros(1,3);
    
    for (i=1:noOfKioskOnePatients-1)
        if (kioskOnePatients(1,i).Waiting ~= 0)
            numOfPatientsWaited(1,1) = numOfPatientsWaited(1,1) + 1;
            totalWaitingTimeOfKiosk(1,1) = totalWaitingTimeOfKiosk(1,1) + kioskOnePatients(1,i).Waiting;
        else
            numOfPatientsInstantlyServiced(1,1) = numOfPatientsInstantlyServiced(1,1) + 1;
        end
        if (i ~= 1)
            totalRestTimeOfKiosk(1,1) = totalRestTimeOfKiosk(1,1) + (kioskOnePatients(1,i).ServiceBegin - kioskOnePatients(1,i-1).ServiceEnd);
        else
            totalRestTimeOfKiosk(1,1) = totalRestTimeOfKiosk(1,1) + (kioskOnePatients(1,i).ServiceBegin - 0);
        end
        totalTimeInKiosk(1,1) = totalTimeInKiosk(1,1) + kioskOnePatients(1,i).TotalTime;
        totalAge(1,1) = totalAge(1,1) + kioskOnePatients(1,i).Age;
    end 
        
    for (i=1:noOfKioskTwoPatients-1)
        if (kioskTwoPatients(1,i).Waiting ~= 0)
            numOfPatientsWaited(1,2) = numOfPatientsWaited(1,2) + 1;
            totalWaitingTimeOfKiosk(1,2) = totalWaitingTimeOfKiosk(1,2) + kioskTwoPatients(1,i).Waiting;
        else
            numOfPatientsInstantlyServiced(1,2) = numOfPatientsInstantlyServiced(1,2) + 1;
        end
        if (i ~= 1)
            totalRestTimeOfKiosk(1,2) =  totalRestTimeOfKiosk(1,2) + (kioskTwoPatients(1,i).ServiceBegin - kioskTwoPatients(1,i-1).ServiceEnd);
        else
            totalRestTimeOfKiosk(1,2) =  totalRestTimeOfKiosk(1,2) + (kioskTwoPatients(1,i).ServiceBegin - 0);
        end
        totalTimeInKiosk(1,2) = totalTimeInKiosk(1,2) + kioskTwoPatients(1,i).TotalTime;
        totalAge(1,2) = totalAge(1,2) + kioskTwoPatients(1,i).Age;
    end
        
    for (i=1:noOfKioskThreePatients-1)
        if (kioskThreePatients(1,i).Waiting ~= 0)
            numOfPatientsWaited(1,3) = numOfPatientsWaited(1,3) + 1;
            totalWaitingTimeOfKiosk(1,3) = totalWaitingTimeOfKiosk(1,3) + kioskThreePatients(1,i).Waiting;
        else
            numOfPatientsInstantlyServiced(1,3) = numOfPatientsInstantlyServiced(1,3) + 1;
        end
        if (i ~= 1)
            totalRestTimeOfKiosk(1,3) = totalRestTimeOfKiosk(1,3) + (kioskThreePatients(1,i).ServiceBegin - kioskThreePatients(1,i-1).ServiceEnd);
        else
            totalRestTimeOfKiosk(1,3) = totalRestTimeOfKiosk(1,3) + (kioskThreePatients(1,i).ServiceBegin - 0);
        end 
        totalTimeInKiosk(1,3) = totalTimeInKiosk(1,3) + kioskThreePatients(1,i).TotalTime;
        totalAge(1,3) = totalAge(1,3) + kioskThreePatients(1,i).Age;
    end
    
    averageWaitingTime(1,1) = totalWaitingTimeOfKiosk(1,1) ./ numOfPatientsWaited(1,1);
    averageWaitingTime(1,2) = totalWaitingTimeOfKiosk(1,2) ./ numOfPatientsWaited(1,2);
    averageWaitingTime(1,3) = totalWaitingTimeOfKiosk(1,3) ./ numOfPatientsWaited(1,3);
    
    averageTimeInKiosk(1,1) = totalTimeInKiosk(1,1) ./ (noOfKioskOnePatients-1);
    averageTimeInKiosk(1,2) = totalTimeInKiosk(1,2) ./ (noOfKioskTwoPatients-1);
    averageTimeInKiosk(1,3) = totalTimeInKiosk(1,3) ./ (noOfKioskThreePatients-1);
    
    averageAge(1,1) = totalAge(1,1) ./ (noOfKioskOnePatients-1);
    averageAge(1,2) = totalAge(1,2) ./ (noOfKioskTwoPatients-1);
    averageAge(1,3) = totalAge(1,3) ./ (noOfKioskThreePatients-1);
    
    waitingProbability(1,1) = numOfPatientsWaited(1,1) ./ (noOfKioskOnePatients-1);
    waitingProbability(1,2) = numOfPatientsWaited(1,2) ./ (noOfKioskTwoPatients-1);
    waitingProbability(1,3) = numOfPatientsWaited(1,3) ./ (noOfKioskThreePatients-1);
    
    instantServiceProbability(1,1) = numOfPatientsInstantlyServiced(1,1) ./ (noOfKioskOnePatients-1);
    instantServiceProbability(1,2) = numOfPatientsInstantlyServiced(1,2) ./ (noOfKioskTwoPatients-1);
    instantServiceProbability(1,3) = numOfPatientsInstantlyServiced(1,2) ./ (noOfKioskThreePatients-1);
    
    printf('Kiosk 1 Statistics:\n');
    printf('Number of patients waited at Kiosk 1: %d\n',numOfPatientsWaited(1,1));
    printf('Average waiting time at Kiosk 1: %4f\n',averageWaitingTime(1,1));
    printf('Probability a patient waits at Kiosk 1: %4f\n',waitingProbability(1,1));
    printf('Number of patients instantly serviced at Kiosk 1: %d\n',numOfPatientsInstantlyServiced(1,1));
    printf('Probability a patient instantly serviced at Kiosk 1: %4f\n',instantServiceProbability(1,1));
    printf('Total time Kiosk 1 operated: %d\n',totalTimeInKiosk(1,1));
    printf('Total time Kiosk 1 was at rest: %d\n',totalRestTimeOfKiosk(1,1));
    printf('Avergae age of Kiosk 1 patienst: %2f\n',averageAge(1,1));
    
    printf('Kiosk 2 Statistics:\n');
    printf('Number of patients waited at Kiosk 2: %d\n',numOfPatientsWaited(1,2));
    printf('Average waiting time at Kiosk 2: %4f\n',averageWaitingTime(1,2));
    printf('Probability a patient waits at Kiosk 2: %4f\n',waitingProbability(1,2));
    printf('Number of patients instantly serviced at Kiosk 2: %d\n',numOfPatientsInstantlyServiced(1,2));
    printf('Probability a patient instantly serviced at Kiosk 2: %4f\n',instantServiceProbability(1,2));
    printf('Total time Kiosk 2 operated: %d\n',totalTimeInKiosk(1,2));
    printf('Total time Kiosk 2 was at rest: %d\n',totalRestTimeOfKiosk(1,2));
    printf('Avergae age of Kiosk 2 patienst: %2f\n',averageAge(1,2));
    
    printf('Kiosk 3 Statistics:\n');
    printf('Number of patients waited at Kiosk 3: %d\n',numOfPatientsWaited(1,3));
    printf('Average waiting time at Kiosk 3: %4f\n',averageWaitingTime(1,3));
    printf('Probability a patient waits at Kiosk 3: %4f\n',waitingProbability(1,3));
    printf('Number of patients instantly serviced at Kiosk 3: %d\n',numOfPatientsInstantlyServiced(1,3));
    printf('Probability a patient instantly serviced at Kiosk 3: %4f\n',instantServiceProbability(1,3));
    printf('Total time Kiosk 3 operated: %d\n',totalTimeInKiosk(1,3));
    printf('Total time Kiosk 3 was at rest: %d\n',totalRestTimeOfKiosk(1,3));
    printf('Avergae age of Kiosk 3 patienst: %2f\n',averageAge(1,3));