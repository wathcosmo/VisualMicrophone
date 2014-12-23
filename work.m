%% addpath
% mexopencv
addpath('./mexopencv-master');
% mmread
addpath('./mmread');
% % textureSynth
% addpath('./textureSynth/matlabPyrTools/');
% addpath('./textureSynth/textureSynth/');
% addpath('./textureSynth/colorTextureSynth/');
% addpath('./textureSynth/matlabPyrTools/MEX');

%% main
tic;
%distractPics('01.MTS', 'pics', 151:200);

img = denoised(1, 300);




% vibwav = OFA(1:460, 'pics/m1pics(1)');  % optical flow analysis, return the vibration wave
% vibwav = [vibwav; zeros(500,1)];
% freq = abs(fft(vibwav));
toc;





