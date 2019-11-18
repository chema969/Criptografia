function desci = num_descifra (n, bloque_numero)
if(0>n||mod(n,1)~=0)
    disp('Tama no es un entero positivo');
    desci=0;
    return;
end

if(not(all(mod(bloque_numero(:),1)==0)))
    disp('Algun elemento de bloque_numero no es entero');
    desci=0;
    return;
end   

alfabeto='abcdefghijklmnfopqrstuvwxyz';
alfabeto(15)=char(241);

tamanyo=numel(num2str(n))-1;
desci=[];
for i=1:length(bloque_numero)
  aux=int2str(bloque_numero(i));
  while(length(aux)~=tamanyo)
    aux=strcat('0',aux);
  end
  j=1;
  while(j<tamanyo)
      if(not(strcmp(aux(j:j+1),'30'))&&j+1<=tamanyo)
        desci=[desci alfabeto(str2double(aux(j:j+1))+1)];
      end
      j=j+2;
  end
  
end
desci=char(desci);