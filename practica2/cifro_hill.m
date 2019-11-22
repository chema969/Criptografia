function cifrado=cifro_hill (A,m,texto)
%CIFRO_HILL
%Función que cifra un mensaje mediante cifrado hill
%Parametros
%A: Matriz para cifrar
%m: Modulo
%texto: Texto a cifrar

%Declaro  el alfabeto en espanyol
alfabeto='abcdefghijklmnfopqrstuvwxyz';
alfabeto(15)=char(241);

%Paso el mensaje a numeros
mensaje=letranumero(texto);
cifrado=[];

if(~diff(size(A)))
  %si la matriz es cuadrada
  tamanyo_mensaje=length(mensaje);
  tamanyo_hill=size(A,2);
  punt=1;
  modulo=mod(tamanyo_mensaje,tamanyo_hill);
  %Anyado ceros al final del mensaje si fuera necesario
  if(modulo~=0)
     mensaje= [mensaje zeros(1,tamanyo_hill-modulo)];
     tamanyo_mensaje=tamanyo_mensaje+tamanyo_hill-modulo;
  end
  %Transformo el mensaje a submensajes del tamanyo de la matriz y voy
  %cifrando a la vez
  while(punt<tamanyo_mensaje)
      
     aux=[mensaje(punt:punt+tamanyo_hill-1)];
     aux=transpose(aux);
     aux=mod(A*aux,m);
     aux=transpose(aux);     
     cifrado=[cifrado aux];
     punt=punt+tamanyo_hill;
  end
  for i=1:length(cifrado)
      %Transformo a letra
    cifrado(i)=alfabeto(cifrado(i)+1);
  end
    %Transformamos a texto el cifrado
    cifrado=char(cifrado);
else
    cifrado=0;
end
end