function blo = prepa_num_cifrar (tama, bloque)
if(~ischar(bloque))
    disp("No es una cadena");
    return;
end

if(0>tama||mod(tama,1)~=0)
    disp('Tama no es un entero positivo');
    return;
end

%Si hubiera un bloque cuyo tamaño no sea tama, se le añaden 0
if(mod(length(bloque),tama)~=0)
    while(mod(length(bloque),tama)~=0)
        if(tama-mod(length(bloque),tama)>1)
            bloque=strcat(bloque,'30');
        else
            bloque=strcat(bloque,'0');
        end
    end
end
i=1;
j=1;
blo=double(length(bloque)/tama);
while(i<length(bloque))
   blo(j)=bloque(i i+tama);
   i=i+tama;
   j=j+1;
end

blo=bloque;

end