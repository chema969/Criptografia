%Para facilidad del usuario le permitimos mostrar los n primeros primos
opcionPrimos=input('¿Quieres ver todos los números primos hasta un valor n? Introduce 1:');
if(opcionPrimos==1)
    nPrimerosPrimos=input('Ver los primos hasta el valor... (número positivo):');
    if(0>nPrimerosPrimos)
        disp('No existen n números primos')
    else
        disp('Los n primeros primos son:')
        disp(primes(nPrimerosPrimos))
    end
end


%Hacemos que el usuario introduzca p
p=input('Introduce un numero primo para el valor p:');
while(not(isprime(p)))
    p=input('El valor de p no es un numero primo. Introduce un numero primo:'); 
end 

%Hacemos que el usuario introduzca q
q=input('Introduce un numero primo para el valor p:');
while(not(isprime(q)))
    q=input('El valor de p no es un numero primo. Introduce un numero primo:'); 
end 


n=p*q;
mensajeN=['n, que formara parte de las claves es: n=',num2str(n)];
disp(mensajeN)


fi_n = (p-1)*(q-1);
e=65537;
if(fi_n>e)
    %Si 65537 es suficientemente grande, nos vale.
    disp('Se escoge 65537 como e');
else
    %Si 65537 NO es suficientemente grande, tenemos que buscar e tal que M.C.D(e,fi_n)==1.
    for i=2:fi_n
        if(gcd(i,fi_n)==1)
            e=i;
            mensajeE=['Se escoge como e=',num2str(e)];
            disp(mensajeE);
            break;
        end
    end
end


mensajeD=['Buscamos d de forma que d sea el inverso de e=',num2str(e) ,' modulo fi_n=',num2str(fi_n)];
disp(mensajeD);

[~,d]=gcd(e,fi_n);
mensajeD=['Seleccionamos d=',num2str(d)];
d=mod(d,fi_n);
disp('La clave privada es ');
clavePrivada=[n d]
disp('La clave publica es ');
clavePublica=[n e]










