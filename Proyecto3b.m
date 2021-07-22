clc;
clear;

im = imread('multiplex2.jpg');
figure,imshow(im), title('Original')

B=im(1:1600,1:1792);
G=im(1601:3200,1:1792);
R=im(3201:end,1:1792);

CX=896; CY=800;
rx = CX+(-800:800); ry = CY+(-700:700);
im2 = uint8(zeros(1401,1601,3));
im2(:,:,1) = R(ry,rx);
im2(:,:,2) = G(ry,rx);
im2(:,:,3) = B(ry,rx);

[dXr,dYr]=registra(G,R,CX,CY);
[dXb,dYb]=registra(G,B,CX,CY);
im2(:,:,1) = R(ry+dYr,rx+dXr);
im2(:,:,3) = B(ry+dYb,rx+dXb);
figure,imshow(im2), title('Alineación automatica')

