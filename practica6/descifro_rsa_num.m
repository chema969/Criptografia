function descifro_num =descifro_rsa_num (d, n, cifrado_numero)
if(0>n||mod(n,1)~=0||0>d||mod(d,1)~=0)
    disp('Ni n ni d son enteros positivos');
    descifro_num=0;
    return;
end
descifro_num=uint64(length(cifrado_numero));
for i=1:length(cifrado_numero)
   descifro_num(i)=potencia(cifrado_numero(i),d,n);
end


end