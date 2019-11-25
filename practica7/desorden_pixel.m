function desorden_pixel (foto, A)
%DESORDEN_PIXEL
%Funcion que desordena los pixeles utilizando la matriz A
%Parametros:
% foto: Imagen cuadrada
% A: Matriz cuadrada de orden 2 invertible entre la longitud de la imagen

 if(length(foto)~=length(foto(:,1)))
     %Si la matriz no es cuadrada, retorno 0 y un mensaje de error
     disp('la foto no es cuadrada');
     return;
 end
 if(length(A)~=2||length(A(:,1))~=2||not(all(mod(A(:),1) == 0)))
     %Si la matriz A no es cuadrada
     disp('la matriz A no es cuadrada, entera o de orden 2');
     return;
 end
 
%El modulo será la longitud de la foto
modulo=length(foto); 
if(not(ismatrix(inv_modulo(A,modulo))))
    %Si la matriz no tiene inversa
    disp('la matriz A no es invertible');
    return;
end    
%Creamos la matriz de la solución
matriz=zeros(modulo,modulo,size(foto,3));
for i=1:modulo
    %Por cada fila
    for j=1:modulo
        %Por cada columna
        nuevolug=mod(A*[i;j],modulo);
        if(nuevolug(1)==0)
            %Si es 0, lo pasamos al equivalente, osea, el modulo
            nuevolug(1)=modulo;
        end
        if(nuevolug(2)==0)
            %Si es 0, lo pasamos al equivalente, osea, el modulo
            nuevolug(2)=modulo;
        end
        %Metemos en la matriz de la solucion el bit cambiado de sitio
        matriz(nuevolug(1),nuevolug(2),:)=foto(i,j,:);        
    end
end   
%Pasamos a uint8 la matriz
matriz=uint8(matriz);
%Guardamos la solución
setappdata(gcf, 'matriz', matriz)
end