classdef LoadDan  < handle
    
    properties
        XYZ, XYZg, Engine, Frc, muRoad, Speed, Time, vBelt
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
            end
            
         end        
        
        
    end
    
end

