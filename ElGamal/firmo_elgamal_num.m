function [r,firmado] = firmo_elgamal_num(g, a, q, blo)
%FIRMO_ELGAMAL_NUM
%Funcion que firma un bloque de numeros con el cifrado ElGamal 
%Parametros:
%g=Número generador en base q
%a=Clave privada del cifrado
%q=Número primo que representa el modulo
%blo=Bloque de numeros a cifrar
%Salida:
%r= Número necesario para comprobar la firma
%firmado=Mensaje firmado 
if(0>g||mod(g,1)~=0||0>a||mod(a,1)~=0||0>q||mod(q,1)~=0)
    %Si los parametros no son validos
    disp('O g, o a o q no son enteros positivos');
    r=0;
    firmado=0;
    return;
end
k=randi([2,q-2]);
while(gcd(k,q-1)~=1)
    k=randi([2,q-2]);
end
k
r=potencia(g,k,q);
r=double(r);
firmado=uint64(length(blo));
[~,inv]=gcd(k,q-1);
for i=1:length(blo)
    %Cifro el mensaje
    firmado(i)=mod((blo(i)-a*r)*inv,q-1);
end
firmado=double(firmado);
end