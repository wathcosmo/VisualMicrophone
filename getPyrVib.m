function vibwav = getPyrVib(videoID, frms)
%GETPYRVIB get vibration wave by Complex Steerable Pyramid
%   vibwav = getVib(videoID, frms)
    nfrms = length(frms);

    Nsc = 3; % number of scales (pyramid levels) 
    Nor = 4; % number of orientations

    img = frmread(videoID, frms(1));
    im0 = img(801:800+256, 801:800+256);
    [pyr0, pind] = buildSCFpyr(im0, Nsc, Nor-1);
    npairs = length(pind); % number of scale-orientation pairs
    pind = pind(:,1) .* pind(:,2);
    for k = 2 : npairs
        pind(k) = pind(k-1) + pind(k);
    end
    pind = [0, pind'];
    phi0 = angle(pyr0);
    Phase = zeros(nfrms, npairs);
    

    for k = 2 : nfrms
        img = frmread(videoID, frms(k));
        im0 = img(801:800+256, 801:800+256);
        [pyr, ~] = buildSCFpyr(im0, Nsc, Nor-1);
        phi = angle(pyr);
        phi_v = phi - phi0;
        pyr = conj(pyr) .* pyr .* phi_v;
        for i = 1 : npairs
            Phase(k, i) = sum(pyr(pind(i)+1 : pind(i+1)));
        end
    end
    save phase4 Phase
    
    vibwav = zeros(960, 1);
    vibwav(1:nfrms) = Phase(:,1);
    for i = 2 : npairs
        mx = Phase(:,1)' * Phase(:,i);
        topt = 0;
        for t = 1 : 20
            cor = Phase(:,1)' * [zeros(t,1); Phase(1:nfrms-t,i)];
            if  abs(cor) > abs(mx)
                mx = cor;
                topt = t;
            end
            cor = Phase(:,1)' * [Phase(1+t:nfrms,i); zeros(t,1)];
            if  abs(cor) > abs(mx)
                mx = cor;
                topt = -t;
            end
        end
        disp(topt);
        if topt >= 0
            if mx > 0
                vibwav(1:nfrms) = vibwav(1:nfrms) + [zeros(topt,1); Phase(1:nfrms-topt,i)];
            else
                vibwav(1:nfrms) = vibwav(1:nfrms) - [zeros(topt,1); Phase(1:nfrms-topt,i)];
            end
        else
            if mx > 0
                vibwav(1:nfrms) = vibwav(1:nfrms) + [Phase(1-topt:nfrms,i); zeros(-topt,1)];
            else
                vibwav(1:nfrms) = vibwav(1:nfrms) - [Phase(1-topt:nfrms,i); zeros(-topt,1)];
            end
        end
    end
    
    vibwav(1:nfrms) = vibwav(1:nfrms) - mean(vibwav(1:nfrms));
%     vibwav(1:nfrms) = detrend(vibwav(1:nfrms));
%     for i = 1 : npairs
%         vibwav(1:nfrms, i) = detrend(Phase(:,i));
%     end
end

