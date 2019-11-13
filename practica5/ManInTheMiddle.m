p=input('Introduce un numero primo:');
while(not(isprime(p)))
    p=input('El valor no es un numero primo. Introduce un numero primo:'); 
end    
g=input('Introduce un numero generador de p:');
while(genera(g,p)==0)
    g=input('El valor no es un generador.Introduce un numero generador de p:'); 
end    

mensajegp=['Nos ponemos de acuerdo en g= ',num2str(g),' y p=',num2str(p)];
disp(mensajegp); 
disp(newline )
%Creamos tres n�meros aleatorios, uno para A, otro para B y otro para C
r = randi([2 p-3],1,3);

transmision_A=potencia(g,r(1),p);
transmision_B=potencia(g,r(2),p);
transmision_C=potencia(g,r(3),p);
cCapturado=zeros(2);


mensajeA=['A elige ',num2str(r(1)),' y transmite a B ',num2str(transmision_A)];
primeraCapturaC=['El intruso captura el mensaje de A:',num2str(transmision_A),' y lo guarda'];
cCapturado(1)=transmision_A;
mensajeC=['El intruso genera ',num2str(r(3)),' y transmite a B ',num2str(transmision_C)];

disp(mensajeA);
disp(primeraCapturaC);
disp(mensajeC);
disp('(B piensa que recibe de A)');
disp(newline);

mensajeB=['B genera un n�mero aleatorio ',num2str(r(2)),' y transmite ',num2str(transmision_B)];
segundaCapturaC=['El intruso captura el mensaje de B:',num2str(transmision_B),' y lo guarda'];
cCapturado(2)=transmision_B;
mensajedeAaC=['El intruso envia tambien a A ',num2str(transmision_C)];


disp(mensajeB);
disp(segundaCapturaC);
disp(mensajedeAaC);
disp('(A piensa que recibe de B)');

disp(newline )
disp('A y B calculan la clave com�n con los datos que tienen (Los de C)');
potencA=potencia(transmision_C,r(1),p);
potencB=potencia(transmision_C,r(2),p);
mensajeclaveA=['A obtiene ',num2str(potencA),' como clave'];
mensajeclaveB=['B obtiene ',num2str(potencB),' como clave'];
disp(mensajeclaveA)
disp(mensajeclaveB)
disp(newline)

disp("EL INTRUSO CALCULA TAMBI�N LAS CLAVES")
potencAC=potencia(cCapturado(1),r(3),p);
potencBC=potencia(cCapturado(2),r(3),p);
mensajeclaveAC=['Sabe que A obtuvo ',num2str(potencAC),' como clave'];
mensajeclaveBC=['Sabe que B obtiene ',num2str(potencBC),' como clave'];
disp(mensajeclaveAC)
disp(mensajeclaveBC)
