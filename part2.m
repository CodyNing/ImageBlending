img_1 = imread('Assets/1.2_diff3_1.png');
img_2 = imread('Assets/1.2_diff3_2.png');

level = 5;
s = size(img_1);
img_2 = imresize(img_2, s(1:2));

mask = ones(s(1:2));
mask(:, 1: s(2)/2) = 0;

pyr_1 = laplacian_pyramid(img_1, level, 7, 2);
pyr_2 = laplacian_pyramid(img_2, level, 7, 2);
pyr_mask = gaussian_pyramid(mask, level, 31, 10);

blended = pyr_mask{level, 1} .* pyr_1{level, 1} + (1 - pyr_mask{level, 1}) .* pyr_2{level, 1};
for i = level-1:-1:1
    blended = imresize(blended, size(pyr_mask{i, 1}));
    blended = blended + pyr_mask{i, 1} .* pyr_1{i, 1} + (1 - pyr_mask{i, 1}) .* pyr_2{i, 1};
end
imshow(uint8(blended))
