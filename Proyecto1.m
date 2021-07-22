clc;
clear;

% Cargamos las imagenes
im0 = im2double(imread('gato0.jpg'));
im1 = im2double(imread('gato1.jpg'));

% Crear el filtro
S=fspecial('gaussian',9,2);

% Obtenemos detalle im0
Is=imfilter(im0,S,'replicate');
det0=im0-Is;

% Obtenemos detalle im1
Is=imfilter(im1,S,'replicate');
det1=im1-Is;

% Extraemos subimagen de det0 y det1
OY=90; OX=300; R=10;
T0=det0(OY+(-R:R),OX+(-R:R));
T1=det1(OY+(-R:R),OX+(-R:R));

% Calculamos correlación
C=imfilter(T0,T1);

%Pintamos correlación en superficie 2D
figure,surf(C),title('Correlación')

% Calculamos dx & dy
[M,pos]=max(C(:)); [i,j]=ind2sub(size(C),pos);
% i = 35;
% j = 13;
dy = i-(R+1);
dx = j-(R+1);
fprintf('dy = %f\ndx = %f\n',dy,dx); 
