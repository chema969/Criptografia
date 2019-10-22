function s=cripto_shamir_zippel (cpubl, mu)
[a,invb2]=gcd(cpubl(2),mu);
q=mod(cpubl(1)*invb2,mu);
entrada=1;
multiplo=1;
while(entrada==1)
    tic;
r=zeros(1,power(2,length(cpubl)+multiplo));
for i=1:power(2,length(cpubl)+multiplo)
    r(i)= mod(q*i,mu);  
end
r=sort(r);
rango=['Rango[1,',num2str(length(r)),']'];
disp(rango);

for i=1:length(r)
   mochila=zeros(1,length(cpubl));
   mochila(1)=r(i);
   [a,inva1]=gcd(r(i),mu);
   w=mod(inva1*cpubl(1),mu);
   [a,invw]=gcd(w,mu);
   for j=2:length(cpubl)
      mochila(j)=mod(invw*cpubl(j),mu); 
   end
   if(supercreciente(mochila))
      s=mochila;
      tiempo=toc;
      mensajeTiempo=['Time elapsed=',num2str(tiempo)];
      disp(mensajeTiempo);
      return;
   end
end
 tiempo=toc;
      mensajeTiempo=['Time elapsed=',num2str(tiempo)];
      disp(mensajeTiempo);
multiplo=multiplo +1;
entrada=input("no hemos encontrado la mochila, si quieres ampliar el rango, responde 1: ");
end

end