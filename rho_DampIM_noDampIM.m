function [rho50,sigma_z] = rho_DampIM_noDampIM(x_Damp,PairIM)

% Created by Mao-Xin Wang (dr.maoxin.wang@gmail.com or maoxinwang@ust.hk)
% August 2024
%
% Predict correlations of ASI/SI/DSI with damping-independent intensity measures
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT
%   x_Damp  = damping ratio of SA (not in percentage!)
%   PairIM  = pair of the intensity measures, which can be:
%           (1) 'ASI-PGA', 'ASI-PGV', 'ASI-AI', 'ASI-CAV', 'ASI-Tm', 'ASI-Ds575', or 'ASI-Ds595'
%           (2) 'SI-PGA', 'SI-PGV', 'SI-AI', 'SI-CAV', 'SI-Tm', 'SI-Ds575', or 'SI-Ds595'
%           (3) 'DSI-PGA', 'DSI-PGV', 'DSI-AI', 'DSI-CAV', 'DSI-Tm', 'DSI-Ds575', or 'DSI-Ds595'
%
% OUTPUT
%   rho50     = median correlation coefficient
%   sigma_z   = standard deviation of the z variable
%
% EXAMPLE
%   % predict correlation between SI(5%) and AI
%   [rho50,sigma_z] = rho_DampIM_noDampIM(0.05,'SI-AI');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Model Coefficients
a_all = [
    0.88866	0.01946	-0.00262	0.04402	-0.00453	-0.00055	0.00000
    0.78109	0.01641	0.00232	0.02358	-0.00106	-0.00149	0.00106
    0.84341	0.00000	0.00000	0.08455	0.00221	0.00000	0.00000
    0.76726	0.00000	0.00000	0.04003	0.00000	0.00000	0.00000
    -0.26219	-0.01059	0.00776	0.01039	0.00000	0.00000	0.00000
    -0.42595	-0.03409	0.00542	0.02374	0.00077	0.00000	0.00000
    -0.42955	-0.02365	0.00546	0.01912	0.00000	0.00000	0.00000
    0.53329	0.03399	0.00000	0.05772	-0.00272	-0.00085	0.00000
    0.81486	0.02675	0.00000	0.08470	0.00398	-0.00096	-0.00045
    0.61639	0.01191	0.00156	0.03975	-0.00063	0.00000	0.00000
    0.61705	0.00460	0.00140	0.03900	-0.00114	0.00000	0.00000
    0.38981	-0.02160	-0.00330	0.03281	0.00072	0.00000	0.00000
    -0.17106	-0.04314	0.00000	0.02263	0.00000	0.00000	0.00000
    -0.13096	-0.04250	0.00000	0.01854	0.00000	0.00000	0.00000
    0.27005	0.03157	0.00514	0.06630	-0.00118	-0.00072	0.00000
    0.60276	0.03993	0.00573	0.05102	0.00009	-0.00100	0.00042
    0.38462	0.02055	0.00349	0.03314	0.00136	0.00000	0.00000
    0.44163	0.01151	0.00285	0.03759	0.00170	-0.00017	0.00000
    0.40402	-0.01055	-0.00307	0.05786	0.00000	0.00000	0.00000
    0.06969	-0.03762	-0.00656	0.02923	0.00000	0.00000	0.00000
    0.12768	-0.04699	-0.00527	0.03032	0.00000	0.00000	0.00000
    ];

switch PairIM
    case 'ASI-PGA'
        id_coeff = 1;
    case 'ASI-PGV'
        id_coeff = 2;
    case 'ASI-AI'
        id_coeff = 3;
    case 'ASI-CAV'
        id_coeff = 4;
    case 'ASI-Tm'
        id_coeff = 5;
    case 'ASI-Ds575'
        id_coeff = 6;
    case 'ASI-Ds595'
        id_coeff = 7;
    case 'SI-PGA'
        id_coeff = 8;
    case 'SI-PGV'
        id_coeff = 9;
    case 'SI-AI'
        id_coeff = 10;
    case 'SI-CAV'
        id_coeff = 11;
    case 'SI-Tm'
        id_coeff = 12;
    case 'SI-Ds575'
        id_coeff = 13;
    case 'SI-Ds595'
        id_coeff = 14;
    case 'DSI-PGA'
        id_coeff = 15;
    case 'DSI-PGV'
        id_coeff = 16;
    case 'DSI-AI'
        id_coeff = 17;
    case 'DSI-CAV'
        id_coeff = 18;
    case 'DSI-Tm'
        id_coeff = 19;
    case 'DSI-Ds575'
        id_coeff = 20;
    case 'DSI-Ds595'
        id_coeff = 21;
end

%% Model Prediction
rho50 = a_all(id_coeff,1)+a_all(id_coeff,2)*log(100*x_Damp)+a_all(id_coeff,3)*(log(100*x_Damp)).^2;

sigma_z = a_all(id_coeff,4)+a_all(id_coeff,5)*log(100*x_Damp)+a_all(id_coeff,6)*(log(100*x_Damp)).^2+...
    +a_all(id_coeff,7)*(log(100*x_Damp)).^3;

