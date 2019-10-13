function matrizclave=cripto_hill (claro, cripto, d)
if(length(claro)<(d*d))
    disp("El mensaje no es lo suficientemente grande");
    matrizclave=0;
    return;
end
puntero=d;
filaActual=1;
mensajeClaro=letranumero(claro);
mensajeCripto=letranumero(cripto);
if(length(claro)>length(cripto))
    dividendo=length(cripto);
else 
    dividendo=length(claro);
end
filas=int32(dividendo/d-mod(dividendo,d));
matrizmensClaro=zeros(filas,d);
matrizmensCripto=zeros(filas,d);
while(puntero<dividendo)
    matrizmensClaro(filaActual,:)=mensajeClaro(puntero-d+1:puntero);
    matrizmensCripto(filaActual,:)=mensajeCripto(puntero-d+1:puntero);
    puntero=puntero+d;
    filaActual=filaActual+1;
end   
copiav=matrizmensClaro;
copiacripto=matrizmensCripto;
i=1;

puntfil1=1;
puntfil2=2;
while(i<=d)
    j=i;
    hecho=0;
    while((j<=filas)&&(~hecho))
        
        if((matrizmensClaro(i,i)~=0))
                [G,C]=gcd(matrizmensClaro(i,i),27);
                if(G==1)
                   hecho=1;
                   matrizmensClaro(i,:)=mod(matrizmensClaro(i,:)*C,27); 
                   matrizmensCripto(i,:)=mod(matrizmensCripto(i,:)*C,27); 
                 
                   for k=1:filas+1
                      if(k~=i)
                        matrizmensCripto(k,:)=mod(matrizmensCripto(k,:)-matrizmensCripto(i,:)*matrizmensClaro(k,i),27);
                        matrizmensClaro(k,:)=mod(matrizmensClaro(k,:)-matrizmensClaro(i,:)*matrizmensClaro(k,i),27);
                      end
                   end
                end
        end
        j=j+1;
        
        if(~hecho)
            matrizmensClaro([i j],:)=matrizmensClaro([j i],:);
            matrizmensCripto([i j],:)=matrizmensCripto([j i],:); 
        end
    end
      if(~hecho)
        i=1;
        matrizmensCripto=copiacripto;
        matrizmensClaro=copiav;
        matrizmensClaro([puntfil1 puntfil2],:)=matrizmensClaro([puntfil2 puntfil1],:);
        matrizmensCripto([puntfil1 puntfil2],:)=matrizmensCripto([puntfil2 puntfil1],:);
        puntfil2=puntfil2+1;
        if(mod(puntfil2,d)==0)
            puntfil1=puntfil1+1;
            puntfil2=puntfil1+1;
        end
        if(mod(puntfil1,d)==0)
            disp("error");
            return;
        end
      else
          i=i+1;
      end  
      
 end
matrizclave= transpose( matrizmensCripto(1:d,1:d));
end   
