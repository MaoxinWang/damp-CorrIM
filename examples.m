function examples

Periods = [0.01	0.02	0.03	0.04	0.05	0.075	0.1	0.12	0.15	0.17	0.2	0.25	0.3	0.4	0.5	0.75	1	1.5	2	3	4	5	7.5	10];

%% Example 1: correlations between SA(T=0.01-10, 20%) and PGV
T_SA = Periods;
damp_SA = 0.2*ones(size(T_SA));
[rho50_SA_PGV,sigmaZ_SA_PGV] = rho_SA_noDampIM(T_SA,damp_SA,'SA-PGV');


%% Example 2: correlations between SA(T=0.01-10, 20%) and SI(20%)
T_SA = Periods;
damp_SA = 0.2*ones(size(T_SA));
damp_SI = 0.2*ones(size(T_SA));
[rho50_SA_SI,sigmaZ_SA_SI] = rho_SA_DampIM(T_SA,damp_SA,damp_SI,'SA-SI');


%% Example 3: correlations between ASI(20%) and SI(20%)
damp_ASI = 0.2;
damp_SI = 0.2;
[rho50_ASI_SI,sigmaZ_ASI_SI] = rho_ASI_SI_DSI(damp_ASI,damp_SI,'ASI-SI');


%% Example 4: correlations between ASI(20%) and PGV
damp_ASI = 0.2;
[rho50_ASI_PGV,sigmaZ_ASI_PGV] = rho_DampIM_noDampIM(damp_ASI,'ASI-PGV');

