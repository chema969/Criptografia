function [r,firmado] = firmo_elgamal_num(g, a, q, blo)

k=randi([2,q-2]);
while(gcd(k,q-1)~=1)
    k=randi([2,q-2]);
end
r=potencia(g,k,q);
r=double(r);
firmado=uint64(length(blo));
[~,inv]=gcd(k,q-1);
for i=1:length(blo)
    %Cifro el mensaje
    firmado(i)=mod((blo(i)-a*r)*inv,q-1);
end
firmado=double(firmado);
end