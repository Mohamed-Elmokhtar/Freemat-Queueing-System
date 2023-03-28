function IdleKiosk(&patients, numOfPatients)
    kiosks = struct('PatientNo', cell(3, numOfPatients),'PatientArrival', cell(3, numOfPatients),'ServiceBegin', cell(3, numOfPatients),'ServiceEnd', cell(3, numOfPatients));
    kioskStatus = zeros(1,2);
    clock = 0;
    endTimeAtKiosk = zeros(1,3);
    for (i=1:numOfPatients)
        patientAssigned = 'false';
        while (strcmp(patientAssigned,'false'))
            if (patients(1,i).Age >= 60 & clock >= patients(1,i).Arrival)
                patients(1,i).KioskNo = 3;
                patientAssigned = 'true';
                kiosks(3,i).PatientNo = i;
                kiosks(3,i).PatientArrival = patients(1,i).Arrival;
                if (endTimeAtKiosk(1,3) == 0)
                    kiosks(3,i).ServiceBegin = patients(1,i).Arrival;
                else
                    kiosks(3,i).ServiceBegin = endTimeAtKiosk(1,3);
                end
                patients(1,i).ServiceBegin = kiosks(3,i).ServiceBegin;
                kiosks(3,i).ServiceEnd = kiosks(3,i).ServiceBegin + patients(1,i).Service;
                patients(1,i).ServiceEnd = kiosks(3,i).ServiceEnd;
                patients(1,i).Waiting = patients(1,i).ServiceBegin - patients(1,i).Arrival;
                patients(1,i).TotalTime = patients(1,i).Waiting + patients(1,i).Service;
                endTimeAtKiosk(1,3) = kiosks(3,i).ServiceEnd;
            else
                if(kioskStatus(1,1) == 0 & kioskStatus(1,2) == 0 & clock >= patients(1,i).Arrival)
                    patients(1,i).KioskNo = 1;
                    kioskStatus(1,1) = 1;
                    patientAssigned = 'true';
                    kiosks(1,i).PatientNo = i;
                    kiosks(1,i).PatientArrival = patients(1,i).Arrival;
                    if (endTimeAtKiosk(1,1) == 0)
                        kiosks(1,i).ServiceBegin = patients(1,i).Arrival;
                    else
                        kiosks(1,i).ServiceBegin = endTimeAtKiosk(1,1);
                    end
                    patients(1,i).ServiceBegin = kiosks(1,i).ServiceBegin;
                    kiosks(1,i).ServiceEnd = kiosks(1,i).ServiceBegin + patients(1,i).Service;
                    patients(1,i).ServiceEnd = kiosks(1,i).ServiceEnd;
                    patients(1,i).Waiting = patients(1,i).ServiceBegin - patients(1,i).Arrival;
                    patients(1,i).TotalTime = patients(1,i).Waiting + patients(1,i).Service;
                    endTimeAtKiosk(1,1) = kiosks(1,i).ServiceEnd;
                
                elseif(kioskStatus(1,1) == 0 & clock >= patients(1,i).Arrival)
                    patients(1,i).KioskNo = 1;
                    kioskStatus(1,1) = 1;
                    patientAssigned = 'true';
                    kiosks(1,i).PatientNo = i;
                    kiosks(1,i).PatientArrival = patients(1,i).Arrival;
                    if (endTimeAtKiosk(1,1) == 0)
                        kiosks(1,i).ServiceBegin = patients(1,i).Arrival;
                    else
                        kiosks(1,i).ServiceBegin = endTimeAtKiosk(1,1);
                    end
                    patients(1,i).ServiceBegin = kiosks(1,i).ServiceBegin;
                    kiosks(1,i).ServiceEnd = kiosks(1,i).ServiceBegin + patients(1,i).Service;
                    patients(1,i).ServiceEnd = kiosks(1,i).ServiceEnd;
                    patients(1,i).Waiting = patients(1,i).ServiceBegin - patients(1,i).Arrival;
                    patients(1,i).TotalTime = patients(1,i).Waiting + patients(1,i).Service;
                    endTimeAtKiosk(1,1) = kiosks(1,i).ServiceEnd;
           
                elseif(kioskStatus(1,2) == 0 & clock >= patients(1,i).Arrival)
                    patients(1,i).KioskNo = 2;
                    kioskStatus(1,2) = 1;
                    patientAssigned = 'true';
                    kiosks(2,i).PatientNo = i;
                    kiosks(2,i).PatientArrival = patients(1,i).Arrival;
                    if (endTimeAtKiosk(1,2) == 0)
                        kiosks(2,i).ServiceBegin = patients(1,i).Arrival;
                    else
                        kiosks(2,i).ServiceBegin = endTimeAtKiosk(1,2);
                    end
                    patients(1,i).ServiceBegin = kiosks(2,i).ServiceBegin;
                    kiosks(2,i).ServiceEnd = kiosks(2,i).ServiceBegin + patients(1,i).Service;
                    patients(1,i).ServiceEnd = kiosks(2,i).ServiceEnd;
                    patients(1,i).Waiting = patients(1,i).ServiceBegin - patients(1,i).Arrival;
                    patients(1,i).TotalTime = patients(1,i).Waiting + patients(1,i).Service;
                    endTimeAtKiosk(1,2) = kiosks(2,i).ServiceEnd;
                end 
            end
            clock = clock + 1;
            if (clock == endTimeAtKiosk(1,1))
                kioskStatus(1,1) = 0;
            end
            if (clock == endTimeAtKiosk(1,2))
                kioskStatus(1,2) = 0;
            end
        end
    end
    printArrivalandDeparture(patients, numOfPatients);
    printKiosk(patients, numOfPatients);