function patients = Patient(randomInterArrivalTime, randomServiceTime, numOfPatients, randomAge)
    arrival = 0;
    patients = struct('Age', cell(1,numOfPatients), 'InterArrival', cell(1,numOfPatients), 'Arrival', cell(1,numOfPatients), 'Service', cell(1,numOfPatients), 'ServiceBegin', cell(1,numOfPatients), 'ServiceEnd', cell(1,numOfPatients), 'Waiting', cell(1,numOfPatients), 'TotalTime', cell(1,numOfPatients), 'KioskNo', cell(1,numOfPatients));
    for (i=1:numOfPatients)
        patients(1,i).Age = randomAge(i);
        patients(1,i).InterArrival = randomInterArrival(randomInterArrivalTime(i));
        patients(1,i).Arrival = arrival;
        patients(1,i).Service = randomService(randomServiceTime(i));
        
        if (i < numOfPatients)
            arrival = arrival + randomInterArrival(randomInterArrivalTime(i+1));
        end
        
    end
        