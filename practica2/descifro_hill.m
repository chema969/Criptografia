function texto=descifro_hill(A,m,cifrado)
%DESCIFRO_HILL
%Función que descifra un mensaje cifrado mediante la matriz A
%Parametros
%A: Matriz con la que se cifró el mensaje
%m: Modulo en el que se cifro el mensaje
%cifrado: Mensaje cifrado
%NOTA: con cifro_hill se puede hacer todo, pero por sencillez creo esta funcion   
texto=cifro_hill (inv_modulo(A,m),m,cifrado);  
end