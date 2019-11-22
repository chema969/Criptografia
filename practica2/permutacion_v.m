function permuta=permutacion_v (p)
%PERMUTACION
%Funcion que calcula si un vector de numeros es una permutacio
%Parametros:
%p: vector de numeros
aux=length(p);
%Vamos buscando cada numero desde 1 hasta la longitud de p
for i=1:aux
    is_in=false;
    for j=1:aux
       if(p(j)==i)
           %Si lo encuentra, para el bucle for y pasas al siguiente numero
           is_in=true;
           break;
       end           
    end
   if(~is_in)
     %Si hay un numero que no encuentra retorna false
     permuta=false;
     return;
   end
end
%Si ha encontrado todos los numeros retorna true
permuta=true;
end