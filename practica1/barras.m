function  comparo=barras (v)
%BARRAS
%Funcion que realiza una comparacion grafica de la frecuencia de un texto v
%y la frecuencia de las letras en castellano
%Parametros:
%v: Texto del que se sacara la frecuencia
[f,aux]=cripto_ana_orden(v);
%Introducimos la frecuencia en espa�ol
frecuencia_esp=[0.1253,0.0142,0.0468,0.0586,0.1368,0.0069,0.0101,0.0070,0.0625,0.0044,0.0001,0.0497,0.0315,0.0671,0.0031,0.0868,0.0251,0.0088,0.0687,0.0798,0.0463,0.0393,0.0090,0.0002,0.0022,0.0090,0.0052;0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
frecuencia_esp_ordenada=transpose(frecuencia_esp);
%Ordenamos de m�s a menos frecuenci
frecuencia_esp_ordenada=transpose(sortrows(frecuencia_esp_ordenada,'descend'));
%Creamos en x un vector de 0 a 26 de uno en uno.
x = 0:1:26;

%Creamos los subplots
subplot(2,1,1);
bar(x,frecuencia_esp(1,:),'r');
title('Frecuencia de las letras en espanyol');
subplot(2,1,2); 
bar(x,f(1,:));
title('Frecuencia de las letras en nuestro texto');
%mostramos el diaframa de barras y devolvemos las frecuencias ordenadas.
comparo=[frecuencia_esp_ordenada;aux];
end