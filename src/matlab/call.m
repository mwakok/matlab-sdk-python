function varargout = call(varargin)
% Function to call a function or method of a specified class
%
% Parameters
% ----------
% *varargin: Any
%   arguments to pass to the method
%
% Returns
% -------
% *varargout : Any
% 
% Examples
% --------
% Make a call to a Matlab function 
% >>>  result = call('myFunction', arg1, arg2, ...)
%
% Make a call to a Matlab class method
% >>>  result = call('myMethod', myInstance, arg1, arg2, ...)

% Call the specified function or method with the additional arguments
[varargout{1:nargout}] = feval(varargin{:});
end
    