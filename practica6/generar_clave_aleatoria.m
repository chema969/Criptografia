function [cpubl,cpriv]=generar_clave_aleatoria(n)
primos=primes(n);
ix  = randi([1,length(primos)]);
iy  = randi([1,length(primos)]);
p= primos(ix);
q= primos(iy);
p=1187
q=1171
fi=p*q

e=65537;
if(fi<e)
    %Si 65537 NO es suficientemente grande, tenemos que buscar e tal que M.C.D(e,fi_n)==1.
    for i=2:fi
        if(gcd(i,fi)==1)
            e=i;
            break;
        end
    end
end 
[~,d]=gcd(e,fi);
d=mod(d,fi);
cpubl=[fi d];
cpriv=[fi e];
end