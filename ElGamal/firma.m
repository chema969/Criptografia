disp('Generamos la clave publica y privada de A');
[cpubla,cpriva]=generar_clave_aleatoria(100000)
disp('Generamos la clave publica y privada de B');
[cpublb,cprivb]=generar_clave_aleatoria(100000)

mensaje=input('Introduce el mensaje que B quiere enviar a A:');
while(not(ischar(mensaje)))
    mensaje=input('No es una cadena. Introduce el mensaje que B quiere enviar a A:');
end

disp('Ciframos con la clave publica de A');
[gk,mensajecif]=cifro_elgamal(cpubla(1),cpubla(2),cpubla(3),mensaje)

disp('Tambien firmamos con la clave privada de B');
[r,mensaje_firma]=firmo_elgamal(cprivb(1),cpublb(2),cprivb(2),cprivb(3),mensaje)

disp('A recibe un mensaje cifrado, una firma, r y gk')
disp('A desencripta el mensaje')

mensajedescifrado=descifro_elgamal(gk,cpubla(2),cpriva(2),cpriva(3),mensajecif)
disp('Comprobamos el mensaje con la firma')
if(verifico_firma_elgamal(r,cpublb(1),cpublb(2),cpublb(3),mensaje_firma,mensajedescifrado))
    disp('El mensaje viene de B con certeza')
else
    disp('No se puede comprobar que el mensaje sea de B')
end