function desci = num_descifra (n, bloque_numero)
%NUM_DESCIFRA 
%Funcion que transforma un vector numerico en letras. 
%Parametros:
%n=Tamanyo de los bloque
%bloque_numero=Vector numerico
if(0>n||mod(n,1)~=0)
    %Si los parametros de n son erroneos
    disp('n no es un entero positivo');
    desci=0;
    return;
end

if(not(all(mod(bloque_numero(:),1)==0)))
    %Si no todos los elementos de bloque_numero son enteros positivos
    disp('Algun elemento de bloque_numero no es entero');
    desci=0;
    return;
end   

alfabeto='abcdefghijklmnfopqrstuvwxyz';
alfabeto(15)=char(241);
%Definimos el tamanyo de bloque
tamanyo=numel(num2str(n))-1;
blf=[];
for i=1:length(bloque_numero)
  %Pasamos cada numero a una cadena  
  aux=int2str(bloque_numero(i));
  while(length(aux)<tamanyo)
    %Añadimos 0 delante mientras no sea del tamanyo 
    aux=strcat('0',aux);
  end 
  %Concatenamos
  blf=[blf aux];
end

j=1;
desci=[];
while(j<length(blf))
    %Mientras siga teniendo elementos
    if(not(strcmp(blf(j:j+1),'30')))
      %Si no es 30 el elemento que miramos
      desci=[desci alfabeto(str2double(blf(j:j+1))+1)];
    else
       %Si es 30, retornamos.
       desci=char(desci);
       return;
    end
    
    j=j+2;
end
desci=char(desci);