function bool=supercreciente(x)
sum=0;
for i=1:length(x)
    %Si encuentra un valor que sea menor a la suma de los anteriores no es
    %supercreciente
    if(x(i)<=sum)
        bool=false;
        return;
    end
    sum=sum+x(i);
end    
bool=true;
return;
end