function [centro_max,centro_min,tensao_max,tensao_min,tensaoxy,tensaoxz,tensaoyz] = Tensoes(n_elementos, matriz_dos_nos, matriz_de_incidencias,a,b,J,solucao_nodal)
%funcao que calcula a intensidade das tensoes de corte existentes e
%localiza a posi�ao da tensao m�xima e minima

tensaoxz = zeros(n_elementos,1); %inicializa��o a zeros de um array com n_elementos 
tensaoxy = zeros(n_elementos,1); %inicializa��o a zeros de um array com n_elementos
tensaoyz = zeros(n_elementos,1); %inicializa��o a zeros de um array com n_elementos

for i = 1:n_elementos %percorre at� ao numero de elementos
    
    x = a(i)/2; %coordenadas do centro
    y = b(i)/2;
    df1y = (1-x/a(i))*(-1/b(i));  %defini��o das derivadas da fun��o de                                     
    df2y = (-x/(a(i)*b(i)));      %forma para somar no vetor
    df3y = x/(a(i)*b(i));
    df4y = (1-x/a(i))*1/b(i);
    
    df1x = (1-y/b(i))*(-1/a(i));
    df2x = (1-y/b(i))*(1/a(i));
    df3x = y/(a(i)*b(i));
    df4x = -y/(a(i)*b(i));
    
    %calculo das tensoes a partir das formulas te�ricas (ver relat�rio)
    
    tensaoxz(i) = (1/J)*(solucao_nodal(matriz_de_incidencias(i,1))*df1y...
    + solucao_nodal(matriz_de_incidencias(i,2))*df2y + solucao_nodal(matriz_de_incidencias(i,3))*df3y...
    + solucao_nodal(matriz_de_incidencias(i,4))*df4y);

    tensaoyz(i) = (-1/J)*(solucao_nodal(matriz_de_incidencias(i,1))*df1x...
    + solucao_nodal(matriz_de_incidencias(i,2))*df2x + solucao_nodal(matriz_de_incidencias(i,3))*df3x...
    + solucao_nodal(matriz_de_incidencias(i,4))*df4x);
    
    %determina��o dos m�dulos de tens�o obtido pela soma das duas tens�es
    tensaoxy(i) = (sqrt((tensaoxz(i))^2 + (tensaoyz(i))^2));
end


tensao_max = max(tensaoxy);  %c�lculo da tens�o m�xima
tensao_min = min(tensaoxy);  %c�lculo da tens�o minima

for j = 1:n_elementos %percorre at� n� elementos
    if tensaoxy(j) == tensao_max
        emax = j; %obten��o do numero do elemento onde a tens�o � m�xima
    end
    if tensaoxy(j) == tensao_min
        emin = j;  %obten��o do numero do elemento onde a tens�o � minima
    end
end

%c�lculo do centro do elemento onde existe a tens�o m�xima e m�nima
centro_max(1) = matriz_dos_nos(matriz_de_incidencias(emax,2),2)-(a(emax))/2;              %obten��o das coordenadas do centro geom�trico do elemento que cont�m a tens�o m�xima
centro_max(2) = matriz_dos_nos(matriz_de_incidencias(emax,4),3)-(b(emax))/2;
centro_min(1) = matriz_dos_nos(matriz_de_incidencias(emin,2),2)-(a(emin))/2;              %obten��o das coordenadas do centro geom�trico do elemento que cont�m a tens�o minima
centro_min(2) = matriz_dos_nos(matriz_de_incidencias(emin,4),3)-(b(emin))/2;

end
