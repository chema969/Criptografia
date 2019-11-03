function s=cripto_shamir_zippel (cpubl, mu)
if(~condiciones(cpubl)||mod(mu,1)~=0||mu<=0)
    %Si la clave publica no cumple las condiciones o mu no es un entero
    %positivo
    disp("Valores no validos de entrada")
    return
end
[~,invb2]=gcd(cpubl(2),mu);
q=mod(cpubl(1)*invb2,mu);%Calculamos el valor de q=b1?inv(b2) mod mu.
entrada=1;
multiplo=1;
while(entrada==1)
    tic;%Iniciamos el temporizador
    r=zeros(1,power(2,length(cpubl)+multiplo));
    for i=1:power(2,length(cpubl)+multiplo)
        %Rellenamos el vector r con los primeros 2^(n+1) múltiplos modulares 
        %de q.
        r(i)= mod(q*i,mu);  
    end
    r=sort(r);%Ordenamos el vector r
    rango=['Rango[1,',num2str(length(r)),']'];
    disp(rango);

    for i=1:length(r)
        %Para cada elemento de r
       mochilafinal=zeros(1,length(cpubl));
       mochilafinal(1)=r(i);%Introducimos como elemento 1 de la mochila r(i)
       [~,inva1]=gcd(r(i),mu);
       w=mod(inva1*cpubl(1),mu);%Calculamos w=b1?inv(a1)mod mu.
       [~,invw]=gcd(w,mu);
       for j=2:length(cpubl)
           %Para cada valor ai de la mochila, calculamos ai=inv(w)*bi mod mu 
          mochilafinal(j)=mod(invw*cpubl(j),mu); 
       end
       if(supercreciente(mochilafinal))
           %Si la mochila es supercreciente, tenemos solución y la
           %retornamos
          s=mochilafinal;
          tiempo=toc;
          %Se imprime el tiempo necesario para encontrar la solución
          mensajeTiempo=['Time elapsed=',num2str(tiempo)];
          disp(mensajeTiempo);
          return;
       end
    end
     tiempo=toc;
     mensajeTiempo=['Time elapsed=',num2str(tiempo)];
     disp(mensajeTiempo);
     %Se imprime el tiempo necesario para evaluar todos los valores de r

    multiplo=multiplo +1;
    entrada=input('no hemos encontrado la mochila, si quieres ampliar el rango, responde 1: ');
end

end