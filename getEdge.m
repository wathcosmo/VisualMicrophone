function imgout = getEdge(img)
%GETEDGE get the edge of the object
% img's format is one channel uint8
    imth = img > 70;
    imth = bwareaopen(1 - imth, 10000);
    imth = 1 - imth;
    imgout = edge(imth, 'canny');
end