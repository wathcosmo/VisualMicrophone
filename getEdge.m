function imgout = getEdge(img)
    imth = img > 70;
    imth = bwareaopen(1 - imth, 10000);
    imth = 1 - imth;
    imgout = edge(imth, 'canny');
end