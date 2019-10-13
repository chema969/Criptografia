function texto=descifro_permutacion (p,cifrado)
    if(permutacion_v(p))
        texto=cifro_hill (inv(matper(p)),27,cifrado);
    else
        disp("No es una permutacion");
        texto=0;
    end    
end