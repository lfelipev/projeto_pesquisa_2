P = 0:0.1:20;

Qlvad = (10.59 + (-10.59./(1+(P./5.43).^2.79)));
Qrvad = (10.59 + (-10.59./(1+(P./3.94).^2.27)));
SF = 1;
plot(P,Qlvad*SF,P,Qrvad*SF, 'linewidth',2)
legend('QLVAD', 'QRVAD', 'Location','southeast');
grid on
xlabel('Tempo (s)')
ylabel('Taxa de Fluxo (L/min)','interpreter','latex')
set(gca,'FontSize',16)
set(gca,'fontname','times')