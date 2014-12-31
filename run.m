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

tic;

vibwav = getGaborVib(1, 9441:16160);
freq = abs(fft(vibwav));
imshow(freq);
    
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
% 11~17 sec = 9280 : 16000

% tic

% vibwav = getMatchVib(2, 1:18000);
% figure;
% plot(vibwav);
% 
% freq = abs(fft(vibwav));
% figure;
% plot(freq);

% toc