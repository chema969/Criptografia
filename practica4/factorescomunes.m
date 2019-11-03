function factores_c=factorescomunes (w , s)
if(mod(w,1)~=0||w<=0)
    factores_c=2;
    disp("w no es entero y positivo");
    return
end
if(~condiciones(s))
    %Si no cumple las condiciones para ser mochila, retorna 2
    factores_c=2;
    return
end    
for i=1:length(s)
    if(gcd(w,s(i))~=1)
        %Si encuentra un factor comun retorna true
        factores_c=true;
        return;
    end
end
%Si sale del bucle sin haber retornado, es que no tiene factores comunes
factores_c=false;
end