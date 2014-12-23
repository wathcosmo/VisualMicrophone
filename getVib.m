function vibwav = getVib(videoID, frms)
%GETVIB get vibration wave
%   vibwav = getVib(videoID, frms)

    n = length(frms);
    %[img, bg] = denoised(videoID, frms(1));
    img = frmread(videoID, frms(1));
    tmpl = img(900:1050, 800:1000);
    X = zeros(n, 2);
    X(1, :) = [900, 800];
    
    for k = 2 : n
        %im = denoised(videoID, frms(k), bg);
        im = frmread(videoID, frms(k));
        dif = cv.matchTemplate(im(800:1080, 700:1100), tmpl);
        [r,c] = find(dif == min(dif(:)));
        X(k, :) = [799+r, 699+c];
    end
    
    avg = mean(X);
    X = X - repmat(avg, n, 1);
    [~, ~, v] = svd(X);
    vibwav = X * v;
end

