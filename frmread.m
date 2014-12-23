function imgout = frmread(videoID, num)
%FRMREAD get specific frame
    folderID = ceil(num / 960);
    imgout = imread(strcat('pics/m', num2str(videoID), 'pics(', ...
        num2str(folderID), ')/im', num2str(num), '.jpg'));
end

