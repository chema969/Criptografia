function [cpubl, cpriv]=mochila_mh (s)
if(~mochila(s))
    cpubl=0;
    cpriv=0;
    return;
end
mu= input('introduce el valor de mu:');
while(mu<(s(length(s)-1)*2+1)||mod(mu,1)~=0)
    mu= input('mu no valido.Introduce otro valor de mu:');
end
w=1;
for aux=2:mu
    %Se busca un número sin factores comunes y que tenga inverso con mu
    if(gcd(aux,mu)==1&&~factorescomunes(aux,s))
        w=aux;
        break;
    end
end
[~,inv_w]=gcd(w,mu);
cpriv=[mu inv_w];
cpubl=mod(s*w,mu);

end