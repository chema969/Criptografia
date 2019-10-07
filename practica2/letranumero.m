function v=letranumero(texto)
texto=lower(texto);
alfabeto='abcdefghijklmnfopqrstuvwxyz';
alfabeto(15)=char(241);
v=zeros(1,0);
for i=1:length(texto)
    for j=1:length(alfabeto)
        if(texto(i)==alfabeto(j))
            v=[v,j-1];
        end 
    end
end