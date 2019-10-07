function permuta=permutacion_v (p)
aux=length(p);
for i=1:aux
    is_in=false;
    for j=1:aux
       if(p(j)==i)
           is_in=true;
           break;
       end           
    end
   if(~is_in)
     permuta=false;
     return;
   end
end
permuta=true;
end