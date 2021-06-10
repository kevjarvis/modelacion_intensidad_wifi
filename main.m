% Universidad Finis terrae - 2021
% Departamento de Ingeniería Civil.
% Curso: Cálculo vectorial
% Equipo:
%     Kevin Castillo - Damaris Silva - Guillermo Herrera 
%     Astrid Merino - Kevin Díaz
% Profesor: Sebastián Azocar
% Ayudante: Mirko Maturana
%
% Descripción: Código que carga los datos obtenidos por pick_random.m y
% grafíca la intensidad wifi que tiene la casa en 50 y 25 cm^2
% respectivamente
% NOTA: Ejecutar directamente este script si existe el archivo llamado
% dataframe.mat, no será necesario ejecutar pick_random

%posición del router: [120, 722]
load('dataframe.mat')

X = dataframe(1,:);
Y = dataframe(2,:);
V = dataframe(3,:);

% Actividad 2 - Gráfico de superficie a 50cm^2
[xq,yq] = meshgrid(1:50:1500, 1:50:800);

vq = griddata(X.',Y.',V.',xq,yq);
figure
plot3(X.',Y.',V.','o')
hold on
surf(xq,yq,vq)
title('Intensidad de señal WiFi (dB) en la casa cada 50cm^2');
xlabel('x (cm)') ;
ylabel('y (cm)');
zlabel('Intensidad (dB)')

% Actividad 3 - Gráfico de superficie a 25cm^2
[xq,yq] = meshgrid(1:25:1500, 1:25:800);
vq = griddata(X.',Y.',V.',xq,yq);
figure
plot3(X.',Y.',V.','o')
hold on
surf(xq,yq,vq)
title('Intensidad de señal WiFi (dB) en la casa cada 25cm^2');
xlabel('x (cm)');
ylabel('y (cm)');
zlabel('Intensidad (dB)')