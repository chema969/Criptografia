function pote=potencia (c, d, n)
%POTENCIA
%Funcion que calcula c elevado a d modulo n mediante la exponenciancion
%rapida
%Parametros:
%c=Base
%d=Exponente
%n=modulo
if(mod(c,1)~=0||mod(d,1)~=0||mod(n,1)~=0)
    pote=0;
    return;
end
binario_d=bitget(d,uint64(log2(d))+1:-1:1,'uint64');
%Pasamos el numero d a binario
binario_d=flip(binario_d);
%Giramos el vector para que el bit menos significativo sea el primer
%elemento del vector y el más significativo el ultimo
aux=uint64(size(binario_d));
aux(1)=mod(c,n);
%Conseguimos el primer elemento del vector aux donde se guardaran los 
%distintos c^2^n como c modulo n
res=uint64(1);
res(1)=1;
%Variable solucion
if(binario_d(1)==1)
    %Si es 1 el bit 2^0, entonces multiplicamos res por n^2^0
    res(1)=res(1)*aux(1);
end

for i=2:length(binario_d)
    %Por cada elemento, se calcula d^2^i calculando d^2^i-1*d^2^i-1
    aux(i)=mod(aux(i-1)*aux(i-1),n);
    if(binario_d(i)==1)
        %Si pertenece al numero binario, lo multiplico
        res(1)=mod(aux(i)*res(1),n);
    end
end
pote=res(1);

end

