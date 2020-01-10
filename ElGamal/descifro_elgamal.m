function descifrado = descifro_elgamal (gk,a,q, cifrado_numero)
%DESCIFRO_ELGAMAL
%Funcion que descifra un texto encriptado en ElGamal y pasa a caracteres
%Parametros:
%gk=Valor de g elevado a k en modulo q que obtuviste en el cifrado ElGamal
%a=Clave privada del cifrado
%q=Número primo que representa el modulo
%cifrado_numero=Bloque de numeros a descifrar
%Salida:
%descifrado=Mensaje descifrado

%Lo primero que hacemos es llamar a la función que hace un descifrado de
%bloques numericos con d y n
descifrado=descifro_elgamal_num(gk,a,q,cifrado_numero);
%Tras esto, llamamos a la función que pasa a texto el bloque descifrado.
descifrado=num_descifra(q,descifrado);
end 