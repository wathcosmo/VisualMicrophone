function [imgout, background] = denoised(videoID, num, bg)
%DENOISED get denoised image
% [imgout, background] = denoised(videoID, num)
% [imgout] = denoised(videoID, num, background)
% output format is double image
    img = frmread(videoID, num);
    img = im2double(img);
    frms = max(1, num-50) : min(18134, num+50);
    if nargin == 2
        a = zeros(1080, 1920);
        for i = frms
            im = frmread(videoID, i);
            im = im2double(im);
            a = a + im;
        end
        bg = a / length(frms);
    else
        bg = im2double(bg);
    end
%     imshow(bg);
    dif = abs(img - bg);
%     figure;
%     imshow(dif);
    bw = im2bw(dif, graythresh(dif));
    imgout = img .* (1-bw) + bg .* bw;
    imgout = uint8(imgout * 255);
    if nargout == 2
        background = uint8(bg*255);
    end
end

