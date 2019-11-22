function criptoanalisis_afin (v, m)
%CRIPTOANALISIS_AFIN
%Realiza el criptoanalisis del cifrado afin mediante analisis de
%frecuencias
%Parametros:
%v: mensaje cifrado
%m: Modulo en el que se cifro el mensaje

%Creamos las distintas variables auxiliares e indices
i=1;
indice_letra_1=1;
indice_letra_2=2;
indice_letra_3=1;
indice_letra_4=2;
%Llamamos a la funcion barras para obtener las frecuencias
a=barras(v);
while (i~=0)
    %Calculamos la matriz con los valores mas frecuentes en español 
    mat=[a(2,indice_letra_3),1;a(2,indice_letra_4),1];
    %Calculamos la matriz columna con los valores más frecuentes en nuestro
    %texto
    p=[a(4,indice_letra_1);a(4,indice_letra_2)];
    %Calculamos la inversa de mat
    invmat=inv_modulo(mat,m);
    if(ismatrix(invmat))
        %Si tiene inversa multiplicamos la inversa por p
        xd=invmat*p;
        %El vector este tiene los valores de la clave y de d
        %respectivamente
        xd=mod(xd,m);
        %Desencriptamos el mensaje
        cifrado=desafin(xd(1),xd(2),v);
        if(cifrado~=0)
            %Si fue posible descifrar, comprobamos si el mensaje tiene
            %sentido
            disp("clave="+xd(1));
            disp("desplazamiento="+xd(2));
            disp(cifrado);
            %Preguntamos al usuario si quiere seguir
            i= input('si quieres probar otra clave introduce cualquier numero, en caso contrario introduce 0:');
        end
    end
    %Parte del programa donde se van modificando los indices de las letras.
    indice_letra_2=indice_letra_2+1;
    if(indice_letra_2==m) 
        indice_letra_2=1;
        indice_letra_1=indice_letra_1+1;
        if(indice_letra_1==m)
            indice_letra_2=1;
            indice_letra_1=1;
            indice_letra_3=indice_letra_3+1;
            if(indice_letra_3==m)
                indice_letra_3=1;
                indice_letra_2=1;
                indice_letra_1=1;
                indice_letra_4=indice_letra_4+1;
            end
        end
    end
end


end