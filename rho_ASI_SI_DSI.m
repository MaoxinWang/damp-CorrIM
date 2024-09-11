function [rho50,sigma_z] = rho_ASI_SI_DSI(x_Damp1,x_Damp2,PairIM)

% Created by Mao-Xin Wang (dr.maoxin.wang@gmail.com or maoxinwang@ust.hk)
% August 2024
%
% Predict correlations between pairs of ASI, SI, and DSI
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT
%   x_Damp1  = damping ratio of the first intensity measure (not in percentage!)
%   x_Damp2  = damping ratio of the second intensity measure (not in percentage!)
%   PairIM   = pair of the intensity measures, which can be:
%             'ASI-SI', 'ASI-DSI', 'SI-DSI'
%
% OUTPUT
%   rho50     = median correlation coefficient
%   sigma_z   = standard deviation of the z variable
%
% EXAMPLE
%   % predict correlation between SI(5%) and DSI(15%)
%   [rho50,sigma_z] = rho_ASI_SI_DSI(0.05,0.15,'SI-DSI');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Model Coefficients
c_all = [
    0.65289	-0.00193	0.01838	0.00483	0.00038	0.00325	0.02623	0.00154	-0.00121	0.00037	-0.00034	0.00020	0.00000
    0.28377	-0.00577	0.02435	0.00661	0.00568	0.00362	0.04159	0.00046	0.00041	0.00004	-0.00005	0.00009	0.00001
    0.75848	-0.01063	0.01312	-0.00274	0.00227	0.00745	0.03786	-0.00147	0.00182	0.00002	0.00008	-0.00012	0.00002
    ];

switch PairIM
    case 'ASI-SI'
        id_coeff = 1;
    case 'ASI-DSI'
        id_coeff = 2;
    case 'SI-DSI'
        id_coeff = 3;
end

%% Model Prediction
rho50 = c_all(id_coeff,1)+c_all(id_coeff,2)*log(100*x_Damp1)+c_all(id_coeff,3)*log(100*x_Damp2)+...
    c_all(id_coeff,4)*(log(100*x_Damp1)).^2+c_all(id_coeff,5)*(log(100*x_Damp2)).^2+...
    c_all(id_coeff,6)*log(100*x_Damp1).*log(100*x_Damp2);

sigma_z = c_all(id_coeff,7)+c_all(id_coeff,8)*log(100*x_Damp1)+c_all(id_coeff,9)*log(100*x_Damp2)+...
    c_all(id_coeff,10)*(log(100*x_Damp1)).^2+c_all(id_coeff,11)*(log(100*x_Damp2)).^2+...
    c_all(id_coeff,12)*log(100*x_Damp1).*log(100*x_Damp2)+...
    c_all(id_coeff,13)*(log(100*x_Damp1).*log(100*x_Damp2)).^2;
