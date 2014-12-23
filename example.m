close all;
clear all;
clc;

%% addpath

% mexopencv
addpath('./mexopencv-2.4.5');
% mmread
addpath('./mmread');
% textureSynth
addpath('./textureSynth/matlabPyrTools/');
addpath('./textureSynth/textureSynth/');
addpath('./textureSynth/colorTextureSynth/');
addpath('./textureSynth/matlabPyrTools/MEX');

%% mexopencv examples

% img     =   imread('./mexopencv-2.4.5/test/cat.jpg');
% gry     =   cv.cvtColor(img, 'RGB2GRAY');
% [bin, thresh]   =   cv.threshold(gry, 'auto', 'Method', 'Binary', 'MaxValue', 255);
% edg     =   cv.Canny(gry, thresh);
% figure(9001);
% subplot(2, 2, 1);
% imshow(img);
% subplot(2, 2, 2);
% imshow(gry);
% subplot(2, 2, 3);
% imshow(bin);
% subplot(2, 2, 4);
% imshow(edg);
% figure(9002);
% imhist(gry);

%% mmread examples

[video, audio]  =   mmread('./mmread/Wildlife.wmv', [], [3, 5]);
figure(9003);
imshow(video.frames(1).cdata);
figure(9004);
subplot(1, 2, 1);
spectrogram(resample(audio.data(:, 1), 8192, audio.rate), 1024, 1020, 1024, 8192);
xlim([0, 512]);
subplot(1, 2, 2);
spectrogram(resample(audio.data(:, 2), 8192, audio.rate), 1024, 1020, 1024, 8192);
xlim([0, 512]);

%% textureSynth examples

% example1;
% example2;
% demo;
