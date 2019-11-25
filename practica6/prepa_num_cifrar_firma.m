function blo = prepa_num_cifrar_firma (tamanyosbloquesfirma, bloque)
%PREPA_NUM_CIFRAR_FIRMA
%Función que transforma un mensaje de 
%Parametros:
%tama=Tamanyo de los bloques
%bloque=Cadena numerica a transformar
if(~ischar(bloque))
    %Si no es una cadena
    disp("No es una cadena");
    blo=0;
    return;
end
i=1;
blo=[];

for j=1:length(tamanyosbloquesfirma)
    if(tamanyosbloquesfirma(j)==0)
        blo=[blo 0];
    else
        while(bloque(i)=='0')
            i=i+1;
        end
        blo=[blo str2num(bloque(i:i+tamanyosbloquesfirma(j)-1))];
        i=i+tamanyosbloquesfirma(j);
    end
end


end