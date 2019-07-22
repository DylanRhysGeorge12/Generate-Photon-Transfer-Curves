function [currentham] = calculatestats(directorham, mean_dark_stackham)
    

    d_file_nameham =strcat(directorham.folder,'/',directorham.name);
    listingham = dir(d_file_nameham);
    current_fileham = strcat(d_file_nameham,'/',listingham(3).name);
    info_currentham = imfinfo(current_fileham);
    numberofframes = length(info_currentham);
    
   for d = 1:numberofframes
        currentham(:,:,d)= double(imread(current_fileham, d));
   end
    
%    currentham = currentham - darkStackham;
   currentham = currentham - mean_dark_stackham;
   
%    currentham = diff(currentham);
  currentham = currentham(450:460,450:460,:);
  currentham = reshape(currentham,11*11*500,[]);
end