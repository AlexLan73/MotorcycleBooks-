classdef AnalysisDan  < handle
    properties
        Dan,   setParamInfo
    end
    
    properties (SetAccess = private)
    end
    
    methods
        function obj =  AnalysisDan(dan, setparaminfo)
            obj.setParamInfo  =  setparaminfo;    
            obj.Dan = dan;
        end
        
        % ---  function   XYZ      +
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

            plot1 = MyPlot(obj.Dan.Time, m, names, obj.setParamInfo) ;                            
            plot1.AllPlot()
        end
        
        % ---  function   XYZg      +
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


            plot1 = MyPlot(obj.Dan.Time, m, names, obj.setParamInfo) ;                            
            plot1.AllPlot()
        end
        
        % ---  function   Engine      +
        function  Engine(obj, names)
            if exist('names')>0     % выборочно
                    nCount=length(names);
                    m = zeros(nCount, length(obj.Dan.Time));
                    for i=1:nCount
                        switch names(i)
                            case "Engine.Trq" 
                                disp("Engine.Trq")
                                m(i,:) = obj.Dan.Engine.Trq;
                            case "Engine.Rotv" 
                                disp("Engine.Rotv")
                                m(i,:) = obj.Dan.Engine.Rotv;
                            otherwise
                                disp('not field!')
                        end
                        
                    end
                    
            else  %  Все
                    m = zeros(2, length(obj.Dan.Time));
                    m(1,:) = obj.Dan.Engine.Trq;
                    m(2,:) = obj.Dan.Engine.Rotv;
                    names=["Engine.Trq", "Engine.Rotv"];
            end

            plot1 = MyPlot(obj.Dan.Time, m, names, obj.setParamInfo) ;                            
            plot1.AllPlot()
        end

        % ---  function   Frc      
        function  Frc(obj, names)
        end

        % ---  function   muRoad      
        function  muRoad(obj, names)
            if exist('names')>0     % выборочно
                    nCount=length(names);
                    m = zeros(nCount, length(obj.Dan.Time));
                    for i=1:nCount
                        switch names(i)
                            case "muRoad.F" 
                                disp("muRoad.F")
                                m(i,:) = obj.Dan.muRoad.F;
                            case "muRoad.R"
                                disp("muRoad.R")
                                m(i,:) = obj.Dan.muRoad.R;
                            otherwise
                                disp('not field!')
                                return;
                        end
                    end
            else  %  Все
                    m = zeros(2, length(obj.Dan.Time));
                    m(1,:) = obj.Dan.muRoad.F;
                    m(2,:) = obj.Dan.muRoad.R;
                    names=["muRoad.F", "muRoad.R"];
            end

            plot1 = MyPlot(obj.Dan.Time, m, names, obj.setParamInfo) ;                            
            plot1.AllPlot()
            
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
                                return
                end
                fftx = MyFFT01(TT, T, setparam);             
                [e,z] = fftx.AllFFTe();   
                figure
                mesh(z)                
                title(" spectrum " + obj.setParamInfo.Title + "   "+ ss)
                figure
                plot(e)
                title(" energy " + obj.setParamInfo.Title  + "   "+  ss)
                zOut{i,1}= struct('name',  ss, 'z', z, 'e', e);   
            end
        end

         function z=Get(obj, name)
             disp(name)
            try
               z=obj.D.(name)
            catch exception
             disp("error  ")
               z=zeros(length( obj.Time), 1)
            end                 
         end
        
        
    end
    
end

