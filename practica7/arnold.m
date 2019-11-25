function arnold (foto, A)
%ARNOLD
%Función que desordena u ordena una imagen con Arnold
%Parametros:
% foto: Imagen cuadrada
% A: Matriz cuadrada de orden 2 invertible entre la longitud de la imagen

%Leo la imagen
fotograf=imread(foto);
 if(length(fotograf)~=length(fotograf(:,1)))
     %Si la fotografia no es cuadrada, retorno 0 y un mensaje de error
     disp('la foto no es cuadrada');
     return;
 end
 if(length(A)~=2||length(A(:,1))~=2||not(all(mod(A(:),1) == 0)))
     %Si la matriz A no es valida
     disp('la matriz A no es cuadrada, entera o de orden 2');
     return;
 end
 modulo=length(fotograf); 
if(not(ismatrix(inv_modulo(A,modulo))))
    %Si la matriz no tiene inversa
    disp('la matriz A no es invertible');
    return;
end  

aux=input('Introduce un 1 si quieres desordenar, o un 2 si quieres ordenar: ');
switch aux
    case 1
        %Si quiero desordenar la matriz
        desorden_pixel(fotograf,A)
        matriz = getappdata (gcf, 'matriz');
        imshow(matriz);
    case 2
        %Si quiero ordenar la matriz (Con la inversa
        desorden_pixel(fotograf,inv_modulo(A,modulo));
        matriz = getappdata (gcf, 'matriz');
        imshow(matriz);
    otherwise
        disp('Valor no valido')
end


end