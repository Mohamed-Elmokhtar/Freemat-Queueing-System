function kiosks = SequentialKiosk(&patients, numOfPatients);
    sequential(patients, numOfPatients);
    kiosks = struct('PatientNo', cell(3, numOfPatients),'PatientArrival', cell(3, numOfPatients),'ServiceBegin', cell(3, numOfPatients),'ServiceEnd', cell(3, numOfPatients));
    currentTime = zeros(1,3);
    for (i=1:numOfPatients)
        if (patients(1,i).KioskNo == 1)
            kiosks(1,i).PatientNo = i;
            if (currentTime(1,1) < patients(1,i).Arrival)
                currentTime(1,1) = patients(1,i).Arrival;
            end
            kiosks(1,i).PatientArrival = patients(1,i).Arrival;
            kiosks(1,i).ServiceBegin = currentTime(1,1);
            patients(1,i).ServiceBegin = kiosks(1,i).ServiceBegin;
            kiosks(1,i).ServiceEnd = kiosks(1,i).ServiceBegin + patients(1,i).Service;
            patients(1,i).ServiceEnd = kiosks(1,i).ServiceEnd;
            patients(1,i).Waiting = patients(1,i).ServiceBegin - patients(1,i).Arrival;
            patients(1,i).TotalTime = patients(1,i).Waiting + patients(1,i).Service;
            currentTime(1,1) = patients(1,i).ServiceEnd;        
        elseif (patients(1,i).KioskNo == 2)
            kiosks(2,i).PatientNo = i;
            if (currentTime(1,2) < patients(1,i).Arrival)
                currentTime(1,2) = patients(1,i).Arrival;
            end
            kiosks(2,i).PatientArrival = patients(1,i).Arrival;
            kiosks(2,i).ServiceBegin = currentTime(1,2);
            patients(1,i).ServiceBegin = kiosks(2,i).ServiceBegin;
            kiosks(2,i).ServiceEnd = kiosks(2,i).ServiceBegin + patients(1,i).Service;
            patients(1,i).ServiceEnd = kiosks(2,i).ServiceEnd;
            patients(1,i).Waiting = patients(1,i).ServiceBegin - patients(1,i).Arrival;
            patients(1,i).TotalTime = patients(1,i).Waiting + patients(1,i).Service;
            currentTime(1,2) = patients(1,i).ServiceEnd;
        elseif (patients(1,i).KioskNo == 3)
            kiosks(3,i).PatientNo = i;
            if (currentTime(1,3) < patients(1,i).Arrival)
                currentTime(1,3) = patients(1,i).Arrival;
            end
            kiosks(3,i).PatientArrival = patients(1,i).Arrival;
            kiosks(3,i).ServiceBegin = currentTime(1,3);
            patients(1,i).ServiceBegin = kiosks(3,i).ServiceBegin;
            kiosks(3,i).ServiceEnd = kiosks(3,i).ServiceBegin + patients(1,i).Service;
            patients(1,i).ServiceEnd = kiosks(3,i).ServiceEnd;
            patients(1,i).Waiting = patients(1,i).ServiceBegin - patients(1,i).Arrival;
            patients(1,i).TotalTime = patients(1,i).Waiting + patients(1,i).Service;
            currentTime(1,3) = patients(1,i).ServiceEnd;
        end
    end
    printArrivalandDeparture(patients, numOfPatients)
    printKiosk(patients, numOfPatients);
        