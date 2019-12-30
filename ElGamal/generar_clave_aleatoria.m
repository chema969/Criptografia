function [cpubl,cpriv]=generar_clave_aleatoria(n)
%GENERAR_CLAVE_ALEATORIA
%Funcion que genera una clave publica y privada aleatoria para ElGamal a partir
%de un numero primo aleatorio entre los n primeros
%Parametros:
%n=N primos de los que se cojera aleatoriamente la clave

%Calculamos los n primeros primos
primos=primes(n+100);

%Escogemos aleatoriamente dos de estos primos
ix  = randi([26,length(primos)]);
q= primos(ix);
g= randi([2,q-1]);
while(not(genera(g,q)))
   g= randi([2,q-1]);
end
a= randi([0,q-1]);
%Calculamos n
n=potencia(g,a,q);
%Creamos las claves publicas y privadas
cpubl=double([g n q]);
cpriv=double([g a q]);
end