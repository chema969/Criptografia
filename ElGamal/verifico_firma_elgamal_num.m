function firma = verifico_firma_elgamal_num(gk, g, n, q, firma, mensaje)
if(length(firma)~=length(mensaje))
    length(firma)
    length(mensaje)
    firma=false;
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
    rsgm(i)=mod(potencia(n,gk,q)*potencia(gk,firma(i),q),q);
end
gm
rsgm
firma=all(gm==rsgm);


end