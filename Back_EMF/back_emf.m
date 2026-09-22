% Define the specific RPM 
rpmValues = [1000, 2000, 3000, 4000, 5000, 6000]; 
numFiles = length(rpmValues);

% Preallocate a cell array to store the structure returned by tdmsread
tdmsData = cell(1, numFiles); 

for k = 1:numFiles
    % Construct filename using string interpolation or sprintf
    fileName = sprintf('open-circuit-test-%d-RPM.tdms', rpmValues(k));
    
    % Check if the file exists before reading to avoid crashing the loop
    if isfile(fileName)
        tdmsData{k} = tdmsread(fileName); % Stores file data as a timetable or struct
    else
        warning('File %s not found. Skipping.', fileName);
    end
end

for n = 1:numFiles
    phase_data= tdmsData{1,n}{1,2}; % returns table
    phase1_voltage{n} = phase_data.("Phase 1 Voltage ");

end 