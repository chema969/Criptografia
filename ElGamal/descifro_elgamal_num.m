function descifro_num =descifro_elgamal_num (gk,a,q, cifrado_numero)
%DESCIFRO_ELGAMAL_NUM
%Funcion que descifra un texto encriptado en ElGamal y devuelve un bloque de numeros
%Parametros:
%gk=Valor de g elevado a k en modulo q que obtuviste en el cifrado ElGamal
%a=Clave privada del cifrado
%q=Número primo que representa el modulo
%cifrado_numero=Bloque de numeros a descifrar
%Salida:
%descifro_num=Bloque de números que representa el texto descifrado
if(0>gk||mod(gk,1)~=0||0>a||mod(a,1)~=0||0>q||mod(q,1)~=0)
    %Si los parametros no son validos
    disp('Ni n ni d son enteros positivos');
    descifro_num=0;
    return;
end
%Reservamos memoria para la solucion

gka=potencia(gk,a,q);
gka=double(gka);

[~,inv]=gcd(gka,q);
descifro_num=zeros(1,length(cifrado_numero));
for i=1:length(cifrado_numero)
    %Cada solucion es la potencia del numero cifrado elevado a d modulo n
   descifro_num(i)=mod(cifrado_numero(i)*inv,q);
end

end