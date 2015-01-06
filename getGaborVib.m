function vibwav = getGaborVib(videoID, frms)
%GETGABORVIB get vibration wave by Gabor Transformation
%   vibwav = getGaborVib(videoID, frms)

% generate a Gabor filter
    G = gaborFilter;

    nfrms = length(frms);
    img = frmread(videoID, frms(1));
%     img = img(551:550+512, 801:800+512);
    img = img(51:50+1024, 1:1024);
    imf = conv2(double(img), double(G),'same'); % Gabor transform
    phi0 = angle(imf);
    Phase = zeros(nfrms, 1);
    
    for k = 2 : nfrms
        img = frmread(videoID, frms(k));
        img = img(51:50+1024, 1:1024);
        imf = conv2(double(img), double(G),'same');
        phi = angle(imf);
        phi_v = phi - phi0;
%         phi_v(phi_v < 0) = phi_v(phi_v < 0) + 2 * pi;
        pha = conj(imf) .* imf .* phi_v;
        Phase(k) = sum(pha(:));
    end
    
    vibwav = detrend(Phase);
end

