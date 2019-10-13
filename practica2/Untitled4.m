v=zeros(d,filas+1);
v=transpose(v);
for i=1:d
    for j=1:filas+1
        G=gcd(matrizmensClaro(j,i),27);
        if(G==1)
          v(j,i)=1;
        end    
    end 
end
vectordefilas=transpose(zeros(d,1));
i=1;
while(i<=d)
    escogido=0;
    for j=vectordefilas(i)+1:filas+1
        if((v(j,i)==1)&&(~ismember(j,vectordefilas)))
            vectordefilas(i)=j;
            escogido=1;
            break;
        end
    end
    if(~escogido)
       i=i-1;
    else
       i=i+1;
    end
    if(i==0)
        disp("error");
        return;
    end
end
matrizclave=zeros(d,d);
matrizAuxiliar=zeros(d,d);
for i=1:d
    [G,C]=gcd(matrizmensClaro(vectordefilas(i),i),27);
     matrizmensClaro(vectordefilas(i),:)=mod(matrizmensClaro(vectordefilas(i),:)*C,27); 
     matrizmensCripto(vectordefilas(i),:)=mod(matrizmensCripto(vectordefilas(i),:)*C,27);        
     matrizclave(i,:)=matrizmensCripto(vectordefilas(i),:);
     matrizAuxiliar(i,:)=matrizmensClaro(vectordefilas(i),:);
end
matrizclave
matrizAuxiliar