function [F] = Forcas(matriz_de_incidencias,n_nos,a,b,carregamentos )
%Retangulo: (importante)
% n�s:
% 4 3
% 1 2

f = carregamentos(:,2);               %guarda os valores da intensidade do carregamento por cada elemento
F = zeros(n_nos,1);                     %incializa��o a zeros de uma matriz com n_nos linhas
fe = zeros(4,1);                        %inicializa��o a zeros de uma matriz com 4 linhas

for i = 1:1:size(matriz_de_incidencias) %percorre at� ao n� de elementos
    c = matriz_de_incidencias(i,1:4);   %guarda os valores dos n�s associados ao elementos i
    c1 = c(1,1); %n� #1 do elemento i
    c2 = c(1,2); %n� #2 do elemento i 
    c3 = c(1,3); %n� #3 do elemento i
    c4 = c(1,4); %n� #4 do elemento i
    
    %vetor de cargas elementar
    fe(c1) = f(i)*a(i)*b(i)/4;
    fe(c2) = f(i)*a(i)*b(i)/4;
    fe(c3) = f(i)*a(i)*b(i)/4;
    fe(c4) = f(i)*a(i)*b(i)/4;
    
    for o = [c1,c2,c3,c4]               %assemblagem do vetor de cargas elementares para o vetor de cargas global
        F(o) = F(o) + fe(o); 
    end
end


end