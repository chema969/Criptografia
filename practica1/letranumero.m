function v=letranumero(texto)
if(~ischar(texto))
    %Si no es un texto
    disp("No es un texto");
    return;
end
%Pasamos a min�scula el texto
texto=lower(texto);
%Definimos en orden el alfabeto en espa�ol
alfabeto='abcdefghijklmnfopqrstuvwxyz';
%Introducimos la �
alfabeto(15)=char(241);
v=zeros(1,0);
for i=1:length(texto)
    for j=1:length(alfabeto)
        if(texto(i)==alfabeto(j))
            %Vamos transformando cada letra a un numero
            v=[v,j-1];
        end 
    end
end