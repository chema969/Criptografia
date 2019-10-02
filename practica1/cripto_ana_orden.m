function [frecuencia, freordenada]=cripto_ana_orden(v)
frecuencia=zeros(2,27);
alfabeto='abcdefghijklmnfopqrstuvwxyz';
alfabeto(15)=char(241);
letranumero(v);
for j=1:length(alfabeto) 
    frecuencia(2,j)=j-1;
end
for i=1:length(v)
    for j=1:length(alfabeto) 
         if(v(i)==alfabeto(j))
            frecuencia(1,j)=frecuencia(1,j)+1;
        end 
    end
end
frecuencia(1,:)=frecuencia(1,:)/length(v);
freordenada=transpose(frecuencia);
freordenada=transpose(sortrows(freordenada,'descend'));
end