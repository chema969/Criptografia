function mat_per=matper (p)
%MATPER
%Funcion que la matriz de permutaciones
%Parametros:
%p: vector de numeros que debe se una permutacion
if(permutacion_v(p))
   %Si es una permutacion, creo la matriz y voy poniendo 1 en las
   %posiciones indicadas por cada p(i)
   mat_per= zeros(length(p),length(p));
   for i=1:length(p)
       mat_per(i,p(i))=1;
   end
else
    disp("No es una permutacion");
    mat_per=0;
end
end