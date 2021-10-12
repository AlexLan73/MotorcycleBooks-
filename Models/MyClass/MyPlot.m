classdef MyPlot  < handle
    
    properties
        tt, im, jm, m, mtitle, verMatlab, nametitle
    end
    
    methods
         function obj =  MyPlot(ttime, m, mtitle, nametitle, verMatlab)
             obj.tt = ttime;
             [obj.im, obj.jm] = size(m);
             obj.m = m;
             obj.mtitle = mtitle;
             
            if exist('nametitle')>0
                             obj.nametitle = nametitle;
                         else
                             obj.nametitle = "";
            end

            if exist('verMatlab')>0
                             obj.verMatlab = 1;     % старый вариант
                         else
                             obj.verMatlab = 0;     % новый вариант
            end
             
         end        
        
         function AllPlot(obj)
             if obj.verMatlab >0
                for i=1:obj.im
                    figure
                    plot(obj.tt, obj.m(i,:))
                    title(obj.nametitle+ "   "+ obj.mtitle(i))
                    grid()
                end
             else
                 %  для новой версии matlab
                figure
                for i=1:obj.im
                    nexttile
                    plot(obj.tt, obj.m(i,:))
                    title(obj.nametitle+ "   "+ obj.mtitle(i))
                    grid()
                end
             end
             
            
         end        
         
        %myFFT = MyFFT(DanConvert.Time, DanConvert.XYZg.YawAcc, step, nfft, limit); 
    end
    
end

