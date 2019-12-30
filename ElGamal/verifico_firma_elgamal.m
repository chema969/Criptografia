function firma = verifico_firma_elgamal (gk, g, n, q, firma, mensaje)
%Transformamos el mensaje a una cadena de n�meros
digitos=letra2numeros(mensaje);
%Obtenemos el tama�o de bloque
tamanyo=numel(num2str(n))-1;
%Transformamos la cadena a n�meros de n longitud
blo=prepa_num_cifrar(tamanyo,digitos);
%Ciframos el bloque de numeros de n longitud
firma= verifico_firma_elgamal_num(gk, g, n, q, firma, blo);

end