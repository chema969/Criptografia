%laclaveenestapracticaesrsayautentificacion
function doble = letra2numeros (texto)
if(~ischar(texto))
    %Comprobamos los datos
    disp("Lo introducido no es un texto");
    return;
end
texto=lower(texto);
alfabeto='abcdefghijklmnfopqrstuvwxyz';
alfabeto(15)=char(241);
v='';
for i=1:length(texto)
    for j=1:length(alfabeto)
        if(texto(i)==alfabeto(j))
            %Vamos transformando cada letra a un numero, si esta letra
            %tiene dos cifras, la metemos directamente, si no metemos un 0
            %extra
            if((j-1)-10<0)
                %Si es un número de una sola cifra
                v=strcat(v,'0',int2str(j-1));                
            else
                %Si este tiene dos cifras
                v=strcat(v,int2str(j-1));
            end
        end 
    end
doble=v;
end