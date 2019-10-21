function texto=des_mmh (s, cifrado, mu, invw)
if(~mochila(s))
    texto=0;
    return;
end
aux=[];
for i=1:length(cifrado)
   aux=[aux sol_mochila(s,mod(cifrado(i)*invw,mu))];
end  
indice=1;
texto=[];
length(aux)
while(indice<length(aux))
    if(length(aux)-indice<7)
        return;
    end
    x=aux(indice:indice+7);
    binario=[];
   for i=1:length(x)
       binario=[binario int2str(x(i))];
   end
   texto=[texto char(bin2dec(binario))];
   indice=indice+8;
end
end