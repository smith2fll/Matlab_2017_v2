function status = make_Vision_Calibration_h_file_v002(Calib)

%const ProfileData AutonomousMove_S1Red_to Boiler_Red {{

author = 'Jacob Krucinski';
time = datestr(now, 'HH:MM');
date_today =  date;

fh = fopen('Vision_Calibration.h','w');
formatSpec_title  = ['// THIS IS AUTOGENERATED CODE FOR VISION TARGETS WRITTEN IN MATLAB' '\n']; 
formatSpec_header = ['// This file was auto-generated by Matlab under the supervision of ' author ' on ' date_today ' at ' time '\n'];
fprintf(fh, formatSpec_title);
fprintf(fh, formatSpec_header);

names = fieldnames(Calib);
for i = 1:length(names)
    formatSpec = [ '#define ' names{i} ' %12.4f\n' ];
    fprintf(fh,formatSpec, eval([ 'Calib.' names{i} ]));
end

fclose(fh);

status = 1;

