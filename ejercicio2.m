clc;
clear;

fprintf('APARTADO A\n');
im = double(imread('img1.jpg'));
figure, imshow(uint8(im)), title('original')

% Crear el filtro
S=fspecial('gaussian',11,3);
Is=imfilter(im,S,'replicate');

% Obtenemos detalle y lo reforzamos
Id=im-Is;
figure, imshow((Id)), title('Detalle')
detalle = 2.5;
reforzada = Is + detalle *Id;
% Creamos imagen compuesta
compuesta = [im(:,1:512,:),reforzada(:,513:1024,:)];
figure, imshow(uint8(compuesta)), title('Filtrado')

% Creamos el filtro
U=5;
Is=imfilter(im,S,U,'replicate');
% Obtenemos detalle
detalle = 1.5;
reforzada = Is + detalle *Id;
% Creamos imagen compuesta
compuesta = [im(:,1:512,:),reforzada(:,513:1024,:)];
figure, imshow(uint8(compuesta)), title('Filtrado con umbral')




