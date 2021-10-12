classdef MyFFT01  < handle
    properties
             dan, stepdan, nfft, count, limit, dtime 
    end
    
    methods
         function obj =  MyFFT01(dtime, danx, stepdanx, nfftx, limit)
             obj.dtime = dtime;
             obj.dan = danx;
             obj.stepdan = stepdanx;
             obj.nfft = nfftx;
             obj.count =  length(obj.dan);
             if exist('limit')>0
                 obj.limit = limit;
             else
                 obj.limit = fix(nfftx/2);
             end
         end        
% ----------     OneStep   --------------------------------    
         function Y0 =  OneStep(obj, deltai)
            if deltai > obj.count
                  deltai=obj.count;
            end
              
            if deltai-obj.nfft <1
                  Y0=zeros(1,obj.limit);
                  return
            end
            
              Y = abs(fft(obj.dan(deltai-obj.nfft : deltai)));
              Y0=Y(1:obj.limit);
         end
          
% ----------     AllFFT   --------------------------------    
         function z =  AllFFT(obj)
            z = zeros(obj.count, obj.limit);   
            for i = obj.nfft+1 :obj.count
                z(i, :) = obj.OneStep(i);
            end
         end
% ----------     AllFFTe   --------------------------------             
         function [e, z] =  AllFFTe(obj)
              z= AllFFT(obj);
              [i, j] = size(z);
              e=zeros(i,1);
              for k=1:i
                e(k) =  sum(z(k,:));
              end
         end
    end
    
end

