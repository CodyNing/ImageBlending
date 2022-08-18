img_bg = imread('Assets/1.1_bg.png'); 
img_d = imread('Assets/1.1_diff1.png');
img_s = imread('Assets/1.1_scene1.png');
down_threshold = 30.0;
up_threshold = 50.0;
bg_color = [230, 230, 210];
color_threshold = 40;

figure

[res, mask] = matting_algo1(img_d, bg_color, color_threshold);
imshow(uint8(res))
figure
res = compose(img_d, img_s, mask);

imshow(res)

figure

[res, mask] = matting_algo2(img_d, img_bg, down_threshold, up_threshold);
imshow(uint8(res))
figure
res = compose(img_d, img_s, mask);

imshow(res)