p=input('Introduce un numero primo:');
while(not(isprime(p)))
    %Mientras no sea primo
    p=input('Introduce un numero primo:'); 
end    
g=input('Introduce un numero generador:');
while(genera(g,p)==0)
    %Mientras no sea un generador de p
    g=input('Introduce un numero generador:'); 
end    

mensajegp=['Nos ponemos de acuerdo en g= ',num2str(g),' y p=',num2str(p)];
disp(mensajegp); 
disp(newline )

%Creamos un vector con dos valores aleatorios, r(1) para A y r(2) para B
r = randi([2 p-1],1,2);
transmision_A=potencia(g,r(1),p);
transmision_B=potencia(g,r(2),p);
mensajeA=['A elige ',num2str(r(1)),' y transmite a B ',num2str(transmision_A)];
mensajeB=['B elige ',num2str(r(2)),' y transmite a A ',num2str(transmision_B)];
disp(mensajeA);
disp(mensajeB);
disp(newline )


disp('A y B calculan la clave común');
potencA=potencia(transmision_B,r(1),p);
potencB=potencia(transmision_A,r(2),p);
mensajeclaveA=['A obtiene ',num2str(potencA),' como clave'];
mensajeclaveB=['B obtiene ',num2str(potencB),' como clave'];
disp(mensajeclaveA)
disp(mensajeclaveB)
