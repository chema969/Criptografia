function cifradoafin=afin (clave, d ,texto)
d=round(d);
clave=round(clave);
alfabeto='abcdefghijklmnfopqrstuvwxyz';
alfabeto(15)=char(241);

   if(gcd(27,clave)==1)
    texto_a_numeros= letranumero(texto);
    cifradoafin=zeros(1,length(texto_a_numeros));
    for i=1:length(texto_a_numeros)
        cifradoafin(i)=alfabeto(mod(texto_a_numeros(i)*clave+d,27)+1);
    end
    cifradoafin=char(cifradoafin);
  else
    cifradoafin=zeros(1,1);
  end
end