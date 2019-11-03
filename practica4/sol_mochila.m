function v=sol_mochila (s,obj)
if(~condiciones(s))
    %Si no cumple las condiciones
    v=0;
    return;
end
i=length(s);
v=zeros(1,length(s));
while(i>0)
    %Mientras no se hayan observado todos los valores de la mochila
    if(obj>=0&&obj>=s(i))
        %Si el valor ya se ha alcanzado o el valor de la mochila en la
        %posición i es mayor.
        obj=obj-s(i);
        v(i)=1;
    end
    i=i-1;
end
if(obj~=0)
    v=0;
    disp("El objetivo no se alcanza");
    return;
end
end