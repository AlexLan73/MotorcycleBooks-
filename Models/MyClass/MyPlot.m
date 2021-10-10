classdef MyPlot  < handle
    
    properties
        tt, im, jm, m, mtitle
    end
    
    methods
         function obj =  MyPlot(ttime, m, mtitle)
             obj.tt = ttime;
             [obj.im, obj.jm] = size(m);
             obj.m = m;
             obj.mtitle = mtitle;
             
         end        
        
         function AllPlot(obj)
            figure
            for i=1:obj.im
                nexttile
                plot(obj.tt, obj.m(i,:))
                title(obj.mtitle(i))
                grid()
            end
            
         end        
        myFFT = MyFFT(DanConvert.Time, DanConvert.XYZg.YawAcc, step, nfft, limit); 
    end
    
end

