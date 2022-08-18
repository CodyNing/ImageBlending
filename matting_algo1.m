function [res, mask] = matting_algo1(img, rgb, thres)
    s = size(img);
    h = s(1);
    w = s(2);
    mask = uint8(zeros(h, w));

    for i = 1:h
        for j = 1:w
            keep = 1;
            for k = 1:3
                keep = keep && (img(i, j, k) > rgb(k) - thres && img(i, j, k) < rgb(k) + thres);
            end
            mask(i, j) = uint8(~keep);
        end
    end
    mask = repmat(mask, 1, 1, 3); 
    res = mask.* img;
end