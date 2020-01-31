% Start EEGLAB
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

% Update these fields with the correct paths to read and save to
source_datapath = '/home/your/set/files/to_convert/';
save_datapath = '/home/your/save_to/directory/';

% automated conversion of all files in the folder source_datapath

% Retrieve the name of the *.SET files only
files = dir(fullfile(source_datapath,'*.set'));

% Loop through each, swap extension to EDF and save as EDF
for id = 1:length(files)
   
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
    
    datafilename = sprintf('%s.set',f)
    datafile2save = sprintf('%s.edf',f)

    % Open EEGLAB file 
    EEG = pop_loadset('filename',datafilename,'filepath',source_datapath);

    % Writing the data as EDF
    pop_writeeeg(EEG, [save_datapath datafile2save], 'TYPE','EDF');

end


