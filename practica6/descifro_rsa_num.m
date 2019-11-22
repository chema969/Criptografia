function descifro_num =descifro_rsa_num (d, n, cifrado_numero)
%DESCIFRO_RSA
%Funcion que descifra un texto encriptado en RSA y devuelve un bloque de numeros
%Parametros:
%d=variable d de la clave privada del RSA
%n=Variable n que representa el modulo
%cifrado_numero=Bloque de numeros a descifrar
if(0>n||mod(n,1)~=0||0>d||mod(d,1)~=0)
    %Si los parametros no son validos
    disp('Ni n ni d son enteros positivos');
    descifro_num=0;
    return;
end
%Reservamos memoria para la solucion
descifro_num=uint64(length(cifrado_numero));
for i=1:length(cifrado_numero)
    %Cada solucion es la potencia del numero cifrado elevado a d modulo n
   descifro_num(i)=potencia(cifrado_numero(i),d,n);
end


end