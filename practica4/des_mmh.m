function texto=des_mmh (s, cifrado, mu, invw)
if(~mochila(s)||~condiciones(cifrado)||mod(mu,1)~=0||mod(mu,1)~=0||mu<0||invw<=0)
    %No cumple las condiciones
    texto=0;
    return;
end
aux=[];
for i=1:length(cifrado)
   %Vamos descifrando cada uno de los numeros en cifrado invertidos con
   %la mochila s.
   aux=[aux sol_mochila(s,mod(cifrado(i)*invw,mu))];
end  
%aux es una mochila binario
indice=1;
texto=[];
length(aux)
while(indice<length(aux))
    %Mientras aun tenga que descifrar, coge una subcadena de 8 bits y lo
    %transforma a un caracter con el codigo ASCII.
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