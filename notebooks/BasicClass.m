classdef BasicClass
    % BasicClass Summary of the class goes here
    %   Detailed explanation


    properties
        Value {mustBeNumeric} % Value 
    end
    methods
        function obj = BasicClass(val)
            % Summary of the class constructor
            if nargin == 1
                obj.Value = val;
            end
        end
        function r = roundOff(obj)
            % Round value to the nearest hundredth
            r = round([obj.Value],2);
        end
        function r = multiplyBy(obj,n)
            % Multiply value with n
            r = [obj.Value] * n;
        end
        function r = plus(o1,o2)
            % Add two values
            r = [o1.Value] + [o2.Value];
        end
    end
end