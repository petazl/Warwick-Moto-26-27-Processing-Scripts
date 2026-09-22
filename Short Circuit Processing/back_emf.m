% Define the specific RPM
rpmValues = [1000, 2000, 3000, 4000, 5000, 6000];
numFiles = length(rpmValues);

% motor information
poles = 5;

% Preallocate a cell array to store the structure returned by tdmsread
tdmsData = cell(1, numFiles);

for k = 1:numFiles
    % Construct filename using string interpolation or sprintf
    fileName = sprintf('open-circuit-test-%d-RPM.tdms', rpmValues(k));

    % Check if the file exists before reading to avoid crashing the loop
    if isfile(fileName)
        tdmsData{k} = tdmsread(fileName); % Stores data as cell array
    else
        warning('File %s not found. Skipping.', fileName);
    end
end
%% 1000 RPM 
phase_data_1000RPM= tdmsData{1,1}{1,2}; % returns table
phase1_voltage_1000 = phase_data_1000RPM.("Phase 1 Voltage ");

%% 2000 RPM
phase_data_1000RPM= tdmsData{1,1}{1,2}; % returns table
phase1_voltage_1000 = phase_data_1000RPM.("Phase 1 Voltage ");

%% 3000 RPM
phase_data_1000RPM= tdmsData{1,1}{1,2}; % returns table
phase1_voltage_1000 = phase_data_1000RPM.("Phase 1 Voltage ");


phase_data_6000RPM= tdmsData{1,6}{1,2}; % returns table
phase1_voltage_6000 = phase_data_6000RPM.("Phase 1 Voltage ");

[pks, locs] = findpeaks(phase1_voltage_6000, 'MinPeakHeight', 0);

% Calculate the average of those peak values
V_rms_6000 = mean(pks)/sqrt(2);

% Optional: Plot the results to verify
% plot(phase1_voltage_6000);
% hold on;
% plot(locs, pks, 'or'); % Mark peaks with red circles
% yline(avg_peak_value, '--g', 'Avg Peak Value', 'LineWidth', 2);
% hold off;

