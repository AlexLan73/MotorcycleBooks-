classdef TestB
    properties
        ta TestA
    end
    
    methods
        function obj =  TestB(dan)
            obj.ta = TestA(dan)
        end
        
        function z = Get(obj)
            z= obj.ta.Get("12aaa1111")
        end
    end
    
end

