function saveVar(var, varname, filename)
% Function to save a variable to a file with a specified name
% Inputs:
%   var: the variable to save
%   varname: the name of the variable to use when saving
%   filename: the name of the file to save to
% Usage:
%   saveVariable(myVariable, 'myVariable', 'myVariableFile.mat')

% Create a struct with the variable and the desired field name
structToSave.(varname) = var;

% Save the struct to the specified file
save(filename, '-struct', 'structToSave');
end