classdef LoadDan1  < handle
    
    properties
        XYZ, XYZg, Engine, Frc, muRoad, Speed, Time, vBelt, NCount
    end
    
    methods
         function obj =  LoadDan1(workDir, namefile)
            pathfile = workDir+"\"+ namefile+'.mat'
            if  exist(pathfile,'file') ==2
                load('-mat', pathfile);   
                obj.XYZ = DanConvert.XYZ;
                obj.XYZg = DanConvert.XYZg;
                obj.Engine = DanConvert.Engine;
                obj.Frc = DanConvert.Frc;
                obj.muRoad = DanConvert.muRoad;
                obj.Speed = DanConvert.speed;
                obj.Time = DanConvert.Time;
                obj.vBelt = DanConvert.vBelt;
                obj.NCount = length(obj.Time);
            else
                disp(" Not file "+pathfile)
            end
         end        
         
         
         function z=Get(obj, name)
            disp(name)
            switch name
                case "XYZ.X"  
                    z = obj.XYZ.X;
                case "XYZ.Y" 
                    z = obj.XYZ.Y;
                case "XYZ.Z"
                    z = obj.XYZ.Z;
                case "PitchVel" 
                    z = obj.XYZg.PitchVel;
                case "RollVel" 
                    z = obj.XYZg.RollVel;
                case "YawVel"
                    z = obj.XYZg.YawVel;
                case "YawAcc"
                    z = obj.XYZg.YawAcc;
                case "Engine.Trq" 
                    z = obj.Engine.Trq;
                case "Engine.Rotv" 
                    z = obj.Engine.Rotv;
                case "muRoad.F" 
                    z = obj.muRoad.F;
                case "muRoad.R"
                    z = obj.muRoad.R;
                case "Speed"
                    z = obj.Speed;
                case "Time"
                    z = obj.Time;
                case "vBelt.F"
                    z = obj.vBelt.F;
                case "vBelt.R"
                    z = obj.vBelt.R;
                case "Frc.X"
                    z = obj.Frc.X;
                case "Frc.Y"
                    z = obj.Frct.Y;
                case "Frc.Z"
                    z = obj.Frc.Z;
                otherwise
                    z = zeros(length( obj.Time), 1);
            end
         end
        
         function z=Gets(obj, names)
                nCount=length(names);
                z = zeros(nCount, length(obj.Time));
                    for i=1:nCount
                        z(i,:) = obj.Get(names(i));
                    end
         end
    end
end

