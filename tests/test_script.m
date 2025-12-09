% Test script of the Earth's Magnetic Field Model

clearvars 
clc
format long

% Load the WMM.cof coefficients of 2025 and secular variations
addpath('../data/')
addpath('../src/')
load Gauss_coefficients_2020.mat

% Magnetic field computation example

% Test values
latitude_deg = 40;
longitude_deg = 60;
height_m = 500000;
year = 2020;

% Maximum degree of Spherical Harmonic aproximation
N = 12;

% Computation
[~, F] = magnetic_field(height_m, latitude_deg, longitude_deg, year, C_nm, N);
[~,~,~,~, F_IGRF] = igrfmagm(height_m, latitude_deg, longitude_deg, year);
Rel_error = 100*(F_IGRF-F)/F_IGRF;

fprintf("The magnitude of the magnetic field is %f nT.\nIt's relative error compared with IGRF is %f %%.\n", F, Rel_error);
