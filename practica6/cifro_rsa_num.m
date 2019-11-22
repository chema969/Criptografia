function cifrado = cifro_rsa_num (e, n, blo)
%CIFRO_RSA_NUM 
%Funcion que cifra un un bloque de numeros con RSA
%Parametros:
%e=variable e de la clave publica del RSA
%n=Variable n que representa el modulo
%blo=Bloque de numeros a cifrar
if(0>e||mod(e,1)~=0||0>n||mod(n,1)~=0)
    %Si los parametros no son enteros positivos
    disp('Parametros no validos');
    cifrado=0;
    return;
end

if(not(all(mod(blo(:),1)==0)))
    %Si no todos los numeros de blo son enteros positivos
    disp('Algun elemento de blo no es entero');
    cifrado=0;
    return;
end   
%Reservo memoria para la solucion
cifrado=uint64(length(blo));
for i=1:length(blo)
    %
    cifrado(i)=potencia(blo(i),e,n);
end

end