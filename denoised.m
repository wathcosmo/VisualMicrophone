function imgout = denoised(videoID, num)
    img = frmread(videoID, num);
    img = im2double(img);
    frms = max(1, num-50) : min(18134, num+50);
    a = zeros(1080, 1920);
    for i = frms
        im = frmread(videoID, i);
        im = im2double(im);
        a = a + im;
    end
    bg = a / length(frms);
%     imshow(bg);
    dif = abs(img - bg);
%     figure;
%     imshow(dif);
    bw = im2bw(dif, graythresh(dif));
    imgout = img .* (1-bw) + bg .* bw;
end

