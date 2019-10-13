function cifrado=cifro_permutacion (p,texto)
    if(permutacion_v(p))
        cifrado=cifro_hill (matper(p),27,texto);
    else
        disp("No es una permutacion");
        cifrado=0;
    end    
end