function a = createclassicPTC(mean_data_setham,std_data_setham)

figure(1)
a = plot(squeeze(mean_data_setham),squeeze(std_data_setham),'-b*')
f1 = fit(squeeze(mean_data_setham)',squeeze(std_data_setham)','power2')
hold on
plot(f1)
hold on


figure (2)
b = plot(log(squeeze(mean_data_setham)),log(squeeze(std_data_setham)),'gr*')

xlabel('Log Signal, DN');
ylabel('Log Noise, DN');
% xlim([-4 12])
ylim([0 9]);
hold on

end