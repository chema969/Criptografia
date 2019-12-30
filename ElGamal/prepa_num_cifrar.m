function blo = prepa_num_cifrar (tama, bloque)
%PREPA_NUM_CIFRAR
%Funcion que convierte una cadena numerica en bloques de un tamaño dado,
%despues combierte estos bloques en numeros y los almacena. Se añaden '30'
%y '0' al final si es necesario
%Parametros:
%tama=Tamanyo de los bloques
%bloque=Cadena numerica a transformar
if(~ischar(bloque))
    %Si no es una cadena
    disp("No es una cadena");
    blo=0;
    return;
end

if(0>tama||mod(tama,1)~=0)
    %Si el valor de tama no es valido
    disp('Tama no es un entero positivo');
    blo=0;
    return;
end

%Si hubiera un bloque cuyo tamanyo no sea tama, se le anyaden 0 o 30
if(mod(length(bloque),tama)~=0)
    while(mod(length(bloque),tama)~=0)
        if(tama-(mod(length(bloque),tama))>1)
            %Si quedan mas de dos elementos para llegar al tamanyo de bloque
            bloque=strcat(bloque,'30');
        else
            %Si no, anyadimos un 0
            bloque=strcat(bloque,'0');
        end
        %bloque
    end
end
blo=[];
i=1;
while(i<length(bloque))
   %Por último, transformamos a numero las cadenas numericas
   blo=[blo str2num(bloque(i:i+tama-1))];

   i=i+tama;
end


end