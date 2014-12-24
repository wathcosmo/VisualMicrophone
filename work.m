%% addpath
% mexopencv
% addpath('./mexopencv-master');
% mmread
% addpath('./mmread');
% % textureSynth
% addpath('./textureSynth/matlabPyrTools/');
% addpath('./textureSynth/textureSynth/');
% addpath('./textureSynth/colorTextureSynth/');
% addpath('./textureSynth/matlabPyrTools/MEX');

%% main
tic;
distractPics('02.MTS', '02', 1:10);
% [img, bg] = denoised(1, 300);

% vibwav = getVib(1, 6521:7480);
% freq1 = abs(fft(vibwav(:,1)));
% freq2 = abs(fft(vibwav(:,2)));






% vibwav = OFA(1, 1:460);  % optical flow analysis, return the vibration wave
% vibwav = [vibwav; zeros(500,1)];
% freq = abs(fft(vibwav));
toc;





