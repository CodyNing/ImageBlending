function lapPyr = laplacian_pyramid(img, level, ksize, sigma)
    
    img = double(img);
    gausPyr = gaussian_pyramid(img, level, ksize, sigma);
    
    lapPyr = cell(level, 1);
    s = size(img);
    
    for i = 2:level
        ds = gausPyr{i, 1};
        
        us = imresize(ds, s(1:2));
        diff = img - us;
        
        lapPyr{i - 1, 1} = diff;
        img = ds;
        s = size(img);
    end
    lapPyr{level, 1} = img;
end