function descifraafin=desafin (clave, d, texto)
if(mod(d,1)==0 && mod(clave,1)==0)
alfabeto='abcdefghijklmnfopqrstuvwxyz';
alfabeto(15)=char(241);
[aux,clave_inversa]=gcd(clave,27);
   if(aux==1)
    texto_a_numeros= letranumero(texto);
    descifraafin=zeros(1,length(texto_a_numeros));
    for i=1:length(texto_a_numeros)
       descifraafin(i)=alfabeto(mod(clave_inversa*(texto_a_numeros(i)-d),27)+1);
    end
    descifraafin=char(descifraafin);
   else
    descifraafin=0;
  end
else
    descifraafin=0;
end
end