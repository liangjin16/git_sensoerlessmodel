clear;
%close all;
%% Parameter define
DC_max = 350;
Ld = 8.9*1e-3/3;
Lq = 12.7*1e-3/3;
Rs = 0.8;
Pasi = 0.1216;
Pole_pair = 3;
Omega_m = 1*95; %% Hz
I_max = 14%17.5;
Id_max = -0.35*0.8*25 %-0.35*25;
Te = 5;

%% Parameter define
DC_max = 350;
Ld = 8.9*1e-3;
Lq = 12.7*1e-3;
Rs = 0.8;
Pasi = 0.1216;
Pole_pair = 3;
Omega_m = 70; %% Hz
I_max = 14%17.5;
Id_max = -0.35*0.8*25 %-0.35*25;
Te = 5;

%% Calculate
syms Id Iq;
Omega_e = Omega_m*Pole_pair*2*pi;

% figure set
figure;
axis equal;
%ezplot(Iq*(Id-Id_max),[-30,30,-30,30]);

hold on;
h = ezplot(Id*Iq,[-30,30,-30,30]);
set(h,'color','k');

hold on;
% plot voltage oval
h = ezplot((-Omega_e*Lq*Iq+Id*Rs).^2+(Omega_e*Ld*Id+Omega_e*Pasi+Iq*Rs).^2 - (DC_max/sqrt(3)).^2,[-30,30,-30,30]);
set(h,'color','r');

Omega_e = Omega_e/2;
h = ezplot((-Omega_e*Lq*Iq+Id*Rs).^2+(Omega_e*Ld*Id+Omega_e*Pasi+Iq*Rs).^2 - (DC_max/sqrt(3)).^2,[-30,30,-30,30]);
set(h,'color','r');

% plot current circle
hold on ;
h = ezplot(Id.^2+Iq.^2 - I_max.^2,[-30,30,-30,30]);
set(h,'color','b');



% plot T limit
Te = 1;
hold on;
ezplot(((Pasi*Iq+(Ld-Lq)*Id*Iq)*Pole_pair)-Te,[-30,30,-30,30]);

Te = 3;
hold on;
ezplot(((Pasi*Iq+(Ld-Lq)*Id*Iq)*Pole_pair)-Te,[-30,30,-30,30]);

Te = 5;
hold on;
ezplot(((Pasi*Iq+(Ld-Lq)*Id*Iq)*Pole_pair)-Te,[-30,30,-30,30]);

Te = 7;
hold on;
ezplot(((Pasi*Iq+(Ld-Lq)*Id*Iq)*Pole_pair)-Te,[-30,30,-30,30]);
