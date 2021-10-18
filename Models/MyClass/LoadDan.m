classdef LoadDan  < handle
    
    properties
        XYZ, XYZg, Engine, Frc, muRoad, Speed, Time, vBelt
%        D
    end
    
    
    methods
         function obj =  LoadDan(workDir, namefile)
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
%                obj.D = struct('X',  obj.XYZ.X, 'Y',  obj.XYZ.Y, 'Z',  obj.XYZ.Z, 'PitchVel', obj.XYZg.PitchVel, 'RollVel', obj.XYZg.RollVel,  'YawVel', obj.XYZg.YawVel, 'YawAcc', obj.XYZg.YawAcc);
%testDan.Engine(["Engine.Trq", "Engine.Rotv"]);                
            else
                disp(" Not file "+pathfile)
            end
         end        
        
%          function z=Get(obj, name)
%              disp(name)
%             try
%                z=obj.D.(name)
%             catch exception
%              disp("error  ")
%                 
%                z=zeros(length( obj.Time), 1)
%             end                 
%          end
        
    end
    
end

