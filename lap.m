function p=lap(im,F)
    N = 3;
    im=im2double(im);
    p=cell(1,N);

    % Hacemos bucle
    for k = 1:N-1
        red=imresize(im,1/F);
        im2 = imresize(red,F);
        p{k}=im-im2;
        im = red;
    end
    p{N}=red;
return