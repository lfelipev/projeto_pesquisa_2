P = 0:0.1:30;

a8 = 3.2907*10^(-9);
a7 = -4.4578*10^(-7);
a6 = 2.5023*10^(-5);
a5 = -7.4677*10^(-4);
a4 = 0.0125184;
a3 = -0.1107;
a2 = 0.3442;
a1 = 1.4774;
a0 = 0;
Qrvad = a8.*P.^(8) + a7.*P.^(7) + a6.*P.^(6) + a5.*P.^(5) + a4.*P.^(4) + a3.*P.^(3) + a2.*P.^(2) + a1.*P.^(1) + a0;

b3 = 5.6410*10^(-5);
b2 = -0.0142;
b1 = 0.6974;
b0 = 0.03167;
Qlvad = b3.*P.^(3) + b2.*P.^(2) + b1.*(P) + b0;

SF = 1;
plot(P,Qlvad*SF,P,Qrvad*SF, 'linewidth',2)
legend('QLVAD', 'QRVAD', 'Location','southeast');
grid on
xlabel('Tempo (s)')
ylabel('Taxa de Fluxo (L/min)','interpreter','latex')
set(gca,'FontSize',16)
set(gca,'fontname','times')