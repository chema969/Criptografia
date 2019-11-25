[clavePublicaA,clavePrivadaA]=generar_clave_aleatoria(2000);
[clavePublicaB,clavePrivadaB]=generar_clave_aleatoria(2000);
disp("La clave publica de A es:");
clavePublicaA
disp("La clave privada de A es:");
clavePrivadaA

disp("La clave publica de B es:");
clavePublicaB

disp("La clave privada de B es:");
clavePrivadaB


disp("El mensaje que se va a enviar a B");
mensaje='Este es el mejor mensaje firmado que vas a ver en tu vida bychema'
clave='bychema';
%Cifro este mensaje con la clave publica de B
cifrado=cifro_rsa(clavePublicaB(2),clavePublicaB(1),mensaje);

%Calculo el tamanyo para cifrar la firma
tamanyo=numel(num2str(clavePublicaA(1)));
%Cifro la firma con mi clave privada
cifrado_firma=cifro_rsa(clavePrivadaA(2),clavePrivadaA(1),clave);
cifrado_texto=[];
%Voy aumentando el tamanyo de los bloques para que sea del tamanyo de mi
%clave publica
tamanyosbloquesfirma=[];
for i=1:length(cifrado_firma)
    aux=num2str(cifrado_firma(i));
    if(cifrado_firma(i)==0)
        tamanyosbloquesfirma=[tamanyosbloquesfirma 0];
    else
        tamanyosbloquesfirma=[tamanyosbloquesfirma numel(num2str(cifrado_firma(i)))];
    end
    while(length(aux)<tamanyo)
        aux=['0' aux];
    end
    cifrado_texto=[cifrado_texto aux];
end

tamanyo2=numel(num2str(clavePublicaB(1)))-1;
%Cifro mi firma con la clave publica de B, modificando previamente los
%bloques numericos para que tengan el tamanyo de clavePublicaB-1
cifrado_firma=cifro_rsa_num(clavePublicaB(2),clavePublicaB(1),prepa_num_cifrar(tamanyo2,cifrado_texto));

disp("El mensaje descifrado por B es")
%Desciframos el mensaje con la clave privada de B
descifro_rsa(clavePrivadaB(2),clavePrivadaB(1),cifrado)

%Desciframos primero con la clave privada de B
firmaP=descifro_rsa_num(clavePrivadaB(2),clavePrivadaB(1), cifrado_firma);
%Modifico para que tenga el tamanyo de clavePublica(A)
firma_final=[];

for i=1:length(firmaP)
    aux=num2str(firmaP(i));
    while(length(aux)<tamanyo2)
        aux=['0' aux];
    end
    firma_final=[firma_final aux];
end

%Descifro con la clave publica de A
descifro_rsa(clavePublicaA(2),clavePublicaA(1), prepa_num_cifrar_firma(tamanyosbloquesfirma,firma_final))