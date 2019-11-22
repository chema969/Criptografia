function cifrado=cifro_permutacion (p,texto)
%CIFRO_PERMUTACION
%Función que cifra un mensaje mediante cifrado hill con una permutacion
%Parametros
%p: Vector que debe representar una permutacion
%texto: Texto a cifrar
    if(permutacion_v(p))
        %Si es una permutación, ciframos con la matriz de la permutacion
        cifrado=cifro_hill (matper(p),27,texto);
    else
        disp("No es una permutacion");
        cifrado=0;
    end    
end