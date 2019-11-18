function cifrado = cifro_rsa_num (e, n, blo)
if(0>e||mod(e,1)~=0||0>n||mod(n,1)~=0)
    disp('Tama no es un entero positivo');
    cifrado=0;
    return;
end
if(not(all(mod(blo(:),1)==0)))
    disp('Algun elemento de blo no e entero');
    cifrado=0;
    return;
end   
cifrado=uint64(length(blo));
for i=1:length(blo)
   cifrado(i)=potencia(blo(i),e,n);

end

end