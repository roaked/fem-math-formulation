function [centroX, centroY] = grafico_tensao_c(a,b,matriz_de_incidencias,matriz_dos_nos,n_elementos,tensaoxz,tensaoyz,tipoint)

%fun��o que permite visualizar o gr�fico com os vetores das tens�es de corte
%e a respetiva localiza��o do centro de cada elemento

centroX = zeros(n_elementos,1);         %iniciliza��o a zero do array centroX
centroY = zeros(n_elementos,1);         %iniciliza��o a zero do array centroY
figure

%o ciclo seguinte percorre v�rios elementos at� ao �ltimo
%e vai unindo os v�rios n�s (4) que est�o associados a um dado elemento z

for z = 1:n_elementos   %este ciclo percorre v�rios elementos at� ao �ltimo e representa
                        %um ret�ngulo com os v�rios n�s (4) que est�o associados a um dado elemento z                                                   
        
        rectangle('Position',[matriz_dos_nos(matriz_de_incidencias(z,1),2),...
        matriz_dos_nos(matriz_de_incidencias(z,1),3), a(z), b(z)]);
        hold on    
end

for j = 1:n_elementos   %determina��o do centro de coordenadas (x,y) para 
                        %cada elemento j, at� ao n� m�ximo de elementos (n_elementos)
                        
    centroX(j) = matriz_dos_nos(matriz_de_incidencias(j,2),2)-(a(j))/2;
    centroY(j) = matriz_dos_nos(matriz_de_incidencias(j,4),3)-(b(j))/2;
   
end

%representa��o gr�fica das dire�oes e intensidades das tens�es de corte
%partindo do centro do elemento i
quiver(centroX,centroY,tensaoxz,tensaoyz)

%dependendo do tipo de integra��o escolhida no MainMC, o display
%da figura ser� diferente 

if tipoint == 1   
    title('Tens�es de corte - Integra��o anal�tica');
elseif tipoint == 2
    title('Tens�es de corte - Integra��o Gauss 2x2');
elseif tipoint == 3
    title('Tens�es de corte - Integra��o Gauss 2x1');
elseif tipoint == 4
    title('Tens�es de corte - Integra��o Gauss 1x2');
elseif tipoint == 5
    title('Tens�es de corte - Integra��o Gauss 1x1');
end

end 
 
