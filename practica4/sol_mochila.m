function v=sol_mochila (s,obj)
if(~condiciones(s))
    v=0;
    return;
end
i=length(s);
v=zeros(1,length(s));
while(i>0)
    if(obj>=0&&obj>=s(i))
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