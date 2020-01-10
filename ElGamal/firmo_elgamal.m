function [r,firmado] = firmo_elgamal (g, a, q, texto)
%FIRMO_ELGAMAL
%Funcion que firma un texto con el cifrado ElGamal 
%Parametros:
%g=Número generador en base q
%a=Clave privada del cifrado
%q=Número primo que representa el modulo
%texto=Texto a cifrar
%Salida:
%r= Número necesario para comprobar la firma
%firmado=Mensaje firmado 
if(~ischar(texto))
    %Comprobamos los datos
    r=0;firmado=0;
    disp("Lo introducido no es un texto");
    return;
end
%Transformamos el mensaje a una cadena de números
digitos=letra2numeros(texto);
%Obtenemos el tamaño de bloque
tamanyo=numel(num2str(q))-1;
%Transformamos la cadena a números de n longitud
blo=prepa_num_cifrar(tamanyo,digitos);
%Firmamos el bloque de numeros
[r,firmado]=firmo_elgamal_num(g, a, q, blo);

end