function [frecuencia, freordenada]=cripto_ana_orden(v)
%CRIPTO_ANA_ORDEN
%Devuelve tanto la frecuencia de las letras del texto como la del espanyol
%Parametros:
%v: Texto
if(~ischar(v))
    %Si no introducimos un texto
    disp("Lo introducido no es un texto");
    return;
end
%Reservamos espacio para frecuencia
frecuencia=zeros(2,27);

%Definimos el alfabeto en castellano
alfabeto='abcdefghijklmnfopqrstuvwxyz';
%Definimos la ñ
alfabeto(15)=char(241);
for j=1:length(alfabeto)
    %Introducimos los valores desde el 0 hasta el 26
    frecuencia(2,j)=j-1;
end

for i=1:length(v)
    %Para cada valor de v
    for j=1:length(alfabeto) 
         if(v(i)==alfabeto(j))
            %Calculamos el ratio de aparición de cada uno de los valores
            frecuencia(1,j)=frecuencia(1,j)+1;
        end 
    end
end
%Lo ponemos en forma de porcentaje de aparición
frecuencia(1,:)=frecuencia(1,:)/length(v);
freordenada=transpose(frecuencia);
%Ordenamos frecuencia para obtener freordenanda
freordenada=transpose(sortrows(freordenada,'descend'));
end