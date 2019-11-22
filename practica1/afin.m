function cifradoafin=afin (clave, d ,texto)
%AFIN
%Realiza el cifrado afin de un mensaje mediante una clave y un
%desplazamiento
%Parametros:
%clave: Clave del sistema afin
%d: Desplazamiento del sistema afin
%texto: Texto a cifrar
if(~ischar(texto))
    %Si no introducimos un texto en afin
    disp("Lo introducido no es un texto");
    cifradoafin=0;
    return;
end
if(mod(d,1)==0 && mod(clave,1)==0&&d>0&&clave>0)
    %Si son numeros enteros
    alfabeto='abcdefghijklmnfopqrstuvwxyz';
    alfabeto(15)=char(241);

       if(gcd(27,clave)==1)
        %Si la clave es valida en el modulo 27
        texto_a_numeros= letranumero(texto);
        cifradoafin=zeros(1,length(texto_a_numeros));
        for i=1:length(texto_a_numeros)
            %Cada letra sera la letra del texto*clave+d;
            cifradoafin(i)=alfabeto(mod(texto_a_numeros(i)*clave+d,27)+1);
        end
        %Transformo a una cadena de caracteres
        cifradoafin=char(cifradoafin);
       else
        %Si la clave que hemos introducido no tiene inversa en modulo 27.
        cifradoafin=0;
       end
else
    %Si los valores introducidos no son válidos.
    cifradoafin=0;
end
end