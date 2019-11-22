function texto=descifro_permutacion (p,cifrado)
%DESCIFRO_PERMUTACION
%Funcion que descifra un texto cifrado mediante una permutacion
%Parametros:
%p: vector de numeros que debe ser una permutacion
%cifrado: Texto cifrado
    if(permutacion_v(p))
        %Si es una permutacion descifro el texto
        texto=cifro_hill (inv(matper(p)),27,cifrado);
    else
        disp("No es una permutacion");
        texto=0;
    end    
end