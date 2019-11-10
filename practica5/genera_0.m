function generador = genera_0 (g, p)
%Iniciamos el contador de tiempo
tic;
if(mod(p,1)~=0||mod(g,1)~=0)
    %Si uno de los elementos no es entero, retornamos 0
   disp('Los elementos g o p no son enteros');
   generador=0;
   return;
end
if(mod(g,p)==0||mod(g,p)==1||not(isprime(p)))
   %Si p no es primo o g es 0 o 1 modulo p, retornamos
   generador=0;
   return;
end
i=1;
aux=mod(g,p);
%aux representa el primer elemento generador
while(aux~=1)
    %Mientras no encontremos el uno, aux=aux*g mod p
    aux=mod(aux*g,p);
    i=i+1;
end
if(i==(p-1))
    %Si ha encontrado el elemento 1 en la iteración p-1, es generador
    generador=g;
else
    %Si no, no es generador
    generador=0;
end
%Mensaje del tiempo que ha pasado
tElapsed = toc;
mensajeTiempo=['Time elapsed=',num2str(tElapsed)];
disp(mensajeTiempo);

end