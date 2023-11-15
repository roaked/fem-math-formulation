function [Je, J] = rigidezJ (solucao_nodal, a, b, n_elementos, matriz_de_incidencias )

%fun��o que devolve como vari�veis de sa�da as contribui��es de cada elemento para o
%Je e que calcula a constante de tor��o J do material
J = 0;
for i = 1:n_elementos %percorre at� o numero de elementos
    Je(i) = 1/2*a(i)*b(i)*(solucao_nodal(matriz_de_incidencias(i,1)) + solucao_nodal(matriz_de_incidencias(i,2))...
    + solucao_nodal(matriz_de_incidencias(i,3)) + solucao_nodal(matriz_de_incidencias(i,4)));       
    %calculo da contribui��o Je correspondente a cada elemento
    
    J = J + Je(i);  %obten��o do valor de J total
end

end
