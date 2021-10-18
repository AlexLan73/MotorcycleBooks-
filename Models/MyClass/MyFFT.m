classdef MyFFT  < handle
    properties
             dan, stepdan, nfft, count, limit, dtime 
    end
    
    methods
         function obj =  MyFFT(dtime, danx, stepdanx, nfftx, limit)
             obj.dtime = dtime;
             obj.dan = danx;
             obj.stepdan = stepdanx;
             obj.nfft = nfftx;
             obj.count =  length(obj.dan);
             if exist('limit')>0
                 obj.limit = limit;
             else
                 obj.limit = 30;
             end
         end        
         function Y0 =  OneStep(obj, deltai)
              if deltai+obj.nfft > obj.count
                  deltai=obj.count-obj.nfft;
              end
              Y = abs(fft(obj.dan(deltai : deltai+obj.nfft)));
              Y0=Y(1:obj.limit);
          end
    end
    
end

