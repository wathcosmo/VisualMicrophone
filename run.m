%distractPics('02.MTS', '02', 1:18314);

%%   ********** 请助教在这里调用程序 O(∩_∩)O *************
tic;
VideoID = 1; % for Teaching Assistant's video 
frms = 1 : 18000; % this is the number of frames to process

if length(frms) < 1500   % 0.5s single frequency, no need to divide regions
    vibwav = getGaborVib(VideoID, frms);
    f = analyse(vibwav, 1);
    disp(strcat('单频音频率为：',num2str(f),'Hz'));
    
else    % for the whole video
    vibwav = getGaborVib(VideoID, 1 : 1440);
%     vibwav = gaborwav2(1: 1440);
    regions = getRegions(vibwav);
    
    for k = 1 : 3
        vibwav = getGaborVib(VideoID, regions.single{k});
%         vibwav = gaborwav2(regions.single{k});
        f = analyse(vibwav, 1);
        disp(strcat('第',num2str(k),'个单频音频率为：',num2str(f),'Hz'));
    end
    
    for k = 1 : 3
        vibwav = getGaborVib(VideoID, regions.double{k});
%         vibwav = gaborwav2(regions.double{k});
        f = analyse(vibwav, 2);
        disp(strcat('第',num2str(k),'组双频音频率为：',num2str(f(1)),'Hz, ',num2str(f(2)), 'Hz'));
    end
    
%     vibwav = getGaborVib(VideoID, regions.music);
%     getMusic(vibwav);
end

toc;


% vibwav = gaborwav2(5461+240 : 6420-240);
% freq = abs(fft(vibwav));
% freq(1:25) = 0;
% freq(227:end) = 0;
% freq(1:end-1) = freq(2:end);
% plot(freq);

%% video01
% tic;
% VideoID = 1;
% 
% regions = getRegions(gaborwav2(1:1440)');
% 
% % gaborwav1 = getGaborVib(1, 1:18134);
% % gaborwav1 = mapminmax(gaborwav1', -1, 1);
% % gaborwav1 = gaborwav1 - mean(gaborwav1);
% % save gaborwav1 gaborwav1
% 
% toc;


%% video02
% tic
% VideoID = 2;

% gaborwav2 = getGaborVib(VideoID, 1:18134);
% gaborwav2 = mapminmax(gaborwav2', -1, 1);
% gaborwav2 = gaborwav2 - mean(gaborwav2);
% save gaborwav2 gaborwav2

% toc