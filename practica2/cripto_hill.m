function matrizclave=cripto_hill (claro, cripto, d)
%CRIPTO_HILL
%Función que descifra un texto encriptado con cifrado hill sabiendo una
%parte de texto claro que sea al menos de tamanyo d*d y el tamaño de bloque
%Parametros
%Claro: Texto claro
%texto: Texto encriptado
%d: tamaño de bloque
if(length(claro)<(d*d))
    %Si el texto claro no es suficiente
    disp("El mensaje no es lo suficientemente grande");
    matrizclave=0;
    return;
end

puntero=d;
filaActual=1;
%Paso los mensajes a numero
mensajeClaro=letranumero(claro);
mensajeCripto=letranumero(cripto);

if(length(mensajeClaro)>length(mensajeCripto))
    dividendo=length(mensajeCripto);
else 
    dividendo=length(mensajeClaro);
end
%Consigo el numero de filas que va a tener la matriz con el mensaje claro y
%el mensaje cripto
filas=int32((dividendo/d)-mod(dividendo,d));
matrizmensClaro=zeros(filas,d);
matrizmensCripto=zeros(filas,d);
while(puntero<dividendo)
    %Creo las matrices de mensaje claro y cripto
    matrizmensClaro(filaActual,:)=mensajeClaro(puntero-d+1:puntero);
    matrizmensCripto(filaActual,:)=mensajeCripto(puntero-d+1:puntero);
    puntero=puntero+d;
    filaActual=filaActual+1;
end   
%Creo las copias de seguridad, necesarias en caso de que no encontremos el
%mensaje a la primera
copiav=matrizmensClaro;
copiacripto=matrizmensCripto;
i=1;
%Defino los punteros
puntfil1=1;
puntfil2=2;
while(i<=d)
    j=i;
    hecho=0;
    while((j<=filas)&&(~hecho))
        %Mientras no hayamos llegado a la ultima fila y no este terminado
        if((matrizmensClaro(i,i)~=0))
            %Si el valor es distinto de 0, vemos si ese numero tiene
            %inversa en modulo 27
                [G,C]=gcd(matrizmensClaro(i,i),27);
                if(G==1)
                   %Si tiene inversa, multiplicamos en ambas matrices por
                   %ese numero
                   hecho=1;
                   matrizmensClaro(i,:)=mod(matrizmensClaro(i,:)*C,27); 
                   matrizmensCripto(i,:)=mod(matrizmensCripto(i,:)*C,27); 
                 
                   for k=1:filas
                      if(k~=i)
                        %Hacemos 0 la columna i de cada fila
                        matrizmensCripto(k,:)=mod(matrizmensCripto(k,:)-matrizmensCripto(i,:)*matrizmensClaro(k,i),27);
                        matrizmensClaro(k,:)=mod(matrizmensClaro(k,:)-matrizmensClaro(i,:)*matrizmensClaro(k,i),27);
                      end
                   end
                end
        end
        j=j+1;
        
        if(~hecho&&j<=filas)
            %Si la fila i no valía, permutamos la fila i y la j y volvemos
            %a intentar realizar el paso anterior
            matrizmensClaro([i j],:)=matrizmensClaro([j i],:);
            matrizmensCripto([i j],:)=matrizmensCripto([j i],:); 
        end
    end
      if(~hecho)
        %Si no hemos llegado a un final, volvemos a probar pero permutando
        %valores
        i=1;
        %Restauramos las "copias de seguridad"
        matrizmensCripto=copiacripto;
        matrizmensClaro=copiav;
        %Intercambiamos dos de los elementos
        matrizmensClaro([puntfil1 puntfil2],:)=matrizmensClaro([puntfil2 puntfil1],:);
        matrizmensCripto([puntfil1 puntfil2],:)=matrizmensCripto([puntfil2 puntfil1],:);
        %Modificamos los punteros
        puntfil2=puntfil2+1;
        if(puntfil2==d+1)
            puntfil1=puntfil1+1;
            puntfil2=puntfil1+1;
        end
        if(puntfil2==d+1)
            disp("error");
            matrizclave=0;
            return;
        end
      else
          %Si no, pasamos a la siguiente fila
          i=i+1;
      end  
      
end
%Transponemos la matriz y retornamos
matrizclave= transpose( matrizmensCripto(1:d,1:d));
end   
