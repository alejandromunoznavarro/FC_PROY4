clc;
clear;

im = imread('multiplex.jpg');
figure,imshow(im), title('Original')

% 1. Dividir imagen
B=im(1:1600,1:1792);
G=im(1601:3200,1:1792);
R=im(3201:end,1:1792);
% figure,imshow(R), title('R')
% figure,imshow(G), title('G')
% figure,imshow(B), title('B')

%2. Eliminar bordes
CX=896; CY=800;
rx = CX+(-800:800); ry = CY+(-700:700);
im2 = uint8(zeros(1401,1601,3));
im2(:,:,1) = R(ry,rx);
im2(:,:,2) = G(ry,rx);
im2(:,:,3) = B(ry,rx);
figure,imshow(im2), title('Color')

%Alineación manual
fprintf('Parte A\n');
figure,imshow(im2(:,:,1)), title('R')
figure,imshow(im2(:,:,2)), title('G')
figure,imshow(im2(:,:,3)), title('B')

Xb=1370;
Yb=638;
Xg=1368;
Yg=618;
Xr=1371;
Yr=592;

dXr=Xr-Xg;
dYr=Yr-Yg;
dXb=Xb-Xg;
dYb=Yb-Yg;
fprintf('dXr = %f\n',dXr);
fprintf('dYr = %f\n',dYr);
fprintf('dXb = %f\n',dXb);
fprintf('dYb = %f\n',dYb);

im2(:,:,1) = R(ry+dYr,rx+dXr);
im2(:,:,3) = B(ry+dYb,rx+dXb);
figure,imshow(im2), title('Alineación manual')



