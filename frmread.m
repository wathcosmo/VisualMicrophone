function imgout = frmread(videoID, num)
%FRMREAD get specific frame
% imgout = frmread(videoID, num)
% videoID =  1 : video01 frame, 
%            2 : video02 blue frame, 
%            3 : video02 gray frame
    if videoID == 1
        folderID = ceil(num / 960);
        imgout = imread(strcat('pics/m', num2str(videoID), 'pics(', ...
        num2str(folderID), ')/im', num2str(num), '.jpg'));
    elseif videoID == 2
        if num > 17000
            folderID = 18;
        else
            folderID = ceil(num/1000);
        end
        imgout = imread(strcat('pics/m2blue(', num2str(folderID), ...
            ')/im', num2str(num), '.jpg'));
    else
        if num > 17000
            folderID = 18;
        else
            folderID = ceil(num/1000);
        end
        imgout = imread(strcat('pics/m2gray(', num2str(folderID), ...
            ')/im', num2str(num), '.jpg'));
    end
end

