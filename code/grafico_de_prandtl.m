function grafico_de_prandtl(solucao_nodal,n_nos,matriz_dos_nos,tipoint)

%fun��o que representa o valor da fun��o de prandtl

X = unique(matriz_dos_nos(:,2));                %regista os valores �nicos da coordenada x de cada n�
Y = unique(matriz_dos_nos(:,3));                 %regista os valores �nicos da coordenada y de cada n�
[Xmesh,Ymesh] = meshgrid(X,Y);                    %cria��o de uma matriz a partir dos valores de x e y
Z = zeros(size(Xmesh));                         %inicializa��o a zeros de uma matriz com o comprimento de Xmesh
for i=1:numel(Xmesh)                            %percorre at� ao n�mero de elementos do Xmesh
    for j=1:n_nos                                %percorre at� ao n�mero de n�s
        if matriz_dos_nos(j,2)==Xmesh(i) && matriz_dos_nos(j,3)==Ymesh(i)  
            %substitui o valor da solu��o nodal na matriz se as coordenadas
            %desse n�, corresponderem �s da matriz criada
            Z(i)=solucao_nodal(j);
        end
    end
end

figure
hold on
surfc(Xmesh,Ymesh,Z);   %comando que gera a superficie e as isolinhas por baixo desta(usar rotate3d)
colorbar;

if tipoint == 1
    title('Solu��o Nodal - Integra��o anal�tica');
elseif tipoint == 2
    title('Solu��o Nodal - Integra��o Gauss 2x2');
elseif tipoint == 3
    title('Solu��o Nodal - Integra��o Gauss 2x1');
elseif tipoint == 4
    title('Solu��o Nodal - Integra��o Gauss 1x2');
elseif tipoint == 5
    title('Solu��o Nodal - Integra��o Gauss 1x1');
end
%view(3);
%rotate3d on;



end

