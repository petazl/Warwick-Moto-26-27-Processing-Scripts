% D-axis inductance parameter characterisation 

clear;
clc;
close all;

% Load TDMS data

filename0 = "short-circuit-test.tdms";
filename1 = "open-circuit-test.tdms";

data = tdmsread(filename0);
data = tdmsread(filename1)

% Declare motor parameters

statorPhaseResistance = 0.0027;
poles = 5;
RPM = 2000;

% Electrical frequency calculation

elecFreq = (poles*RPM)/60

% =============================================================

% =============================================================

%% RPM threshold

lowerBound = 500;

%% Read data

tbl = data{1};

current = tbl.EV_Phase2_RMS_Current;
voltage = 
rpm = tbl.EV_Measured_Speed;

%% Find samples within RPM threshold

indices = find(rpm >= lowerBound);

%% Calculate mean RMS current

mean_RMS_current = mean(current(indices));
mean_RMS_voltage = mean(voltage(indices));



