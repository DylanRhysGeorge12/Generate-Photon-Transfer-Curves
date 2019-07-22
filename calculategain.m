function [a, gain] = calculategain(mean_data_setham,var_data_setham)

b = plot(squeeze(mean_data_setham(2:end-2)'),squeeze(var_data_setham(2:end-2)));
a = fitlm(squeeze(mean_data_setham(2:end-2)'),squeeze(var_data_setham(2:end-2)'))
hold on
plot(a)

gain = a.Coefficients(2,1) 
gain = gain{:,:}

end
