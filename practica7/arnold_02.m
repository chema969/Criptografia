function potencia = arnold_02 (foto, A)
%ARNOLD_02
%Función que desordena una imagen n veces con Arnold o hasta que vuelva
%a la imagen original y retorna el numero de veces que se ha desordenado
%Parametros:
% foto: Imagen cuadrada
% A: Matriz cuadrada de orden 2 invertible entre la longitud de la imagen

%Leo la imagen
fotograf=imread(foto);
 if(length(fotograf)~=length(fotograf(:,1)))
     %Si la matriz no es cuadrada, retorno 0 y un mensaje de error
     disp('la foto no es cuadrada');
     return;
 end
 if(length(A)~=2||length(A(:,1))~=2||not(all(mod(A(:),1) == 0)))
     disp('la matriz A no es cuadrada o de orden 2');
     return;
 end
 modulo=length(fotograf); 
if(not(ismatrix(inv_modulo(A,modulo))))
    %Si la matriz no tiene inversa
    disp('la matriz A no es invertible');
    return;
end  
aux=input('introduce 1 si quieres desordenar la imagen hasta volver a la original, o 2 si quieres desordenarla hasta una determinada potencia:');
switch aux
    case 1
        %Si queremos hacerlo hasta que volvamos a la imagen original
        potencia=pote(A,modulo);
    case 2
        %Si queremos hacer n transformaciones
        potencia=input('¿cuántas transformaciones quieres hacer?');
    otherwise
        disp('Valor no valido')
        potencia=0;
        return;
end
if(potencia<=0)
    %Si incluimos un valor no valido, retornamos
     disp('Valor no valido')
    return;
end
%Desordenamos la imagen
desorden_pixel(fotograf,A)
matriz = getappdata (gcf, 'matriz');
%Mostramos la imagen
imshow(matriz);
if(1~=potencia)
    %Si queremos desordenar más de una vez, cerramos esta pestaña 
    pause(1)
    close 
end
for i=2:potencia
      %Desordenamos la imagen anteriormente desordenada
      desorden_pixel(matriz,A)
      matriz = getappdata (gcf, 'matriz');
      %Mostramos la imagen
      imshow(matriz);
      if(i~=potencia)
       %Si no es la potencia que buscamos, la cerramos
        pause(1)
        close 
      end
end

end