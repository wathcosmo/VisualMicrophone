function regions = getRegions(vibwav)
%GETREGIONS divide the video into 3 single frequency, 3 double frequency and
%1 music regions
%   regions = getRegions(videoID)

   vibwav = mapminmax(vibwav', -1, 1);
   vibwav = vibwav - mean(vibwav);
   for k = 3 : 1438
       if max(vibwav(k-2:k+2)) < 0.3
           div = k;
           break;
       end
   end
   
   regions.single = {div+961 : div+960*2, div+960*2+1 : div+960*3, ...
       div+960*3+1 : div+960*4};
   regions.double = {div+960*5+1 : div+960*6, div+960*6+1 : div+960*7, ...
       div+960*7+1 : div+960*8};
   regions.music = div+960*8+1 : div+960*15;
end

