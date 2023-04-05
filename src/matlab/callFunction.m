function varargout = callFunction(functionName, varargin)
% Function to call a method of a specified class
% Inputs:
%   functionName: the name of the method to call
%   varargin: any additional arguments to pass to the method
% Usage:
%   result = callMethod('myFunction', arg1, arg2, ...)

% Call the specified method with the additional arguments
[varargout{1:nargout}] = feval(functionName, varargin{:});
end
