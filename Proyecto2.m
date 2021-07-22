clc;
clear;

im = imread('img1.jpg');
N = 3;
p = lap(im,N);
ver_lap(p)
rec = invlap(p);
figure,imshow(rec),title('invlap N = 3');
dif=double(im)-double(rec);
fprintf('dif(3) = %f, %f\n',max(dif(:)), min(dif(:)));

im = imread('img1.jpg');
N = 6;
p = lap(im,N);
ver_lap(p);
rec = invlap(p);
figure,imshow(rec),title('invlap N = 6');
dif=double(im)-double(rec);
fprintf('dif(6) = %f, %f\n',max(dif(:)), min(dif(:)));