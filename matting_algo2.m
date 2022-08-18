function [res, mask] = matting_algo2(img, bg, down_thres, up_thres)

    img = double(img);
    bg = double(bg);

    thres_diff = up_thres - down_thres;

    s = size(bg);
    h = s(1);
    w = s(2);
    mask = double(zeros(h, w));

    for i = 1:h
        for j = 1:w
            is_object = 0;
            is_bg = 1;
            dis_mean = 0;
            for k = 1:3
                dis = double(abs(img(i, j, k) - bg(i, j, k)));
                is_object = is_object || dis > up_thres;
                is_bg = is_bg && dis < down_thres;
                if dis < down_thres
                    dis = down_thres;
                end
                dis_mean = dis_mean + (dis - down_thres) / 3;
            end
            if is_object
                mask(i, j) = 1;
            elseif is_bg
                mask(i, j) = 0;
            else
                mask(i, j) = dis_mean / thres_diff;
            end
        end
    end
    mask = repmat(mask, 1, 1, 3); 
    res = mask.* img;
    
end