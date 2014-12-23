function vibwav = OFA(frms, impath)
    addpath('./mexopencv-master');
    
    numPt = 40;
    n = length(frms);
    imref = imread(strcat(impath, '/im', num2str(frms(1)), '.jpg'));
    imref = recoverBG(imref); % recover black background from noise
    ptsref = cv.goodFeaturesToTrack(imref, 'MaxCorners', numPt);
    
%     % check the selected points
%     figure;
%     a = imref;
%     for i = 1 : numPt
%        y = ptsref{i}(1);
%        x = ptsref{i}(2);
%        a(x,y) = 255;
%     end
%     imshow(a);
    xs(1) = ptsref{1}(1);
    ys(1) = ptsref{1}(2);

    X = zeros(n, 2*numPt);
    for i = 1 : numPt
        X(1, [i*2-1, i*2]) = ptsref{i};
    end
    
    for k = 2 : n
        img = imread(strcat(impath, '/im', num2str(frms(k)), '.jpg'));
        img = recoverBG(img);
        ptscur = cv.calcOpticalFlowPyrLK(imref, img, ptsref);
        xs(k) = ptscur{1}(1);
        ys(k) = ptscur{1}(2);
        for i = 1 : numPt
            X(k, [i*2-1, i*2]) = ptscur{i};
        end
    end
    
    figure;
    a = imref;
    for i = 1 : n
       y = round(xs(i));
       x = round(ys(i));
       a(x,y) = 255;
    end
    imshow(a);
    
    avg = mean(X);
    X = X - repmat(avg, n, 1);
    [v, ~] = eigs(X'*X, 1);
    vibwav = X * v;
end

function imgout = recoverBG(imref)
    imth = imref > 70;
    imth = bwareaopen(1 - imth, 10000);
    imth = uint8(1 - imth);
    imgout = imref .* imth;
end
