function firma_v = verifico_firma_elgamal (r, g, n, q, firma, mensaje)
%VERIDICO_FIRMA_ELGAMAL
%Funcion que verifica si una firma viene de quien dice venir 
%Parametros:
%r=Informaci�n extraida de la firma
%g=N�mero generador en base q
%n=Clave publica con la que cifrar
%q=N�mero primo que representa el modulo
%firma=Bloque num�rico que representa la firma del documento
%mensaje=Mensaje que supuestamente se corresponde la firmado
%Salida:
%firma=Valor booleano que es true si se verifica la firma
if(~ischar(mensaje))
    %Comprobamos los datos
    firma_v=false;
    disp("Lo introducido no es un texto");
    return;
end
%Transformamos el mensaje a una cadena de n�meros
digitos=letra2numeros(mensaje);
%Obtenemos el tama�o de bloque
tamanyo=numel(num2str(q))-1;
%Transformamos la cadena a n�meros de n longitud
blo=prepa_num_cifrar(tamanyo,digitos);
%Ciframos el bloque de numeros de n longitud
firma_v= verifico_firma_elgamal_num(r, g, n, q, firma, blo);

end