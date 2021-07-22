clc;
clear;

fprintf('APARTADO A\n');
% Cargar y mostrar original
im = imread('brick.jpg');
figure, imshow(im), title('Original')
% Submuestro con factor 4
sub = im(1:4:end,1:4:end,:);
figure, imshow(sub), title('Submuestreo con factor 4')

% Crear el filtro
S=fspecial('gaussian',7,2);
suma = sum(S(:));
im = imfilter(im,S,'replicate');
figure, imshow(im), title('Filtrada')
% Submuestro con factor 4
sub = im(1:4:end,1:4:end,:);
figure, imshow(sub), title('Submuestreo de la filtrada')

% Alternativa
F = 4;
sub=imresize(im,1/F);

fprintf('APARTADO B\n');
% Crear imagen color
org=rand(400,600,3);
figure, imshow(org), title('Original')

% Aplicamos filtro
im1= org;
im1(:,:,1) = imfilter(org(:,:,1),S,'replicate');
im2 = org;
im2(:,:,2) = imfilter(org(:,:,2),S,'replicate');
im3 = org;
im3(:,:,3) = imfilter(org(:,:,3),S,'replicate');
figure, imshow(im1), title('im1 filtrada')
figure, imshow(im2), title('im2 filtrada')
figure, imshow(im3), title('im3 filtrada')


