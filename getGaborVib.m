function vibwav = getGaborVib(videoID, frms)
%GETGABORVIB get vibration wave by Gabor Transformation
%   vibwav = getGaborVib(videoID, frms)
    
    nfrms = length(frms);
    img = frmread(videoID, frms(1));
    [~, imf] = gabor_a(img, 0.5, 3, pi/4, 0);
    phi0 = angle(imf);
    Phase = zeros(nfrms, 1);
    
    for k = 2 : nfrms
        img = frmread(videoID, frms(k));
        [~, imf] = gabor_a(img, 0.5, 3, pi/4, 0);
        phi = angle(imf);
        phi_v = phi - phi0;
        pha = conj(imf) .* imf .* phi_v;
        Phase(k) = sum(pha(:));
    end
    
    vibwav = detrend(Phase);
end

