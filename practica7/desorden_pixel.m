function desorden_pixel (foto, A)
fotografia=imread(foto);
 if(length(fotografia)~=length(fotografia(:,1)))
     %Si la matriz no es cuadrada, retorno 0 y un mensaje de error
     disp('la fotografia no es cuadrada');
     return;
 end
 if(length(A)~=2||length(A(:,1))~=2)
     disp('la matriz A no es cuadrada o de orden 2');
     return;
 end
 

modulo=length(fotografia); 
if(not(ismatrix(inv_modulo(A,modulo))))
    disp('la matriz A no es invertible');
    return;
end    
matriz=zeros(modulo,modulo,size(fotografia,3));
for i=1:modulo
    for j=1:modulo
        nuevolug=mod(A*[i;j],modulo);
        if(nuevolug(1)==0)
            nuevolug(1)=modulo;
        end
        if(nuevolug(2)==0)
            nuevolug(2)=modulo;
        end
        matriz(nuevolug(1),nuevolug(2),:)=fotografia(i,j,:);        
    end
end   
matriz=uint8(matriz);
setappdata(gcf, 'matriz', matriz)




end