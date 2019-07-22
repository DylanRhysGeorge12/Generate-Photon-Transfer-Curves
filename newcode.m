tic

% Set path with foldername and set dark image file as filename or load:

% load(22July)

foldername = '/Volumes/Seagate Backup Plus Drive/Dylan - PhD/Noise/PTC/95B test 4';
filename = 'darkimage.tif';

% Load Images:

[directorham,mean_dark_stackham,numberofimages] = loader(foldername, filename);

% calculate mean, standard deviation and variance of all images plus
% subtract background if images are tiffs and in folders:

for I =1:length(directorham)
    
 [currentham] = calculatestats(directorham(I),mean_dark_stackham);

  mean_data_setham(I) = mean(currentham);
  std_data_setham(I) = std(currentham);
  var_data_setham(I) = var(currentham);
  clear currentham
end

% Sort data on increasing mean signal:

[std_data_setham] = sortvalues(mean_data_setham,std_data_setham, gain)

% Calculate gain by gradient of variance vs mean:

[a, gain] = calculategain(mean_data_setham, var_data_setham)

% Create Classic PTC curve (in counts):

a = createclassicPTC(mean_data_setham,std_data_setham)

%  Create Classic PTC curve (in electrons):

[mean_data_in_electrons,new_std_for_electrons] = createclassicPTCelectrons(mean_data_setham,std_data_setham, gain)

% Save your data in the same path:

save('22July','mean_data_setham','std_data_setham','var_data_setham');

toc