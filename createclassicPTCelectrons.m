function [mean_data_in_electrons,new_std_for_electrons] = createclassicPTCelectrons(mean_data_setham,std_data_setham, gain)

mean_data_in_electrons = mean_data_setham * gain;
new_std_for_electrons = std_data_setham * gain;


figure(1)
a = plot(squeeze(mean_data_in_electrons),squeeze(new_std_for_electrons),'-b*')
f1 = fit(squeeze(mean_data_in_electrons)',squeeze(new_std_for_electrons)','power2')
hold on
plot(f1)
hold on


figure (2)
b = plot(log(squeeze(mean_data_in_electrons)),log(squeeze(new_std_for_electrons)),'gr*')


xlabel('Log Signal, DN');
ylabel('Log Noise, DN');
% xlim([-4 12])
ylim([0 9]);
hold on
end