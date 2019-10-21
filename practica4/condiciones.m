function bool=condiciones(s)
if(~(isrow(s)))
    disp("No es un vector fila");
    bool=false;
    return;
end
for i=1:length(s)
    if(mod(s(i),1)~=0||s(i)<0)
        disp("Error:Vector no entero positivo");
        bool=false;
        return;
    end
end
bool=true;