function valida=mochila (s)
if(~condiciones(s))
    valida=false;
    return;
end
if(supercreciente(s))
    valida=true;
else
    valida=false;
end
