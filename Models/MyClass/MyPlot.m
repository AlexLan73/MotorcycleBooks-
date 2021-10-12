classdef MyPlot  < handle
    
    properties
        tt, im, jm, m, mtitle,  setParamInfo
    end
    
    methods
         function obj =  MyPlot(ttime, m, mtitle, setparaminfo)
             obj.setParamInfo = setparaminfo;
             obj.tt = ttime;
             [obj.im, obj.jm] = size(m);
             obj.m = m;
             obj.mtitle = mtitle;
             
         end        
        
         function AllPlot(obj)
             if obj.setParamInfo.Ver < 2021
                for i=1:obj.im
                    figure
                    plot(obj.tt, obj.m(i,:))
                    title(obj.setParamInfo.Title + "   "+ obj.mtitle(i))
                    grid()
                end
             else       %  для новой версии matlab
                figure
                for i=1:obj.im
                    nexttile
                    plot(obj.tt, obj.m(i,:))
                    title(obj.setParamInfo.Title  +  "   "+ obj.mtitle(i))
                    grid()
                end
             end
         end        
    end
    
end

