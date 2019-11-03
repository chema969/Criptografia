function cifrado=cifr_mochila (s, texto)
tamanyo=length(s);
if(~condiciones(s))
    cifrado=0;
    return;
end
if(~ischar(texto))
    cifrado=0;
    disp("No es un texto")
    return;
end
textarray=[];
for i=1:length(texto)
   %Pasamos todos los valores del texto a un array de numeros binarios
   %teniendo en cuenta que por cada caracter son ocho valores binarios
   textarray= [textarray bitget(abs(texto(i)),8:-1:1,'int8')];
end    
if(mod(length(textarray),tamanyo)~=0)
    %Si el array binario no se puede dividir en subarrays, añadimos 1
    for i=1:tamanyo-mod(length(textarray),tamanyo)
        textarray=[textarray 1];
    end
end
cifrado=[];
indice=1;
while(indice<length(textarray))
    %Mientras se puedan crear subarrays, desciframos cada subarray con la
    %mochila 
    sum=0;
    subchar=textarray(indice:indice+tamanyo-1);
    for i=1:length(subchar)
        if(subchar(i)==1)
           sum=sum+s(i);
        end
    end
 cifrado=[cifrado sum];
 indice=indice+tamanyo;
end    
