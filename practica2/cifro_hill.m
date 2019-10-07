function cifrado=cifro_hill (A,m,texto)
alfabeto='abcdefghijklmnfopqrstuvwxyz';
mensaje=letranumero(texto);
cifrado=[];
if(~diff(size(A)))
  tamanyo_mensaje=length(mensaje);
  tamanyo_hill=size(A,2);
  
  punt=1;
  modulo=mod(tamanyo_mensaje,tamanyo_hill);
  if(modulo~=0)
     mensaje= [mensaje zeros(1,tamanyo_hill-modulo)];
     tamanyo_mensaje=tamanyo_mensaje+tamanyo_hill-modulo;
  end
  while(punt<tamanyo_mensaje)
     aux=[mensaje(punt:punt+tamanyo_hill-1)];
     aux=transpose(aux);
     aux=mod(A*aux,m);
     aux=transpose(aux);     
     cifrado=[cifrado aux];
     punt=punt+tamanyo_hill;
  end
  for i=1:length(cifrado)
    cifrado(i)=alfabeto(cifrado(i)+1);
  end
    cifrado=char(cifrado);
else
    cifrado=0;
end
end