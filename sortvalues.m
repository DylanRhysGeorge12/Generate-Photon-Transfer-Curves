function [std_data_setham] = sortvalues(mean_data_setham,std_data_setham)

[mean_data_setham,idx] = sort(mean_data_setham);
std_data_setham= std_data_setham(idx);
end