function [gk,desci] = cifro_elgamal (g, n, q, texto)
%CIFRO_RSA 
%Funcion que cifra un texto con RSA
%Parametros:
%e=variable e de la clave publica del RSA
%n=Variable n que representa el modulo
%texto=Texto a cifrar
if(~ischar(texto))
    %Si no es una cadena
    disp("No es una cadena");
    desci=0;gk=0;
    return;
end
numel(num2str(n))
if(0>g||mod(g,1)~=0||0>n||mod(n,1)~=0||numel(num2str(n))<=1)
    %Si los parametros no son v�lidos
    disp('O e o n no son enteros positivos');
    desci=0;gk=0;
    return;
end
%Transformamos el mensaje a una cadena de n�meros
digitos=letra2numeros(texto);
%Obtenemos el tama�o de bloque
tamanyo=numel(num2str(n))-1;
%Transformamos la cadena a n�meros de n longitud
blo=prepa_num_cifrar(tamanyo,digitos);
%Ciframos el bloque de numeros de n longitud
[gk,desci]=cifro_elgamal_num(g, n, q, blo);

end