function cifrado=cifroMochilaSuper (s,texto)
 if(mochila(s))
     %Si es una mochila supercreciente
     cifrado=cifr_mochila(s,texto);
 else
     if(condiciones(s))
         disp("La mochila no es supercreciente");
     end
     cifrado=0;
 end


end