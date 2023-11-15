function aux1(matriz_aux,n_elementos,tensaoxz,tensaoyz,tensaoxy,tensao_max,tensao_min,centro_max,J,centro_min,centroX,centroY)

% fun��o que cria o documento de texto da distribui��o de tens�es por elemento

rt = (76*10^9)*J; % c�lculo da rigidez torsional
fileID = fopen('Tens�es de corte por elemento e rigidez J.txt','w');
fprintf(fileID, '%s   %s       %s       %s       %s       %s\r\n','Elemento','Tens�oXZ','TensaoYZ','TensaoXY','CentroX','CentroY');           
%titulos das colunas
a = tensaoxz';
b = tensaoyz';
c = tensaoxy';
d = centroX';
e = centroY';
for i=1:n_elementos   %percorrer at� ao n�mero total de elementos
    fprintf(fileID, '\n%.1f      %f      %f      %f      %f      %f\r\n',matriz_aux(i,1),a(i),b(i),c(i),d(i),e(i));     
    %escrita das vari�veis pretendidas para cada elemento, linha a linha
end
fprintf(fileID,'\r\n');
fprintf(fileID,'\n\nO valor m�ximo de tens�o � %s Pa\n e situa-se no ponto de coordenadas x = %s m e y = %s m.\r\n',tensao_max,centro_max(1),centro_max(2));   %apresenta��o dos resultantes resultados pedidos no enunciado
fprintf(fileID,'\n\nO valor m�nimo de tens�o � %s Pa\n e situa-se no ponto de coordenadas x = %s m e y = %s m.\r\n',tensao_min,centro_min(1),centro_min(2));
fprintf(fileID,'\n\nO valor de constante de tor��o � %s m^4.\r\n', J);
fprintf(fileID,'\n\nO valor da Rigidez Torsional � %s Pa.m^4.\r\n', rt);
fclose(fileID);
end
