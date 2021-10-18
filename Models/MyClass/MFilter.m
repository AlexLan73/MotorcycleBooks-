classdef MFilter  < handle
    properties
        Hd_svchCheb
    end
    
    methods
        function obj = MFilter()
            x =struct('Fstop',  0.4, 'Fpass',  0.8, 'Astop', 40, 'Apass', 0.9);
            obj.SetFNCH_Cheb(x);
            
        end
        
        function SetFNCH_Cheb(obj, x)
%                 Fstop        % Stopband Frequency
%                 Fpass = setparamsxxx.Fpass;       % Passband Frequency
%                 Astop = setparamsxxx.Astop;        % Stopband Attenuation (dB)
%                 Apass = setparamsxxx.Apass;       % Passband Ripple (dB)
%                 Fs    = 100;  % Sampling Frequency

            h = fdesign.highpass('fst,fp,ast,ap', x.Fstop, x.Fpass, x.Astop, x.Apass, 100);
            obj.Hd_svchCheb = design(h, 'equiripple', 'MinOrder', 'any',  'StopbandShape', 'flat');
            set(obj.Hd_svchCheb, 'PersistentMemory', true);
            
        end
        
        function y= FSVCH_Cheb(obj, x)
            y = filter(obj.Hd_svchCheb, x);
        end
        
    end
    
end


%{
if isempty(Hd)
    
    Fstop = 0.4;   % Stopband Frequency
    Fpass = 0.8;   % Passband Frequency
    Astop = 40;   % Stopband Attenuation (dB)
    Apass = 0.9;    % Passband Ripple (dB)
    Fs    = 100;  % Sampling Frequency
    
    h = fdesign.highpass('fst,fp,ast,ap', Fstop, Fpass, Astop, Apass, Fs);
    
    Hd = design(h, 'equiripple', 'MinOrder', 'any',  'StopbandShape', 'flat');
    
    set(Hd,'PersistentMemory',true);
    
end



%}
