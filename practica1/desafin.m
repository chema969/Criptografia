function descifraafin=desafin (clave, d, texto)
%DESAFIN
%Descifra un texto cifrado en afin
%Parametros:
%clave: Clave con la que se cifro el texto
%d: Desplazamiento con el que se cifro el texto
%texto: Texto a cifrar
if(~ischar(texto))
    %Si no introducimos un texto
    disp("Lo introducido no es un texto");
    return;
end
if(mod(d,1)==0 && mod(clave,1)==0)
    %Si tanto d como clave son numeros enteros
    %Definimos el alfabeto en español
    alfabeto='abcdefghijklmnfopqrstuvwxyz';
    %Introducimos la ñ
    alfabeto(15)=char(241);
    %Calculamos si clave tiene inversa y cual sería esta
    [aux,clave_inversa]=gcd(clave,27);
       if(aux==1)
           %Si la clave tiene inversa, pasamos el texto a números
            texto_a_numeros= letranumero(texto);
            %Reservamos memoria para la solucion
            descifraafin=zeros(1,length(texto_a_numeros));
            for i=1:length(texto_a_numeros)
                %Calculamos la letra que sería dentro del abecedario
                %haciendo el paso inverso a la encriptación y mirando su
                %valor en el vector alfabeto
                descifraafin(i)=alfabeto(mod(clave_inversa*(texto_a_numeros(i)-d),27)+1);
            end
            %Utilizamos char para pasar de numeros a caracteres
            descifraafin=char(descifraafin);
       else
           %Si la clave no tiene inversa modulo 27, retornamos 0
            descifraafin=0;
        end
else
    %Si o d o clave no son enteros, retorno 0
    descifraafin=0;
end
end