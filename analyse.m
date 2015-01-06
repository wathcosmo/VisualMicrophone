function f = analyse(vibwav, mode)
%ANALYSE 此处显示有关此函数的摘要
%   freq = analyse(vibwav, mode)
    vibwav = mapminmax(vibwav', -1, 1);
    vibwav = vibwav - mean(vibwav);
    if length(vibwav) < 960
        vibwav = [vibwav, zeros(1, 960-length(vibwav))];
    end
    
    if mode == 1
        freq = abs(fft(vibwav));
        freq(1 : end-1) = freq(2 : end);
        freq(1:49) = 0;
        freq(451:end) = 0;
        f = find(freq == max(freq));
    else
        freq = abs(fft(vibwav));
        freq(1 : end-1) = freq(2 : end);
        freq(1:49) = 0;
        freq(451:end) = 0;
        [~, ind] = sort(freq, 'descend');
        f(1) = ind(1);
        for k = 2 : 450
            if abs(ind(k) - ind(1)) > 50
                f(2) = ind(k);
                f = sort(f);
                break;
            end
        end
    end

end

