% Defined Variables:

% Mercury
des_merc=68.617E9; % Distance of Mercury from Sun (m)
% Venus
des_ven=107.48E9;
% Earth
des_earth=148E9; % Distance of Earth from Sun (m)
% Mars
des_mars=224.45E9; % Distance of Mars from Sun (m)

% Global Variables
G=6.67408E-11; % Gravitational Constant (m^3/kg*s^2)
M=1.989E30;    % Mass of Sun (kg)
tmax=(2*pi*des_mars)/sqrt(G*M/des_mars); % Time of simulation (1 year)
clockmax=250; % Number of time steps in simulation
dt=tmax/clockmax; % Time step duration (s)

% Initial Conditions:

% Mercury
X_merc=des_merc;
Y_merc=0;
U_merc=0;
V_merc=sqrt(G*M/des_merc); % Speed of Mars's orbit
T_merc=0;
% Venus
X_ven=des_ven;
Y_ven=0;
U_ven=0;
V_ven=sqrt(G*M/des_ven); % Speed of Venus's orbit
T_ven=0;
% Earth
X=des_earth;
Y=0;
U=0;
V=sqrt(G*M/des_earth); % Speed of Earth's orbit
T=0;
% Mars
X_mars=des_mars;
Y_mars=0;
U_mars=0;
V_mars=sqrt(G*M/des_mars); % Speed of Mars's orbit
T_mars=0;

% Initialization for Movie:
set(gcf,'double','on')
plot(0,0,'r*','DisplayName','Sun');
hold on

% Mercury
hplanet_merc=plot(X_merc,Y_merc,'bo','DisplayName','Mercury','HandleVisibility','off');
htrail_merc=plot(X_merc,Y_merc,'DisplayName','Mercury');
% Venus
hplanet_ven=plot(X_ven,Y_ven,'bo','DisplayName','Venus','HandleVisibility','off');
htrail_ven=plot(X_ven,Y_ven,'DisplayName','Venus');
% Earth
hplanet=plot(X,Y,'bo','DisplayName','Earth','HandleVisibility','off');
htrail=plot(X,Y,'DisplayName','Earth');
% Mars
hplanet_mars=plot(X_mars,Y_mars,'bo','DisplayName','Mars','HandleVisibility','off');
htrail_mars=plot(X_mars,Y_mars,'DisplayName','Mars');

axis([-1.5*des_mars,1.5*des_mars,-1.5*des_mars,1.5*des_mars])
axis equal
axis manual
legend

% Arrays to Hold Trail of Planet:

% Mercury
Xsave_merc=zeros(1,clockmax);
Ysave_merc=zeros(1,clockmax);
% Venus
Xsave_ven=zeros(1,clockmax);
Ysave_ven=zeros(1,clockmax);
% Earth
Xsave=zeros(1,clockmax);
Ysave=zeros(1,clockmax);
% Mars
Xsave_mars=zeros(1,clockmax);
Ysave_mars=zeros(1,clockmax);

% Main Loop:
for clock=1:clockmax
 t=clock*dt;
 
 % Mercury
 R_merc=sqrt(X_merc^2+Y_merc^2);
 U_merc=U_merc-dt*G*M*X_merc/R_merc^3;
 V_merc=V_merc-dt*G*M*Y_merc/R_merc^3;
 Y_prev_merc=Y_merc;
 X_merc=X_merc+dt*U_merc;
 Y_merc=Y_merc+dt*V_merc;
 if (T_merc==0)&&(X_merc>0)&&(Y_prev_merc<0)&&(Y_merc>=0)
    T_merc=t;
 end
 Xsave_merc(clock)=X_merc;
 Ysave_merc(clock)=Y_merc;
 tsave_merc(clock)=t;
 set(hplanet_merc,'xdata',X_merc,'ydata',Y_merc)
 set(htrail_merc,'xdata',Xsave_merc(1:clock),'ydata',Ysave_merc(1:clock))
 drawnow
 % Venus
 R_ven=sqrt(X_ven^2+Y_ven^2);
 U_ven=U_ven-dt*G*M*X_ven/R_ven^3;
 V_ven=V_ven-dt*G*M*Y_ven/R_ven^3;
 Y_prev_ven=Y_ven;
 X_ven=X_ven+dt*U_ven;
 Y_ven=Y_ven+dt*V_ven;
 if (T_ven==0)&&(X_ven>0)&&(Y_prev_ven<0)&&(Y_ven>=0)
    T_ven=t;
 end
 Xsave_ven(clock)=X_ven;
 Ysave_ven(clock)=Y_ven;
 tsave_ven(clock)=t;
 set(hplanet_ven,'xdata',X_ven,'ydata',Y_ven)
 set(htrail_ven,'xdata',Xsave_ven(1:clock),'ydata',Ysave_ven(1:clock))
 drawnow
 % Earth
 R_earth=sqrt(X^2+Y^2);
 U=U-dt*G*M*X/R_earth^3;
 V=V-dt*G*M*Y/R_earth^3;
 Y_prev=Y;
 X=X+dt*U;
 Y=Y+dt*V;
 if (T==0)&&(X>0)&&(Y_prev<0)&&(Y>=0)
    T=t;
 end
 Xsave(clock)=X;
 Ysave(clock)=Y;
 tsave(clock)=t;
 set(hplanet,'xdata',X,'ydata',Y)
 set(htrail,'xdata',Xsave(1:clock),'ydata',Ysave(1:clock))
 drawnow
 % Mars
 R_mars=sqrt(X_mars^2+Y_mars^2);
 U_mars=U_mars-dt*G*M*X_mars/R_mars^3;
 V_mars=V_mars-dt*G*M*Y_mars/R_mars^3;
 Y_prev_mars=Y_mars;
 X_mars=X_mars+dt*U_mars;
 Y_mars=Y_mars+dt*V_mars;
 if (T_mars==0)&&(X_mars>0)&&(Y_prev_mars<0)&&(Y_mars>=0)
    T_mars=t;
 end
 Xsave_mars(clock)=X_mars;
 Ysave_mars(clock)=Y_mars;
 tsave_mars(clock)=t;
 set(hplanet_mars,'xdata',X_mars,'ydata',Y_mars)
 set(htrail_mars,'xdata',Xsave_mars(1:clock),'ydata',Ysave_mars(1:clock))
 drawnow
end

% Proving Kepler's Third Law
figure()
hold on

T_square=zeros(1,5);
T_square(2)=T_merc^2;
T_square(3)=T_ven^2;
T_square(4)=T^2;
T_square(5)=(clockmax*dt)^2;

T_square2=zeros(1,5);
T_square2(1)=0;
T_square2(2)=period(des_merc)^2;
T_square2(3)=period(des_ven)^2;
T_square2(4)=period(des_earth)^2;
T_square2(5)=period(des_mars)^2;

R_cube=[0,des_merc^3,des_ven^3,des_earth^3,des_mars^3];

plot(T_square,R_cube,'-o')
plot([0 T_square(5)],[0 R_cube(5)],'--')
xlim([0 4.5E15])
ylim([0 13E33])
title('Keplers Third Law')
xlabel('Orbital Period (squared)')
ylabel('Distance From the Sun (cubed)')
legend('Empirical data','Constant Line')

function output=period(r)
    G=6.67408E-11; % Gravitational Constant (m^3/kg*s^2)
    M=1.989E30;    % Mass of Sun (kg)
    output=(2*pi*r)/sqrt(G*M/r);
end