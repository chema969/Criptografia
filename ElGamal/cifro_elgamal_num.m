function [gk,cifrado] = cifro_elgamal_num (g, n, q, blo)
%CIFRO_ELGAMAL_NUM 
%Funcion que cifra un un bloque de numeros con RSA
%Parametros:
%e=variable e de la clave publica del RSA
%n=Variable n que representa el modulo
%blo=Bloque de numeros a cifrar
if(0>q||mod(q,1)~=0||0>n||mod(n,1)~=0||0>g||mod(g,1)~=0)
    %Si los parametros no son enteros positivos
    disp('Parametros no validos');
    cifrado=0;gk=0;
    return;
end

if(not(all(mod(blo(:),1)==0)))
    %Si no todos los numeros de blo son enteros positivos
    disp('Algun elemento de blo no es entero');
    cifrado=0;gk=0;
    return;
end   
%Consigo la k
k=randi([2,q-2]);
while(gcd(k,q)~=1)
    k=randi([2,q-2]);
end

gk=potencia(g,k,q);
gak=potencia(n,k,q);
%Reservo memoria para la solucion
cifrado=uint64(length(blo));
for i=1:length(blo)
    %Cifro el mensaje
    cifrado(i)=mod(blo(i)*gak,q);
end
cifrado=double(cifrado);
gk=double(gk);
end