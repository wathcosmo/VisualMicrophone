%% addpath
% mexopencv=
% addpath('./mexopencv-master');
% mmread
% addpath('./mmread');
% video = mmread('01.MTS', 8000, [], false, true);
% img = video.frames(1).cdata;
% imwrite(img, '8000.jpg');
% % textureSynth
addpath('./textureSynth/matlabPyrTools/');
addpath('./textureSynth/matlabPyrTools/MEX');

%%
%distractPics('02.MTS', '02', 1:18314);

%% video01
% time map

% syn 200Hz
% about 1 sec = 1 : 780

% single freq
% 3 sec = 1741 : 2700
% 4 sec = 2701 : 3660
% 5 sec = 3661 : 4620

% double freq
% 7 sec = 5561 : 6520
% 8 sec = 6561 : 7520
% 9 sec = 7521 : 8480

% music
% 11~17 sec = 9441 : 16160

% ------------------------------------------------------
tic;
VideoID = 1;

% vibwav = zeros(960, 1);
% vibwav(1:600) = getGaborVib(VideoID, 1:600);

vibwav = getGaborVib(VideoID, 5561 : 6520);
vibwav = mapminmax(vibwav', -1, 1);
vibwav = vibwav - mean(vibwav);
freq = abs(fft(vibwav));
freq(1:50) = 0;
freq(452:end) = 0;
figure
plot(freq);

% Frms = {1:780, 781:1740, 1741:2700, 2701:3660, 3661:4620, ...
%     4621:5560, 5561:6560, 6561:7520, 7521:8480, 8481:9440, 9441:18134};
% n = length(Frms);
% 
% vibwav = getGaborVib(VideoID, Frms{3});
% freq = abs(fft(vibwav));
% plot(freq)
% 
% gaborwav1 = zeros(1, 18134);
% for i = 1 : n
%     gaborwav1(Frms{i}) = getGaborVib(1, Frms{i});
% end
% gaborwav1 = mapminmax(gaborwav1', -1, 1);
% gaborwav1 = gaborwav1 - mean(gaborwav1);
% save gaborwav1 gaborwav1

toc;


%% video02
% time map

% syn 200Hz = 1 : 660

% single freq
% 3 sec = 1621 : 2580
% 4 sec = 2581 : 3540
% 5 sec = 3541 : 4500

% double freq
% 7 sec = 5461 : 6420
% 8 sec = 6421 : 7380
% 9 sec = 7381 : 8340

% music
% 11~17 sec = 9281 : 16000

% ----------------------------------------------------------
% tic
% VideoID = 2;

% Frms = {1:660, 661:1620, 1621:2580, 2581:3540, 3541:4500, 4501:5460, ...
%     5461:6420, 6421:7380, 7381:8340, 8341:9280, 9281:18134};
% n = length(Frms);
% 
% gaborwav2 = zeros(1, 18134);
% for i = 1 : n
%     gaborwav2(Frms{i}) = getGaborVib(VideoID, Frms{i});
% end
% gaborwav2 = mapminmax(gaborwav2', -1, 1);
% gaborwav2 = gaborwav2 - mean(gaborwav2);
% save gaborwav2 gaborwav2

% vibwav = getMatchVib(VideoID, 1:18000);
% figure;
% plot(vibwav);
% 
% freq = abs(fft(vibwav));
% figure;
% plot(freq);

% toc