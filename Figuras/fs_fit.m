P = 0:0.1:40;

K1 = 10;
K2 = 1;
K3 = 0.5;
term = -K2*(P+K3);
Q = K1 ./(1 + exp(term));
Qlvad = 1.5 + (10 + (-10./ (1+(P./15).^3.3)));
Qrvad = 1.7 + (10 + (-10./ (1+(P./8).^2)));
SF = 1;
plot(P,Qlvad*SF,P,Qrvad*SF)
grid on

%%
x = P;
ylvad = Qlvad;
eqlvad = 'k1lvad/(1+exp(-k2lvad*(x+k3lvad)))'
startPoints = [1.5 1 1.8]
f1 = fit(x',ylvad',eqlvad,'Start', startPoints)
plot(f1,x,ylvad)

%%
x = P;
yrvad = Qrvad;
eq = 'k1rvad/(1+exp(-k2rvad*(x+k3rvad)))'

startPoints = [0.2 0.1 2]
f2 = fit(x',yrvad',eq,'Start', startPoints)
%f2 = polyfit(x,yrvad,7);
%yrvad_res = polyval(f2,P);
%plot(P, yrvad_res)
%hold on
%plot(P, yrvad)
plot(f2,x,yrvad)
%%
term_qlvad = -f1.k2lvad*(P+f1.k3lvad);
Qlvad_fitted = f1.k1lvad ./(1 + exp(term_qlvad));

term_qrvad = -f2.k2rvad*(P+f2.k3rvad);
Qrvad_fitted = f2.k1rvad ./(1 + exp(term_qrvad));

plot(P,Qlvad_fitted, P, Qrvad_fitted)
%%
plot(P,Qlvad,'k--','linewidth', 1)
hold on
plot(P,Qlvad_fitted, '.-', 'linewidth',0.5)
hold on
plot(P,Qrvad,'k-.','linewidth',1)
hold on
plot(P,Qrvad_fitted, '-', 'linewidth', 2)
grid on
xlabel('Tempo (s)')
ylabel('Taxa de Fluxo (L/min)','interpreter','latex')
set(gca,'FontSize',16)
set(gca,'fontname','times')
legend('QLVAD', 'QLVAD Ajustado', 'QRVAD', 'QRVAD Ajustado','location','southeast')

%%

ylvad_coef = polyfit(P,ylvad,7);
ylvad_poly = polyval(ylvad_coef,x); 
plot(P,ylvad)
hold on
plot(P, ylvad_poly)

%%

yrvad_coef = polyfit(P,yrvad,7);
yrvad_poly = polyval(yrvad_coef,x); 
plot(P,yrvad)
hold on
plot(P, yrvad_poly)

%%
plot(P,ylvad,'k--','linewidth', 1)
hold on
plot(P, ylvad_poly,'.-', 'linewidth',0.5)
hold on
plot(P,yrvad,'k-.','linewidth',1)
hold on
plot(P, yrvad_poly, '-', 'linewidth', 2)
grid on
xlabel('Tempo (s)')
ylabel('Taxa de Fluxo (L/min)','interpreter','latex')
set(gca,'FontSize',16)
set(gca,'fontname','times')
legend('QLVAD', 'QLVAD Ajustado', 'QRVAD', 'QRVAD Ajustado','location','southeast')
