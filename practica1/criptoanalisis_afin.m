function criptoanalisis_afin (v, m)
i=1;
indice_letra_1=1;
indice_letra_2=2;
a=barras(v);
while (i~=0)
    mat=[a(2,indice_letra_1),1;a(2,indice_letra_2),1];
    p=[a(4,indice_letra_1);a(4,indice_letra_2)];
    invmat=inv_modulo(mat,m);
    if(invmat~=0)
        xd=double(invmat)*p;
         xd=mod(xd,27);
        cifrado=desafin(xd(1),xd(2),v);
        if(cifrado~=0)
            disp("clave="+xd(1));
            disp("desplazamiento="+xd(2));
            disp(cifrado);
            i= input('si quieres probar otra clave introduce cualquier numero, en caso contrario introduce 0:');
        end
    end
    indice_letra_2=indice_letra_2+1;
    if(indice_letra_2==m) 
        indice_letra_2=1;
        indice_letra_1=indice_letra_1+1;
    end
end


end