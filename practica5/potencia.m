function pote=potencia (c, d, n)
binario_d=bitget(d,uint64(log2(d))+1:-1:1,'uint64');
binario_d
binario_d=flip(binario_d);
aux=uint64(size(binario_d));
aux(1)=mod(c,n);
res=uint64(1);
res(1)=1;
if(binario_d(1)==1)
    res(1)=res(1)*aux(1);
    %res(1)
end

for i=2:length(binario_d)
    aux(i)=mod(aux(i-1)*aux(i-1),n);
    if(binario_d(i)==1)
        res(1)=mod(aux(i)*res(1),n);
        %aux(i)
    end
end
pote=res(1);

end

