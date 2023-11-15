function grafico_isolinhas(n_elementos,matriz_dos_nos,centroX,centroY,tensaoxy,n_nos,tipoint)

%fun��o que aprensenta graficamente as v�rias isolinhas

X = unique(centroX);                  %regista os valores �nicos da coordenada x do centro de cada elemento
Y = unique(centroY);                   %regista os valores �nicos da coordenada y do centro de cada elemento
numelX = numel(X);                        %numero de elementos de X
numelY = numel(Y);                       %numero de elementos de Y

for i = 1:n_nos                             %ciclo que percorre at� ao n�mero de n�s
    X(numelX+i) = matriz_dos_nos(i,2);  %adi��o das coordenadas dos n�s a X
    Y(numelY+i) = matriz_dos_nos(i,3);  %adi��o das coordenadas dos n�s a Y
end

X = unique(X);                                      
Y = unique(Y);
[Xmesh,Ymesh]=meshgrid(X,Y);       %cria��o de uma matriz a partir dos valores �nicos dos centros e n�s de x e y
tmod = zeros(size(Xmesh));         %inicializa��o do array mod com a dimens�o de Xmesh a zeros

for i=1:numel(Xmesh)                %ciclo que percorre at� ao n� elementos no array Xmesh
    for j=1:n_elementos              %ciclo que percorre at� ao n� elementos total
        if centroX(j)==Xmesh(i) && centroY(j)==Ymesh(i)  
            %substitui o valor do m�dulo na matriz se ambas as coordenadas do 
            %elementos corresponderem �s da matriz gerada no meshgrid
            tmod(i)=tensaoxy(j);
        end
    end
end

[l,c] = size(tmod); %cria��o de uma matriz com as mesmas dimens�es de tmod
isolinhas = tmod;   %colunas                                                         
for i = 2:(l-1)    %percorre da segunda linha at� ao n�mero de linhas - 1
    for j = 2:(c-1)  %percorre da segunda coluna at� ao n�mero de colunas - 1
        if tmod(i,j) == 0 && tmod(i,j-1) ~= 0 && tmod(i,j+1) ~= 0  %se o m�dulo da tens�o de corte for zero e estiver entre duas colunas com valores diferentes de zero
                   isolinhas(i,j) = (tmod(i,j-1) + tmod(i,j+1))/2;  %calcular a m�dia
            
        end
    end
end
tmod = isolinhas;   %linhas
for i = 2:(l-1)
    for j = 2:(c-1)
        if tmod(i,j) == 0 && tmod(i-1,j) ~= 0 && tmod(i+1,j) ~= 0  %se o m�dulo da tens�o de corte for zero e estiver entre duas linhas com valores diferentes de zero
                   isolinhas(i,j) = (tmod(i+1,j) + tmod(i-1,j))/2;  %calcular a m�dia
           
        end
    end
end   

figure
hold on
contour3(Xmesh,Ymesh,isolinhas,150);   %representa��o das isolinhas e respetiva intensidade
colorbar;                              %ver colorbar

if tipoint == 1
    title('Isolinhas de Tens�o - Integra��o anal�tica');
elseif tipoint == 2
    title('Isolinhas de Tens�o - Integra��o Gauss 2x2');
elseif tipoint == 3
    title('Isolinhas de Tens�o - Integra��o Gauss 2x1');
elseif tipoint == 4
    title('Isolinhas de Tens�o - Integra��o Gauss 1x2');
elseif tipoint == 5
    title('Isolinhas de Tens�o - Integra��o Gauss 1x1');
end

%rotate3d on;
%view(3);

end
