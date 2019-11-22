function [cpubl,cpriv]=generar_clave_aleatoria(n)
%GENERAR_CLAVE_ALEATORIA
%Funcion que genera una clave publica y privada aleatoria para RSA a partir
%de dos numeros primos aleatorios entre los n primeros
%Parametros:
%n=N primos de los que se cojera aleatoriamente la clave

%Calculamos los n primeros primos
primos=primes(n);

%Escogemos aleatoriamente dos de estos primos
ix  = randi([1,length(primos)]);
iy  = randi([1,length(primos)]);
p= primos(ix);
q= primos(iy);
%Calculamos n como p*q
n=p*q;
%Calculamos fi
fi= (p-1)*(q-1);
%Calculamos e
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
%Calculamos d tal que d sea el inverso de e modulo fi
[~,d]=gcd(e,fi);
d=mod(d,fi);
%Creamos las claves publicas y privadas
cpubl=[n d];
cpriv=[n e];
end