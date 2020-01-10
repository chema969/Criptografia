function firma_v = verifico_firma_elgamal (r, g, n, q, firma, mensaje)
%VERIDICO_FIRMA_ELGAMAL
%Funcion que verifica si una firma viene de quien dice venir 
%Parametros:
%r=Información extraida de la firma
%g=Número generador en base q
%n=Clave publica con la que cifrar
%q=Número primo que representa el modulo
%firma=Bloque numérico que representa la firma del documento
%mensaje=Mensaje que supuestamente se corresponde la firmado
%Salida:
%firma=Valor booleano que es true si se verifica la firma
if(~ischar(mensaje))
    %Comprobamos los datos
    firma_v=false;
    disp("Lo introducido no es un texto");
    return;
end
%Transformamos el mensaje a una cadena de números
digitos=letra2numeros(mensaje);
%Obtenemos el tamaño de bloque
tamanyo=numel(num2str(q))-1;
%Transformamos la cadena a números de n longitud
blo=prepa_num_cifrar(tamanyo,digitos);
%Ciframos el bloque de numeros de n longitud
firma_v= verifico_firma_elgamal_num(r, g, n, q, firma, blo);

end