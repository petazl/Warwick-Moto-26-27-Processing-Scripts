% Short circuit current and d-axis inductance parameter data acquisition     

clear;
clc;
close all;

% Load TDMS data

filename = "short-circuit-test.tdms";

data = tdmsread(filename);

disp(data);

% Read mean RMS current from phase 2

tbl = data{1};

current = tbl.EV_Phase2_RMS_Current;

figure;
plot(current);

xlabel("Index");
ylabel("RMS Current (A)");
title("Short Circuit Test - Phase 2 RMS Current");
grid on;









