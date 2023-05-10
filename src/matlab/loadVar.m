function var = loadVar(filepath, varName)
% Function to load variables from a file and assign them to the base workspace
% Inputs:
%   filepath: the path of the Matlab variable to load
%   varName: the name of the variable to use when loading

S = load(filepath);
var = S.(varName);
varNames = fieldnames(S);
for i = 1:length(varNames)
    % Check if the variable is a class object
    if isstruct(S.(varNames{i})) && isfield(S.(varNames{i}), 'ClassName')
        % Load the class object and assign it to a variable in the base workspace
        assignin('base', varNames{i}, eval(S.(varNames{i}).ClassName));
        eval([varNames{i} ' = S.(varNames{i});']);
    else
        % Assign the variable to the base workspace
        assignin('base', varNames{i}, S.(varNames{i}));
    end
end
end
