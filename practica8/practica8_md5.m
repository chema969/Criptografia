%  md5
%  Halla el resumen MD5 del mensaje, como una cadena hexadecimal.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PASO 1.- INTRODUCIMOS VARIABLES Y CONSTANTES NECESARIAS
clc
%PASO 1.1.- ESCRIBIMOS EL MENSAJE
mensaje= input('Introduce el mensaje entre comillas:');
while(~ischar(mensaje))
    mensaje= input('No es una cadena.Introduce el mensaje entre comillas:');
end

% PASO 1.2.- VAMOS A TRABAJAR MODULO M=2^32
m=2^32;

% PASO 1.3.-  CREAMOS UNA MATRIZ S PARA HACER LA ROTACION,
% LOS NUMEROS SON NEGATIVOS POR SER UNA ROTACION A IZQUIERDA
s = [-7, -12, -17, -22;-5,  -9, -14, -20;-4, -11, -16, -23;-6, -10, -15, -21]

% PASO 1.4.- t ES LA TABLA QUE USAREMOS MAS ADELANTE, para construir la funcion
% Hash  del mensaje
t = fix(abs(sin(1:64)) .* m)

% PASO 1.5.- INICIALIZAMOS LA HASH
% MD5 utiliza las cuatro palabras siguientes:
% A=01 23 45 67 pero en Little endian:67 45 23 01
% B=89 ab cd ef --> ef cd ab 89 
% C=fe dc ba 98 --> 98 ba dc fe
% D=76 54 32 10 --> 10 32 54 76
fhash=zeros(1,4);
aux=[6,7,4,5,2,3,0,1];
aux2='';
for i=1:length(aux)
    aux2=[aux2 dec2bin(aux(i),4)];
end
fhash(1)=bin2dec(aux2);

aux=[14,15,12,13,10,11,8,9];
aux2='';
for i=1:length(aux)
    aux2=[aux2 dec2bin(aux(i),4)];
end
fhash(2)=bin2dec(aux2);

aux=[9,8,11,10,13,12,15,14];
aux2='';
for i=1:length(aux)
    aux2=[aux2 dec2bin(aux(i),4)];
end
fhash(3)=bin2dec(aux2);

aux=[1,0,3,2,5,4,7,6];
aux2='';
for i=1:length(aux)
    aux2=[aux2 dec2bin(aux(i),4)];
end
fhash(4)=bin2dec(aux2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PASO 2.- PREPARAMOS EL MENSAJE PARA APLICARLE LA HASH

mensaje = abs(mensaje)
bytelen = numel(mensaje) %numero de elementos del vector 

% PASO 2.1.- COMPLETAMOS EL MENSAJE CON UN 1 Y  LOS CEROS NECESARIOS PARA QUE EL 
% NUMERO DE BITS SEA CONGRUENTE CON 448 MODULO 512. COMO TENEMOS BYTES, COMPLETAMOS 
% CON 128 (10000000) Y LOS CEROS NECESARIOS PARA QUE EL NUMERO DE BYTES SEA 
% CONGRUENTE CON 56 MODULO 64
mensaje=[mensaje 128];

while(mod(numel(mensaje),64)~=56)
    mensaje=[mensaje 0];
end




% PASO 2.2.- COMO CADA PALABRA VIENE FORMADA POR 4 BYTES, HACEMOS UNA MATRIZ DE 
% 4 FILAS CON LOS BYTES DEL MENSAJE, ASI CADA COLUMNA SERA UNA PALABRA 
segundolen = numel(mensaje)
matrizaux=zeros(4,segundolen/4);
i=1;
j=1;
while(i<segundolen)
    matrizaux(:,j)=mensaje(i:i+3);
    i=i+4;
    j=j+1;
end
matrizaux


% PASO 2.3.- CONVERTIMOS CADA COLUMNA A ENTEROS DE 32 BITS, little endian.

vectorfinal=[];
for i=1:length(matrizaux(1,:))
    auxili=matrizaux(1,i)+matrizaux(2,i)*256+matrizaux(3,i)*65536+matrizaux(4,i)*16777216;
    vectorfinal=[vectorfinal auxili];
end


% PASO 2.4.- COMPLETAMOS CON LA LONGITUD DEL MENSAJE ORIGINAL COMO UN ENTERO 
% DE 64 BITS -->8 bytes -->dos palabras : little endian.
mensaje = [vectorfinal, mod(bytelen*8, m), mod((bytelen*8) / m, m)];
mensaje
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PASO 3.- REALIZAMOS LA FUNCION HASH
% TRABAJAMOS CON CADA BLOQUE DE  512 bit
% TENEMOS ENTEROS DE 32 BITS (UNA PALABRA). CADA BLOQUE TIENE 16 ELEMENTOS
% (PALABRAS)

for k = 1:16:numel(mensaje)
    a = fhash(1); b = fhash(2); c = fhash(3); d = fhash(4);
    for i =1:64
        % Convertimos b, c y d a vectores fila  de bits.
        bv = dec2bin(b, 32) - '0';
        cv = dec2bin(c, 32) - '0';
        dv = dec2bin(d, 32) - '0';
        % obtenemos  f  = mix de b, c, d.
        %      ki = indice  0:15, del mensaje (k + ki).
        %      sr = filas 1:4, de  s(sr, :).
        if i <= 16          % ronda 1
            f = (bv & cv) | (~bv & dv);
            ki = i - 1;
            sr = 1;
        elseif i <= 32      % ronda 2
            f = (bv & dv) | (cv & ~dv);
            ki = mod(5 * i - 4, 16);    %de 5 en 5 empezando en 1
            sr = 2;
        elseif i <= 48      % ronda 3
            f = xor(bv, xor(cv, dv));
            ki = mod(3 * i + 2, 16);    %de 3 en 3 empezando en 5
            sr = 3;
        else                % ronda 4
            f = xor(cv, bv | ~dv);
            ki = mod(7 * i - 7, 16);    %de 7 en 7 empezando en 0
            sr = 4;
        end
        % Convertimos f, DE VECTOR FILA DE BITS A ENTEROS DE 32-bit 
        auxiliar='';
        for r=1:length(f)
            auxiliar=[auxiliar num2str(f(r))];
        end
        f=bin2dec(auxiliar);
        %k+ki
        % HACEMOS LA ROTACIONES
        sc = mod(i - 1, 4) + 1;
        sum = mod(a + f + mensaje(k + ki) + t(i), m);
        sum = dec2bin(sum, 32);
        sum = circshift(sum, [0, s(sr, sc)]);
        sum = bin2dec(sum);
        % ACTUALIZAMOS  a, b, c, d.
        aux=d;
        d=c; 
        c=b;
        b=mod(b + sum, m);
        a=aux;
    end
    % MODIFICAMOS EL HASH.
    fhash(1)=mod(a+fhash(1),m);
    fhash(2)=mod(b+fhash(2),m);
    fhash(3)=mod(c+fhash(3),m);
    fhash(4)=mod(d+fhash(4),m);
       
end

% CONVERTIMOS HASH DE ENTEROS DE 32 BITS  , LITTLE ENDIAN, A BYTES .

fhash=dec2bin(fhash,32);
ffinal=[];
for i=1:4
   for j=32:-8:7
        ffinal=[ffinal bin2dec(fhash(i,j-7:j))];
   end
end
       
               
% CONVERTIMOS HASH A HEXADECIMAL.
ffinal = dec2hex(ffinal);
mensajehash='';
for i=1:length(ffinal)
    mensajehash=[mensajehash ffinal(i,:)];
end
disp('EL MENSAJE ENCRIPTADO ES:');
display(mensajehash);



