function [solucao_nodal] = Solver(K,F,cfronteira,n_nos)
%funcao que devolve a solucao em cada n�

nos_scf = n_nos-length(cfronteira);%n�s sem condi�ao de fronteira a 0
Kred = zeros(nos_scf);%inicializa��o a zeros do Kred
Fred = zeros(nos_scf,1);%inicializa��o a zeros do Fred

vaux = [];                                           
for p = 1:1:n_nos  %cria��o de um vetor que cont�m os �ndices dos n�s em que n�o exixtem
                    %condi��es de fronteira
    o = find(cfronteira(:,1)==p,1);
    if isempty(o)
        vaux = [vaux p];
    end
end 


for i = 1:1:length(vaux) %percorre at� ao n� de n�s que n�o t�m condi��o de fronteira
    for p = 1:length(vaux) 
        %neste ciclo � criada a matriz de rigidez Kred que corresponde � matriz global
        %j� sem as linhas e colunas onde as solu��es nodais s�o nulas
        Kred(i,p) = K(vaux(i),vaux(p)); 
        
    end
end
for z = 1:1:length(vaux) %neste ciclo � executado exatamente o mesmo processo mas                                          
    Fred(z,1) = F(vaux(z),1);  %agora para o vetor de cargas global
end                                            
psis = (Kred^-1)*Fred;  %calcula da solu��o atrav�s da inversa da matriz global
solucao_nodal = zeros(n_nos,1);
for z = 1:1:length(vaux)
    solucao_nodal(vaux(z)) = psis(z); %cria��o e apresenta��o do vetor com a solu��o total 
                                      %(incluindo os n�s em que esta � nula)
end


end

