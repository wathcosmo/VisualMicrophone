function vibwav = getMatchVib(videoID, frms)
%GETMATCHVIB get vibration wave by template matching
%   vibwav = getVib(videoID, frms)
    addpath('./mexopencv-master');

    n = length(frms);
    %[img, bg] = denoised(videoID, frms(1));
    img = frmread(videoID, frms(1));
    
    X = zeros(n, 2);
    if videoID == 1
        %tmpl = img(80:280, 800:1200);
        tmpl = img(950:1060, 900:1000);
        X(1, :) = [51, 51];
    else
        tmpl = img(200:800, 1650:1850);
        X(1, :) = [101, 101];
    end
    
    
    
    for k = 2 : n
        %im = denoised(videoID, frms(k), bg);
        im = frmread(videoID, frms(k));
        if videoID == 1
            dif = cv.matchTemplate(im(900:1080, 850:1050), tmpl);
            %dif = cv.matchTemplate(im(30:330, 750:1250), tmpl);
            [r,c] = find(dif == min(dif(:)), 1);
            X(k, :) = [r, c];
        else
            dif = cv.matchTemplate(im(100:900, 1550:1920), tmpl);
            [r,c] = find(dif == min(dif(:)), 1);
            X(k, :) = [r, c];
        end
    end
    
    X(:,1) = detrend(X(:,1));
    X(:,2) = detrend(X(:,2));
%     [~, ~, v] = svd(X);
    [v, ~] = eigs(X'*X, 1);
    vibwav = zeros(960, 1);
    vibwav(1:n) = X * v;
end

