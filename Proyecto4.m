clc;
clear;

G = im2double(imread('movida.png'));
% figure,imshow(G),title('G')

% Añadir ruido
% G=G+0.02*randn(size(G));

load('K.mat')
% K=imresize(K,[17 17]); K=K/sum(K(:));
% figure;imagesc(K); colormap(gray(255));

n = (size(K,1)-1)/2;

% Replicamos filas
Filas=zeros(size(G,1)+(2*n),size(G,2),3);
Filas(n+1:end-n,:,:)=G(:,:,:);
for k = 1:n
    Filas(k,:,:)=G(1,:,:);
    Filas(end-k+1,:,:)=G(end,:,:);
end
% figure,imshow(Filas),title('Filas')

% Replicamos columnas
F=zeros(size(Filas,1),size(Filas,2)+(2*n),3);
F(:,n+1:end-n,:)=Filas(:,:,:);
for k = 1:n
    F(:,k,:)=Filas(:,1,:);
    F(:,end-k+1,:)=Filas(:,end,:);
end
% figure,imshow(F),title('F')

IT = 300;
mediaDF = zeros(IT);
mediaDG = zeros(IT);
for k = 1:IT
   GG = imfilter(F,K);
   GG = GG(n+1:end-n,n+1:end-n,:);
   dG = (G-GG);
   K=flipud(fliplr(K));
   dF = imfilter(dG,K,'full','replicate');
   % Guardamos medias
   mediaDF(k) = mean(abs(dF(:)));
   mediaDG(k) = mean(abs(dG(:)));
   F = F + dF;
   F(F<0)=0;
   F(F>1)=1;
end
figure,imshow(F),title('F')
figure,hold on,
semilogy(mediaDF,'g'),semilogy(mediaDG,'r'),title('dF(Verde) vs dG(Rojo)')
