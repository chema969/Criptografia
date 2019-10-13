function inver=inv_modulo (A, m)
 if(length(A)~=length(A(:,1)))
     disp('la matriz no es cuadrada');
     inver=0;
 else
   if(all(all(mod(A,1))))
       disp('la matriz no es de enteros');
       inver=0;    
   else
       A=mod(A,m);
       determinante=det(A);
       [mcd,invers]=gcd(int32(determinante),m);
       if(mcd~=1||determinante==0)
          disp('la matriz no es inversible modulo '+m);
          inver=0;
       else
           
           inver=mod(int32(inv(A)*determinante)*invers,m);
       end
   end
 end
 
 
 
 end