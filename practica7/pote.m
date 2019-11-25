function n = pote (A, m)
I=[1,0;0,1];
aux=A;
for i=1:power(m,4)
   if(I==aux)
       n=i;
       return;
   end
   aux=mod(aux*A,m);

end
n=0;
end