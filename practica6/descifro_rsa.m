function descifrado = descifro_rsa (d, n, cifrado_numero)
%DESCIFRO_RSA
%Funcion que descifra un texto encriptado en RSA y devuelve un texto claro
%Parametros:
%d=variable d de la clave privada del RSA
%n=Variable n que representa el modulo
%cifrado_numero=Bloque de numeros a descifrar

%Lo primero que hacemos es llamar a la función que hace un descifrado de
%bloques numericos con d y n
descifrado=descifro_rsa_num(d,n,cifrado_numero);
%Tras esto, llamamos a la función que pasa a texto el bloque descifrado.
descifrado=num_descifra(n,descifrado);
end 