function printPatients(patients, numOfPatients)
    printf('--------------------------------------------------------------------------------------------------------------------------\n');
    printf('|No. | Age | Arrival Time | Kiosk No. | Service Time | Service Begin Time | Service End Time | Waiting Time | Total Time |\n');
    printf('--------------------------------------------------------------------------------------------------------------------------\n');
    for (i=1:numOfPatients)
        printf('|%4d|%5d|%14d|%11d|%14d|%20d|%18d|%14d|%12d|\n',i,patients(1,i).Age,patients(1,i).Arrival,patients(1,i).KioskNo,patients(1,i).Service,patients(1,i).ServiceBegin,patients(1,i).ServiceEnd,patients(1,i).Waiting,patients(1,i).TotalTime);
    end
    printf('--------------------------------------------------------------------------------------------------------------------------\n');
    statistics(patients, numOfPatients);