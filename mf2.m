function  [H ,Ag, C ,phi, g] =mf2(H, Angle, C,phi,gamma)
Tcolor = [0.588235294117647 0.8 0.796078431372549];
Icolor = [0.996078431372549 0.698039215686274 0.705882352941177];
Fcolor = [0.631372549019608 0.662745098039216 0.815686274509804];
% H %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
H_min = min(H); H_max = max(H);
H_T = gaussmf(H,[15 min(H)-4]);
H_I = gaussmf(H,[15,10.5]);
H_F = gaussmf(H,[10 max(H)+3]);
x =H_min-2:0.1:H_max+2;
plot_H_T = gaussmf(x,[15 min(H)-4]);
plot_H_I = gaussmf(x,[15,10.5]);
plot_H_F = gaussmf(x,[10 max(H)+3]);
figure;
hold on;
plot(x,plot_H_T,'color',Tcolor,'LineWidth',3)
plot(x,plot_H_I,'color',Icolor,'LineWidth',3)
plot(x,plot_H_F,'color',Fcolor,'LineWidth',3)
xlabel('{\itQ}_{1}(m)','FontSize',15);ylabel('Degree of membership','FontSize',15);
legend('\itT_{{\itQ}_{1}}','\itI_{{\itQ}_{1}}','\itF_{{\itQ}_{1}}','FontSize',15,'Location','East');
hold off;
H = [H_T H_I H_F];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ag
Angle_min = min(Angle); Angle_max = max(Angle);
Angle_T = gaussmf(Angle,[18,Angle_min-1]);
Angle_I = gaussmf(Angle,[12, 45]);
Angle_F = gaussmf(Angle,[14, max(Angle)+1]);
x =Angle_min-2:0.1:Angle_max+2;
plot_Angle_T = gaussmf(x,[18,Angle_min-1]);
plot_Angle_I = gaussmf(x,[12, 45]);
plot_Angle_F = gaussmf(x,[14, max(Angle)+1]);
figure;
hold on;
plot(x,plot_Angle_T,'color',Tcolor,'LineWidth',3)
plot(x,plot_Angle_I,'color',Icolor,'LineWidth',3)
plot(x,plot_Angle_F,'color',Fcolor,'LineWidth',3)
xlabel('{\itQ}_{2}(°)','FontSize',15);ylabel('Degree of membership','FontSize',15);
legend('\itT_{{\itQ}_{2}}','\itI_{{\itQ}_{2}}','\itF_{{\itQ}_{2}}','FontSize',15,'Location','East');
hold off;
Ag  = [Angle_T Angle_I Angle_F];
%%%%%%%%%%%%%%%%%%%%

C_min = min(C); C_max = max(C);
C_T = gaussmf(C,[35,151]);
C_I = gaussmf(C,[110,30]);
C_F = gaussmf(C,[30,C_min-1]);
x =C_min-2:0.1:C_max+2;
plot_C_T = gaussmf(x,[35,151]);
plot_C_I = gaussmf(x,[110,60]);
plot_C_F = gaussmf(x,[50,C_min-1]);
figure;
hold on;
plot(x,plot_C_T,'color',Tcolor,'LineWidth',3)
plot(x,plot_C_I,'color',Icolor,'LineWidth',3)
plot(x,plot_C_F,'color',Fcolor,'LineWidth',3)
xlabel('{\itQ}_{3}(Mpa)','FontSize',15);ylabel('Degree of membership','FontSize',15);
legend('\itT_{{\itQ}_{3}}','\itI_{{\itQ}_{3}}','\itF_{{\itQ}_{3}}','FontSize',15,'Location','East');
hold off;
C = 0.9* [C_T C_I C_F];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
phi_min = min(phi); phi_max = max(phi);
phi_T = gaussmf(phi,[20,52]);
phi_I = gaussmf(phi,[10,30]);
phi_F = gaussmf(phi,[15,16]);
x =phi_min-2:0.1:phi_max+2;
plot_phi_T = gaussmf(x,[20,52]);
plot_phi_I = gaussmf(x,[10,30]);
plot_phi_F = gaussmf(x,[15,16]);
figure;
hold on;
plot(x,plot_phi_T,'color',Tcolor,'LineWidth',3)
plot(x,plot_phi_I,'color',Icolor,'LineWidth',3)
plot(x,plot_phi_F,'color',Fcolor,'LineWidth',3)
xlabel('{\itQ}_{4}(°)','FontSize',15);ylabel('Degree of membership','FontSize',15);
legend('\itT_{{\itQ}_{4}}','\itI_{{\itQ}_{4}}','\itF_{{\itQ}_{4}}','FontSize',15,'Location','East');
hold off;

phi = [phi_T phi_I phi_F];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gamma_min = min(gamma); gamma_max = max(gamma);
gamma_T = gaussmf(gamma,[5,24]);
gamma_I = gaussmf(gamma,[5,29]);
gamma_F = gaussmf(gamma,[5,34]);
x =gamma_min-2:0.1:gamma_max+2;
plot_gamma_T = gaussmf(x,[5,24]);
plot_gamma_I = gaussmf(x,[5,29]);
plot_gamma_F = gaussmf(x,[5,34]);
figure;
hold on;
plot(x,plot_gamma_T,'color',Tcolor,'LineWidth',3)
plot(x,plot_gamma_I,'color',Icolor,'LineWidth',3)
plot(x,plot_gamma_F,'color',Fcolor,'LineWidth',3)
xlabel('{\itQ}_{5}(N/m{3})','FontSize',15);ylabel('Degree of membership','FontSize',15);
legend('\itT_{{\itQ}_{5}}','\itI_{{\itQ}_{5}}','\itF_{{\itQ}_{5}}','FontSize',15,'Location','East');
hold off;
g = [gamma_T gamma_I gamma_F];
end


