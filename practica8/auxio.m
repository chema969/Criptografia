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
% Hash  del emnsaje
t = fix(abs(sin(1:64)) .* m)

% PASO 1.5.- INICIALIZAMOS LA HASH
% MD5 utiliza las cuatro palabras siguientes:
% A=01 23 45 67 pero en Little endian:67 45 23 01
% B=89 ab cd ef --> ef cd ab 89 
% C=fe dc ba 98 --> 98 ba dc fe
% D=76 54 32 10 --> 10 32 54 76


mensaje = abs(mensaje)
bytelen = numel(mensaje)

if(mod(numel(mensaje),64)==56)
    mensaje=[0 mensaje];
end

while(mod(numel(mensaje),64)~=55)
    mensaje=[0 mensaje];
end
mensaje=[128 mensaje];
mod(numel(mensaje),64)
segundolen = numel(mensaje);
matrizaux=zeros(4,segundolen/4);
i=1;
j=1;
while(i<segundolen)
    matrizaux(:,j)=mensaje(i:i+3);
    i=i+4;
    j=j+1;
end
vectorfinal=[];
for i=1:length(matrizaux(1,:))
    aux='';
    for j=4:-1:1
       aux=[aux dec2bin(matrizaux(j,i),8)]; 
    end
    vectorfinal=[vectorfinal bin2dec(aux)];
end

bitlen=dec2bin(bytelen,64)
aux=[]

for i=32:-8:7
    aux=[aux bitlen(i-7:i)]
end
vectorfinal=[vectorfinal bin2dec(aux)]
aux=[]
for i=64:-8:33
    aux=[aux bitlen(i-7:i)]
end
vectorfinal=[vectorfinal bin2dec(aux)]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
