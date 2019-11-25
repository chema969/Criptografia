function arnold (foto, A)
aux=input('Introduce un 1 si quieres desordenar, o un 2 si quieres ordenar: ');
switch aux
    case 1
        desorden_pixel(foto,A)
        matriz = getappdata (gcf, 'matriz');
        imshow(matriz);
    case 2
        fotografia=imread(foto);
        m=size(fotografia,1);
        desorden_pixel(foto,inv_modulo(A,m));
        matriz = getappdata (gcf, 'matriz');
        imshow(matriz);
    otherwise
        disp('Valor no valido')
end


end