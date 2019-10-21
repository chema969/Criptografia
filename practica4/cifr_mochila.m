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
if(mod(length(textarray,tamanyo)~0)
    for i=1:tamanyo-mod(length(textarray,tamanyo)
        textarray[textarray 1]