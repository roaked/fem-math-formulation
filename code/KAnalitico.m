function [K] = KAnalitico(matriz_de_incidencias,n_nos,a,b,propriedades)
%fun��o  que calcula a matriz de rigidez globais para tipo de integra��o
%anal�tico

%Retangulo:
% n�s:
% 4 3
% 1 2

%Integral Anal�tico
k = propriedades(1,2);  %k=1
K = zeros(n_nos); %inicializa��o a zeros com o comprimento igual ao n� de n�s
ke = zeros(4); %inicializa��o a zeros com o comprimento igual a 4

for i = 1:1:size(matriz_de_incidencias) %percorre at� ao n� de elementos
    c = matriz_de_incidencias(i,1:4); %guarda os valores dos n�s associados ao elementos i
    c1 = c(1,1);%n� #1 do elemento i
    c2 = c(1,2);%n� #2 do elemento i
    c3 = c(1,3);%n� #3 do elemento i
    c4 = c(1,4);%n� #4 do elemento i
    
    %matriz de rigidez elementar 
    ke(c1,c1) = k/(6*a(i)*b(i)) * 2*(a(i)^2 + b(i)^2);
    ke(c1,c2) = k/(6*a(i)*b(i)) * (a(i)^2 - 2*b(i)^2);
    ke(c1,c3) = k/(6*a(i)*b(i)) * (-1)*(a(i)^2 + b(i)^2);
    ke(c1,c4) = k/(6*a(i)*b(i)) * (-2*a(i)^2 + b(i)^2);
    
    %matriz tem coeficientes repetidos
    ke(c2,c1) = ke(c1,c2);
    ke(c2,c2) = ke(c1,c1);
    ke(c2,c3) = ke(c1,c4);
    ke(c2,c4) = ke(c1,c3);
    
    ke(c3,c1) = ke(c1,c3);
    ke(c3,c2) = ke(c2,c3);
    ke(c3,c3) = ke(c1,c1);
    ke(c3,c4) = ke(c1,c2);
    
    ke(c4,c1) = ke(c1,c4);
    ke(c4,c2) = ke(c2,c4);
    ke(c4,c3) = ke(c3,c4);
    ke(c4,c4) = ke(c1,c1);
        
    for o = [c1,c2,c3,c4] %assemblagem da matriz de rigidez elementar para matriz rigidez global
        for j = [c1,c2,c3,c4]
            K(o,j) = K(o,j) + ke(o,j); 
        end
    end
end

