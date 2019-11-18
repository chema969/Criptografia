function desci = cifro_rsa (e, n, texto)
if(~ischar(texto))
    disp("No es una cadena");
    desci=0;
    return;
end

if(0>e||mod(e,1)~=0||0>n||mod(n,1)~=0||numel(num2str(n))<=1)
    disp('O e o n no son enteros positivos');
    desci=0;
    return;
end
digitos=letra2numeros(texto);
tamanyo=numel(num2str(n))-1;
blo=prepa_num_cifrar(tamanyo,digitos);
desci=cifro_rsa_num(e,n,blo);

end