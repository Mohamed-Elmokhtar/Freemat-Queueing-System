function printKiosk(patients, numOfPatients)
    kioskPatientsNo = zeros(1,3);
    printf('------------------------------------------------------------------------------------\n');
    printf('|No. | Patient Arrival Time | Service Begin Time | Service Time | Service End Time |\n');
    printf('------------------------------------------------------------------------------------\n');
    for (i=1:numOfPatients)
        if (patients(1,i).KioskNo == 1)
            kioskPatientsNo(1,1) = kioskPatientsNo(1,1) + 1;
            printf('|%4d|%22d|%20d|%14d|%18d|\n',i,patients(1,i).Arrival,patients(1,i).ServiceBegin,patients(1,i).Service,patients(1,i).ServiceEnd);
        end
    end
    printf('------------------------------------------------------------------------------------\n');
    printf('Total Patients Serviced By Kiosk 1: %d Patients\n',kioskPatientsNo(1,1));
    
    printf('------------------------------------------------------------------------------------\n');
    printf('|No. | Patient Arrival Time | Service Begin Time | Service Time | Service End Time |\n');
    printf('------------------------------------------------------------------------------------\n');
    for (i=1:numOfPatients)
        if (patients(1,i).KioskNo == 2)
            kioskPatientsNo(1,2) = kioskPatientsNo(1,2) + 1;
            printf('|%4d|%22d|%20d|%14d|%18d|\n',i,patients(1,i).Arrival,patients(1,i).ServiceBegin,patients(1,i).Service,patients(1,i).ServiceEnd);
        end
    end
    printf('------------------------------------------------------------------------------------\n');
    printf('Total Patients Serviced By Kiosk 2: %d Patients\n',kioskPatientsNo(1,2));
    
    printf('------------------------------------------------------------------------------------\n');
    printf('|No. | Patient Arrival Time | Service Begin Time | Service Time | Service End Time |\n');
    printf('------------------------------------------------------------------------------------\n');
    for (i=1:numOfPatients)
        if (patients(1,i).KioskNo == 3)
            kioskPatientsNo(1,3) = kioskPatientsNo(1,3) + 1;
            printf('|%4d|%22d|%20d|%14d|%18d|\n',i,patients(1,i).Arrival,patients(1,i).ServiceBegin,patients(1,i).Service,patients(1,i).ServiceEnd);
        end
    end
    printf('------------------------------------------------------------------------------------\n');
    printf('Total Patients Serviced By Kiosk 3: %d Patients\n',kioskPatientsNo(1,3));