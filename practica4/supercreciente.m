function bool=supercreciente(x)
sum=0;
for i=1:length(x)
    if(x(i)<=sum)
        bool=false;
        return;
    end
    sum=sum+x(i);
end    
bool=true;
return;
end