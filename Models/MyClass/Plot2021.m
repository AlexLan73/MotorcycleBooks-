classdef Plot2021  <  handle
    properties
    end
    
    methods
        function obj = Plot2021()
        end
        
        function  PlotVertical(obj, M)
            [n, m0] = size(M);
            tiledlayout(n,m0)
            for i=1:n
                nexttile(i)
                [i0, j0] = size(M{i,1}.mas);
                if i0==1
                    plot(M{i,1}.mas)
                else
                   mesh(M{i,1}.mas)                
                end
                title(M{i,1}.title)
                grid()
            end
        end
        
        function PlotHorizont(obj, M)
            [n, m0] = size(M)
            tiledlayout(n,1)
            for i=1:n
                nexttile(i)
                plot(M{i,1}.mas)
                title(M{i,1}.title)
                grid()
            end
        end
        function outputArg = PlotMatrNM(obj)
%                                 nexttile
%                     plot(obj.tt, obj.m(i,:))
%                     title(obj.setParamInfo.Title  +  "   "+ obj.mtitle(i))
%                     grid()
        end
    end
end

