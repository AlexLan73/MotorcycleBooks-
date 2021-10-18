classdef AnalysisDan1  <  handle
    properties
%        Dan,   setParamInfo
        setParamInfo, setparam_sp
        Dan LoadDan1 
        MyF MFilter
    end
    
    properties (SetAccess = private)
    end
    
    methods
        function obj =  AnalysisDan1(setpathx, setparaminfo)
            obj.setParamInfo  =  setparaminfo;    
            obj.Dan =  LoadDan1(setpathx.Dir, setpathx.Files);
            obj.MyF = MFilter();
        end
        
        function  PlotXYZ(obj, names)
            if exist('names')==0      %  Все
                    names=["XYZ.X",  "XYZ.Y", "XYZ.Z"];                        
            end
            PlotXnames(obj, names);
        end
        
        function  PlotXYZg(obj, names)
            if exist('names')==0    %  Все
                    names=["PitchVel", "RollVel", "YawVel", "YawAcc"];
            end
            PlotXnames(obj, names);
        end
        
        function  Engine(obj, names)
            if exist('names')==0   %  Все
                    names=["Engine.Trq", "Engine.Rotv"];
            end
            PlotXnames(obj, names);
        end

        function  muRoad(obj, names)
            if exist('names') == 0    %  Все
                    names=["muRoad.F", "muRoad.R"];
            end
            PlotXnames(obj, names);
        end

        function  Speed(obj)
            names=["Speed"];
            PlotXnames(obj, names);
        end

        function  vBelt(obj, names)
            if exist('names') == 0    %  Все
                names=["vBelt.F", "vBelt.R"];
            end
            PlotXnames(obj, names);
        end
        
        function  PlotXnames(obj, names)
            plot1 = MyPlot(obj.Dan.Time, obj.Dan.Gets(names), names, obj.setParamInfo) ;                            
            plot1.AllPlot()
        end

        function zOut = Spectrum(obj, names, setparam_sp)
            obj.setparam_sp = setparam_sp;
            zOut = cell(1,1);
            disp("  -- spectrum  from data:")
            T=[];
            TT=obj.Dan.Time;
            for i=1:length(names)
                ss=names(i);
                T = obj.Dan.Get(ss);
                fftx = MyFFT01(TT, T, setparam_sp);             
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
            
            
        function  z = Proskal(obj)
            % тест формулы 1-(V/w*R)
            r0 = 25.4*17/1000;
            %V = DanConvert.speed;
%            V =  obj.Dan.Get("vBelt.R");           %DanConvert.vBelt.F;
            V =  obj.Dan.Get("Speed");           %DanConvert.vBelt.F;
            kp=3;
            %w0=2*pi*f
            vr=r0/kp* obj.Dan.Get("Engine.Rotv");       %DanConvert.Engine.Rotv;
            count = length(obj.Dan.Time);
            vmax = zeros(1, count);
            for i=1:count
                vmax(1,i)  = max(V(i),vr(i));
            end
            z = 1-(V./(vmax));
            obj.myPlotone(z, "Проскальзование")
        end
        
        function z = mU(obj)
            z =obj.Dan.Get("Frc.X")./obj.Dan.Get("Frc.Z");
            obj.myPlotone(z, "mU")
        end
        
        function myPlotone(obj, d, name)
            figure
            plot(d)
            grid()
            title(name)            
        end
        
        function FiltrSpectrumBasa(obj, time, d, name)
            Tcount = length(time);
            obj.myPlotone(d, name);
            fftx = MyFFT01(time, d, obj.setparam_sp);             
            [e,z] = fftx.AllFFTe();   
            figure
            mesh(z)                
            title(" spectrum " + obj.setParamInfo.Title + "   "+ name)
            figure
            plot(e)
            title(" energy " + obj.setParamInfo.Title  + "   "+  name)
        end
        
        function FiltrSvchChebSpectrum(obj, ticker, titlex)
            
            d =obj.MyF. FSVCH_Cheb(obj.Dan.Get(ticker));
            obj.myPlotone(d, titlex);
            fftx = MyFFT01(obj.Dan.Time, d, obj.setparam_sp);             
            [e,z] = fftx.AllFFTe();   
            figure
            mesh(z)                
            title(" spectrum " + obj.setParamInfo.Title + "   "+ titlex)
            figure
            plot(e)
            title(" energy " + obj.setParamInfo.Title  + "   "+  titlex)
        end

        function z = dSpeed(obj, step)
            z = zeros(obj.Dan.NCount, 1);
            v = obj.Dan.Get("vBelt.R");
            
            for i=step+1:obj.Dan.NCount
                if v(i)-v(i-step)>0
                    z(i,1)=1;
                else
                    z(i,1)=-1;
                end
            end
            obj.myPlotone(z, " Ускорение/торможение");
        end
        
        function z = fStd(obj, v)
            obj.Dan.NCount
            %!!!!!!!!!!!!!!
        end
    end
    
end

