function [directorham,mean_dark_stackham,numberofimages] = loader(foldername, filename)

foldernameappend = '/Dark Image';
dark_dataham = fullfile(foldername,foldernameappend,filename);
infoham = imfinfo(dark_dataham);
numberofimages = length(infoham);

    for d = 1:numberofimages
    darkStackham(:,:,d)= double(imread(dark_dataham, d));
    end
    
mean_dark_stackham = mean(darkStackham,3);
directorham = dir(foldername);

IDX = strfind({directorham.name},'.');
TF = cellfun('isempty', IDX);
directorham = directorham(TF);
end
