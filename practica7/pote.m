function n = pote (A, m)
%POTE
%Función que debe calcular el mínimo valor del exponente de la potencia de 
%A que módulo m es igual a la matriz identidad
%Parametros:
% A: Matriz cuadrada de orden 2 
% m: Modulo

if(length(A)~=2||length(A(:,1))~=2||not(all(mod(A(:),1) == 0)))
     disp('la matriz A no es cuadrada, entera o de orden 2');
     return;
end
if(mod(m,1)~=0||m<=0)
    disp('m no tiene un valor valido');
    return;
end
%Declaramos la matriz identidad
I=[1,0;0,1];
aux=A;
for i=1:power(m,4)
   if(I==aux)
       %Si es la matriz buscada, retornamos
       n=i;
       return;
   end
   %Mientras no encontremos la matriz identidad, seguimos elevando
   aux=mod(aux*A,m);

end
n=0;
end