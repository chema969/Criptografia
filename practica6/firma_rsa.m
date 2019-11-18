[clavePublicaA,clavePrivadaA]=generar_clave_aleatoria(2000);
[clavePublicaB,clavePrivadaB]=generar_clave_aleatoria(2000);

disp("La clave publica de A es:");
%clavePublicaA
clavePublicaA=[1389977 65537]
disp("La clave privada de A es:");
%clavePrivadaA
clavePrivadaA=[1389977 924713]

disp("La clave publica de B es:");
%clavePublicaB
clavePublicaB=[129739 65537]

disp("La clave privada de B es:");
%clavePrivadaB
clavePrivadaB=[129739 15377]


disp("El mensaje que se va a enviar");
mensaje='Este es el mejor mensaje firmado que vas a ver en tu vida bychema'
clave='bychema';

cifrado=cifro_rsa(clavePublicaB(2),clavePublicaB(1),mensaje)

tamanyo=numel(num2str(clavePublicaA(1)));
cifrado_firma=cifro_rsa(clavePrivadaA(2),clavePrivadaA(1),clave);
cifrado_texto=[];
for i=1:length(cifrado_firma)
    aux=num2str(cifrado_firma(i));
    while(length(aux)~=tamanyo)
        aux=['0' aux];
    end
    cifrado_texto=[cifrado_texto aux];
end

tamanyo2=numel(num2str(clavePublicaB(1)))-1;

cifrado_firma=cifro_rsa_num(clavePublicaB(2),clavePublicaB(1),prepa_num_cifrar(tamanyo2,cifrado_texto))

disp("El mensaje descifrado por B es")
descifro_rsa(clavePrivadaB(2),clavePrivadaB(1),cifrado)

firmaP=descifro_rsa_num(clavePrivadaB(2),clavePrivadaB(1), cifrado_firma);
firma_final=[];
for i=1:length(firmaP)
    aux=num2str(firmaP(i));
    while(length(aux)~=tamanyo)
        aux=['0' aux];
    end
    firma_final=[firma_final aux];
end


descifro_rsa (clavePublicaA(2),clavePublicaA(1), prepa_num_cifrar(tamanyo,cifrado_texto))