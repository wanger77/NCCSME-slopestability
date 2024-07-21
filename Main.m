clc
clear all
close all
%% import the data to neutrosophic spaces
file_name = 'Original sampling data.xlsx';
DATA = readmatrix(file_name); % H,angle,c,phi,gamma 50 rows for 1 group 
% calculate Neutrosophic weights of each data.
[H,Ag,C,Phi,Gamma] = mf2(DATA(:,1),DATA(:,2),DATA(:,3),DATA(:,4),DATA(:,5));
% sensitivity of  attributes  (calculated)
% 1	0.996269832639368	0.992034276904721	0.987167548147196	0.964232044760519
% for each weight in each data, there is a cubic set ([-, +],internel),
% which means the matrix number will be expaned into 9.
%% Confidence Cubic set
t_01 = 1.645;t_005 = 1.960;t_001 = 2.576; % confidence levels
groupNum = 212;
for grp = 1:groupNum
df = [H,Ag,C,Phi,Gamma];

T  = df((50*grp-49):50*grp,1:3:end);
for i = 1: 5
    for j = 1:5
    Matrix_T(j,(i*3-2):i*3) = CNNCS(t_005,T((j*10-9):j*10,i));
    end
end
% divide T into b,u,i
T_b = Matrix_T(:,1:3:end);T_u = Matrix_T(:,2:3:end);T_i = Matrix_T(:,3:3:end);
%% I membership
I = df((50*grp-49):50*grp,2:3:end);
for i = 1: 5
    for j = 1:5
    Matrix_I(j,(i*3-2):i*3) = CNNCS(t_005,I((j*10-9):j*10,i));
    end
end
I_b = Matrix_I(:,1:3:end);I_u = Matrix_I(:,2:3:end);I_i = Matrix_I(:,3:3:end);
%% F membership
F = df((50*grp-49):50*grp,3:3:end);
for i = 1: 5
    for j = 1:5
    Matrix_F(j,(i*3-2):i*3) = CNNCS(t_005,F((j*10-9):j*10,i));
    end
end
F_b = Matrix_F(:,1:3:end);F_u = Matrix_F(:,2:3:end);F_i = Matrix_F(:,3:3:end);
%% Matrix energy calculation and score
b = [ME(T_b),ME(T_u),ME(T_i); ME(I_b),ME(I_u),ME(I_i); ME(F_b),ME(F_u),ME(F_i)];
score(grp,:) = sum(b(1,:))/sum(b,'all');
c(grp,:) = [ME(T_b),ME(T_u),ME(T_i),ME(I_b),ME(I_u),ME(I_i),ME(F_b),ME(F_u),ME(F_i)];
all_NCCSMs(grp*5-4:grp*5,:) = [T_b,T_u,I_i,I_b,I_u,I_i,F_b,F_u,F_i];
end
