function varargout = callMethod(classInstance, methodName, varargin)
% Function to call a method of a specified class
% Inputs:
%   classInstance: an instance of the class containing the method
%   methodName: the name of the method to call
%   varargin: any additional arguments to pass to the method
% Usage:
%   result = callMethod(myInstance, 'myMethod', arg1, arg2, ...)

% Call the specified method with the additional arguments
[varargout{1:nargout}] = feval(methodName, classInstance, varargin{:});
end
