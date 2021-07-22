function [dX,dY]=registra(im0,im1,X0,Y0)
% Receives two images im0 im1.
% Computes the correlation around position X0,Y0
% Return displacement (dX,dY) found between im1 and im0

    % 1. Calculamos las pirámides
    L = 6;
    p0 = lap(im0,L);
    p1 = lap(im1,L);

    % 2. Definimos el radio
    R = 15;

    % 3. Determinar la posicion de partida
    X0 = round(X0/(2^(L-1)));
    Y0 = round(Y0/(2^(L-1)));

    % Inicializar X1 e Y1
    X1 = X0;
    Y1 = Y0;

    fprintf('Nivel %f\n',L);
    fprintf('X0 = %f / Y0 = %f\n',X0,Y0);
    fprintf('X1 = %f / Y1 = %f\n',X1,Y1);
        
    for k = L-1:-1:1
        % Determinar nueva posición
        X0 = 2*X0;
        Y0 = 2*Y0;
        X1 = 2*X1;
        Y1 = 2*Y1;
        % Extraer trozos
        T0 = p0{k}(Y0+(-R:R),X0+(-R:R));
        T1 = p1{k}(Y1+(-R:R),X1+(-R:R));
        % Calcular correlación
        C=imfilter(T0,T1);
        surf(C),pause
        [~,pos]=max(C(:)); [i,j]=ind2sub(size(C),pos);
        dy = i-(R+1);
        dx = j-(R+1);
        % Actualizar posicion
        X1 = X1-dx;
        Y1 = Y1-dy;
        fprintf('Nivel %f\n',k);
        fprintf('X0 = %f / Y0 = %f\n',X0,Y0);
        fprintf('X1 = %f / Y1 = %f\n',X1,Y1);
    end
    dX = X1-X0;
    dY = Y1-Y0;
    fprintf('dX = %f / dY = %f\n',dX,dY);
end