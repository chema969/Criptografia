function blo = prepa_num_cifrar (tama, bloque)
if(~ischar(bloque))
    disp("No es una cadena");
    blo=0;
    return;
end

if(0>tama||mod(tama,1)~=0)
    disp('Tama no es un entero positivo');
    blo=0;
    return;
end

%Si hubiera un bloque cuyo tamaño no sea tama, se le añaden 0 o 30
if(mod(length(bloque),tama)~=0)
    while(mod(length(bloque),tama)~=0)
        if(tama-(mod(length(bloque),tama))>1)
            %Si quedan más de dos elementos para llegar al tamaño de bloque
            bloque=strcat(bloque,'30');
        else
            %Si no, añadimos un 0
            bloque=strcat(bloque,'0');
        end
        %bloque
    end
end
blo=[];
i=1;
while(i<length(bloque))
   blo=[blo str2num(bloque(i:i+tama-1))];

   i=i+tama;
end


end