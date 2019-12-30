function generador = genera (g, p)
if(mod(p,1)~=0||mod(g,1)~=0)
   %Si uno de los elementos no es entero, retornamos 0
   disp('Los elementos g o p no son enteros');
   generador=0;
   return;
end
if(mod(g,p)==0||mod(g,p)==1||not(isprime(p)))
    %Si p no es primo o g es 0 o 1 modulo p, retornamos 0
   generador=0;
   return;
end
%Creamos un vector con los factores únicos de p-1
aux=unique(factor(p-1));
for i=1:length(aux)
    %Por cada elemento del vector de factores, si encontramos un elemento
    %que al aplicar g^((p-1)/f) mod p sea 1, no es un generador.
    if(potencia(g,(p-1)/aux(i),p)==1)
        generador=0;
        return;
    end
end   
%Si logra llegar aquí, significa que sí es un generador
generador=g;
end