% Universidad Finis terrae - 2021
% Departamento de Ingeniería Civil.
% Curso: Cálculo vectorial
% Equipo:
%     Kevin Castillo - Damaris Silva - Guillermo Herrera 
%     Astrid Merino - Kevin Díaz
% Profesor: Sebastián Azocar
% Ayudante: Mirko Maturana
%
% Descripción: Este código selecciona 100 puntos aleatorios dentro del
% departamento a modelar junto a su intensidad asociada por cada punto
% coordenado, los datos son exportados a dataframe.mat.
% Nota: Para que funcione tiene que generar la figura utilizando el script
% Multiwall_modelV02.m en conjunto con un cursor_info que se tiene que
% generar a partir de la misma figura.

% Actividad 1. Selección aleatoria de puntos.

% dimensiones de la casa en cm
x_dim = 1500;
y_dim = 800;

% vectores donde se almacenarán los puntos e
% intensidades
X = []; Y = []; V = [];

% pickea 100 puntos aleatorios basado en cada cm
for rep = 1:100
    % Obtiene posiciones aleatorias para x e y
    pos_x = randi([1, x_dim]);
    pos_y = randi([1, y_dim]);
    
    X(end+1) = pos_x;
    Y(end+1) = pos_y;
    
    %crea un datatip
    datatip(cursor_info.Target, pos_x, pos_y);
end

% esquema de colores
color_schema = linspace(-74, -46, 256);

% Obtiene toda la info de todos los datatips
dth = findobj(fig,'Type','DataTip');
if isempty(dth)
    fprintf('No existen datatips en la figura actual.\n')
else
    % dtArray es el array que se corresponde a cada datatip
    dtArray = [{newline};reshape([{dth.Content}',repelem({newline},numel(dth),1)]',[],1)];
end

for iprop = 2:2:length(dtArray)
    thisprop = dtArray{iprop};
    index = str2double(extractAfter(thisprop{2},"Index ")); %indice del dataTip
    V(end+1) = color_schema(index+1); % intensidad de la señal en dB
end
V = fliplr(V);

% generación y guardado del dataframe
dataframe = [X; Y; V];
save('dataframe.mat','dataframe')
