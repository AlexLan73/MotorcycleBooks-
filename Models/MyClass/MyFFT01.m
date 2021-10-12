classdef MyFFT01  < handle
    properties
             dan, stepdan, nfft, count, limit, dtime, setParamFFT 
    end
    
    methods
         function obj =  MyFFT01(dtime, danx, setparamfft)
             obj.setParamFFT = setparamfft;
             obj.dtime = dtime;
             obj.dan = danx;
             obj.count =  length(obj.dan);

             if obj.setParamFFT.limit == 0
                 obj.setParamFFT.limit = fix(obj.setParamFFT.nfft /2);
             end
         end        
% ----------     OneStep   --------------------------------    
         function Y0 =  OneStep(obj, deltai)
            if deltai > obj.count
                  deltai=obj.count;
            end
              
            if deltai-obj.setParamFFT.nfft <1
                  Y0=zeros(1, obj.setParamFFT.limit);
                  return
            end
            
              Y = abs(fft(obj.dan(deltai-obj.setParamFFT.nfft : deltai)));
              Y0=Y(1:obj.setParamFFT.limit);
         end
          
% ----------     AllFFT   --------------------------------    
         function z =  AllFFT(obj)
            z = zeros(obj.count, obj.setParamFFT.limit);   
            for i = obj.setParamFFT.nfft+1 :obj.count
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

