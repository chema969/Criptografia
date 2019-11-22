function inver=inv_modulo (A, m)
%INV_MODULO
%Funcion que consigue la inversa de una matriz cuadrada en modulo m
%Parametros:
% A: Matriz cuadrada
% m: Modulo
 if(length(A)~=length(A(:,1)))
     %Si la matriz no es cuadrada, retorno 0 y un mensaje de error
     disp('la matriz no es cuadrada');
     inver=0;
 else
   if(not(all(mod(A(:),1) == 0))||mod(m,1)~=0)
       %Si o el modulo o la matriz no es de enteros.
       disp('la matriz no es de enteros o m no es entero');
       inver=0;    
   else
       %Realizamos el modulo por si acaso la matriz tuviera valores más
       %altos que m
       A=mod(A,m);
       %Conseguimos el determinante de la matriz A
       determinante=det(A);
       %Vemos si el determinante tiene inversa en este módulo
       [mcd,invers]=gcd(int32(determinante),m);
       if(mcd~=1||determinante==0)
           %Si no tiene inversa el determinante en el módulo o es 0.
          disp('la matriz no es inversible en este modulo');
          inver=0;
       else
           %Calculamos la inversa como la matriz adjunta transpuesta por la
           %inversa del determinante en modulo m.
           inver=mod(int32(inv(A)*determinante)*invers,m);
       end
   end
 end
 %Transformamos la matriz al tipo double para evitar problemas.
 inver=double(inver);
 
 
 end