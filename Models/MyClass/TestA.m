classdef TestA 
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        danA
    end
    
    methods
        function obj =  TestA(dan)
            disp(" TestA(dan)  ")
            obj.danA = dan
        end
        
        function z = Get(obj, name)
            disp(" TestA.Get(dan)  ")
            disp(name)
            z = 1234
        end
    end
    
end

