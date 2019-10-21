function factores_c=factorescomunes (w , s)
for i=1:length(s)
    if(gcd(w,s(i))~=1)
        factores_c=true;
        return;
    end
end
factores_c=false;
end