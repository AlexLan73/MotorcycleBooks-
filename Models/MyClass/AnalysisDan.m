classdef AnalysisDan  < handle
    properties
        Dan,  verMatlab, nametitle
    end
    
    properties (SetAccess = private)
        k1, k2
    end
    
    methods
        function obj =  AnalysisDan(dan, nametitle,  vermatlab)
            obj.Dan = dan;
            obj.nametitle = nametitle;
            if exist('nametitle')>0
                             obj.nametitle = nametitle;
                         else
                             obj.nametitle = "";
            end
            
            if exist('vermatlab')>0
                             obj.verMatlab = 1;     % старый вариант
                         else
                             obj.verMatlab = 0;     % новый вариант
            end
            
        end
        
        % ---  function   XYZ      
        function  PlotXYZ(obj, names)
            if exist('names')>0     % выборочно
                    nCount=length(names);
                    m = zeros(nCount, length(obj.Dan.Time));
                    for i=1:nCount
                        switch names(i)
                            case "X" 
                                disp("XYZ.X" )
                                m(i,:) = obj.Dan.XYZ.X;
                            case "Y" 
                                disp("XYZ.Y")
                                m(i,:) = obj.Dan.XYZ.Y;
                            case "Z"
                                disp("XYZ.Z")
                                m(i,:) = obj.Dan.XYZ.Z;
                            otherwise
                                disp('not field!')
                        end
                        
                    end
                    
            else  %  Все
                    m = zeros(3, length(obj.Dan.Time));
                    m(1,:) = obj.Dan.XYZ.X;
                    m(2,:) = obj.Dan.XYZ.Y;
                    m(3,:) = obj.Dan.XYZ.Z;
                    names=["X", "Y", "Z" ];
            end

            if obj.verMatlab >0
                plot1 = MyPlot(obj.Dan.Time, m, names, obj.nametitle, "old") ;                            
            else
                plot1 = MyPlot(obj.Dan.Time, m, names, obj.nametitle);                             
           end
           plot1.AllPlot()
        end
        
        % ---  function   XYZg      
        function  PlotXYZg(obj, names)
            if exist('names')>0     % выборочно
                    nCount=length(names);
                    m = zeros(nCount, length(obj.Dan.Time));
                    for i=1:nCount
                        switch names(i)
                            case "PitchVel" 
                                disp("PitchVel" )
                                m(i,:) = obj.Dan.XYZg.PitchVel;
                            case "RollVel" 
                                disp("RollVel")
                                m(i,:) = obj.Dan.XYZg.RollVel;
                            case "YawVel"
                                disp("YawVel")
                                m(i,:) = obj.Dan.XYZg.YawVel;
                            case "YawAcc"
                                disp("YawAcc")
                                m(i,:) = obj.Dan.XYZg.YawAcc;
                            otherwise
                                disp('not field!')
                        end
                        
                    end
                    
            else  %  Все
                    m = zeros(4, length(obj.Dan.Time));
                    m(1,:) = obj.Dan.XYZg.PitchVel;
                    m(2,:) = obj.Dan.XYZg.RollVel;
                    m(3,:) = obj.Dan.XYZg.YawVel;
                    m(4,:) = obj.Dan.XYZg.YawAcc;
                    names=["PitchVel", "RollVel", "YawVel", "YawAcc"];
            end

            if obj.verMatlab >0
                plot1 = MyPlot(obj.Dan.Time, m, names, obj.nametitle, "old") ;                            
            else
                plot1 = MyPlot(obj.Dan.Time, m, names, obj.nametitle );                             
           end
           plot1.AllPlot()
        end
        
        
        
        
        % ---  function   Engine      
        function  Engine(obj, names)
        end

        % ---  function   Frc      
        function  Frc(obj, names)
        end

        % ---  function   muRoad      
        function  muRoad(obj, names)
        end

        % ---  function   speed     
        function  Speed(obj)
        end

        % ---  function   vBelt
        function  vBelt(obj, names)
        end

        % ---  function   vBelt
        function zOut = Spectrum(obj, names, setparam)
            zOut = cell(1,1);
            step = setparam.step
            nfft = setparam.nfft
            limit = setparam.limit
            disp("  -- spectrum  from data:")
            T=[];
            TT=obj.Dan.Time;
            for i=1:length(names)
                ss=names(i);
                disp("       "+ss )
                
                switch ss
                    case "PitchVel" 
                                T = obj.Dan.XYZg.PitchVel;
                    case "RollVel" 
                                T = obj.Dan.XYZg.RollVel;
                    case "YawVel"
                                T = obj.Dan.XYZg.YawVel;
                    case "YawAcc"
                                T = obj.Dan.XYZg.YawAcc;
                    case "X" 
                                T = obj.Dan.XYZ.X;
                    case "Y" 
                                T = obj.Dan.XYZ.Y;
                    case "Z"
                                T = obj.Dan.XYZ.Z;
                                
                            otherwise
                                disp('not field!')
                end
                fftx = MyFFT01(TT, T, setparam.step, setparam.nfft, setparam.limit);             
                [e,z] = fftx.AllFFTe();   
                figure
                mesh(z)                
                title(" spectrum "+obj.nametitle+"   "+ ss)
                figure
                plot(e)
                title(" energy "+obj.nametitle+"   "+  ss)
                d.name=ss;
                d.z=z;
                d.e=e;
                zOut{i,1}=d;
            end
        end
    
%z=cell(1,1);
%for i=1:length(danfiles)
%    dddz.ind=i;
%    dddz.name=danfiles(i);
%    z{i,1}=dddz;
%end



    end
    
end

