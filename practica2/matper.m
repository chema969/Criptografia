function mat_per=matper (p)
if(permutacion_v(p))
   mat_per= zeros(length(p),length(p));
   for i=1:length(p)
       mat_per(i,p(i))=1;
   end
else
    disp("No es una permutacion");
    mat_per=0;
end
end