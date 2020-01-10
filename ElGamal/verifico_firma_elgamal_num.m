function firma_v = verifico_firma_elgamal_num(r, g, n, q, firma, mensaje)
%VERIDICO_FIRMA_ELGAMAL_NUM
%Funcion que verifica si una firma viene de quien dice venir 
%Parametros:
%r=Información extraida de la firma
%g=Número generador en base q
%n=Clave publica con la que cifrar
%q=Número primo que representa el modulo
%firma=Bloque numérico que representa la firma del documento
%mensaje=Mensaje que supuestamente se corresponde la firmado
%Salida:
%firma=Valor booleano que es true si se verifica la firma
if(0>q||mod(q,1)~=0||0>n||mod(n,1)~=0||0>g||mod(g,1)~=0||0>r||mod(r,1)~=0)
    %Si los parametros no son enteros positivos
    disp('Parametros no validos');
    firma_v=false;
    return;
end
if(length(firma)~=length(mensaje))
    length(firma)
    length(mensaje)
    firma_v=false;
    return;
end
gm=zeros(1,length(mensaje));
for i=1:length(mensaje)
    %Cifro el mensaje
    gm(i)=potencia(g,mensaje(i),q);
end
rsgm=zeros(1,length(mensaje));
for i=1:length(mensaje)
    %Cifro el mensaje
    rsgm(i)=mod(potencia(n,r,q)*potencia(r,firma(i),q),q);
end
rsgm
firma_v=all(gm==rsgm);


end