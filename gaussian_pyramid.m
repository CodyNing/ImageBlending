function gausPyr = gaussian_pyramid(img, level, ksize, sigma)
    img = double(img);
    
    kernel = fspecial('gaussian', ksize, sigma);

    gausPyr = cell(level, 1);
    
    gausPyr{1, 1} = img;
    
    for i = 2:level
        lp = imfilter(img, kernel);
        ds = lp(1:2:end, 1:2:end, :);
        gausPyr{i, 1} = ds;
        img = ds;
    end
end