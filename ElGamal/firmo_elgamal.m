function [r,firmado] = firmo_elgamal (g, n, a, q, texto)
%Transformamos el mensaje a una cadena de números
digitos=letra2numeros(texto);
%Obtenemos el tamaño de bloque
tamanyo=numel(num2str(n))-1;
%Transformamos la cadena a números de n longitud
blo=prepa_num_cifrar(tamanyo,digitos);
%Ciframos el bloque de numeros de n longitud
[r,firmado]=firmo_elgamal_num(g, a, q, blo);

end