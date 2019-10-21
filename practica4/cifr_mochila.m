function cifrado=cifr_mochila (s, texto)
tamanyo=length(s);
if(~condiciones(s))
    cifrado=0;
    return;
end
textarray=[];
for i=1:length(texto)
   textarray= [textarray bitget(abs(texto(i)),8:-1:1,'int8')];
end    
if(mod(length(textarray),tamanyo)~=0)
    for i=1:tamanyo-mod(length(textarray),tamanyo)
        textarray=[textarray 1];
    end
end
cifrado=[];
indice=1;
while(indice<length(textarray))
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
