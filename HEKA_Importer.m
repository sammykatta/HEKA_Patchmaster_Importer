classdef HEKA_Importer < handle
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = public)
        recID
        path = 'Z:\Christian\data\Patch_rawData'; %'C:\Users\ckeine\Downloads\'; % %
        
        hGUI
        opt
        RecTable
        solutions
        
    end
    
    
    properties (Access = private)
        
        
    end
    
    %%
    methods (Access = public)
        function obj = HEKA_Importer(filepath,varargin) %CONSTRUCTOR
            
            P = inputParser;
            P.addRequired('filepath',@ischar)
            P.parse(filepath,varargin{:});
            obj.opt = P.Results;
%             % TEST IF DATA BROWSER IS CURRENTLY OPEN
%             openPA = findobj('tag','PA_DataBrowser');  
%             obj.FigNum = obj.FigNum + numel(openPA);
            
            % SET PATH AND FILE NAMES
%             obj.recID = ['CK_',recID];
%             matfilePath = fullfile(Dirs.Dropbox,'\@@DATA\@MPFI_UIOWA\Patch_Matlab');
%             obj.MatFileID = fullfile(matfilePath,[obj.recID,'.matX']);
%             obj.HekaFileID = fullfile(obj.path,[obj.recID,'.dat']);
            

%             I.ImagePath1 = fullfile(Dirs.Dropbox,'\@@DATA\@MPFI_UIOWA\Patch_rawData\Images');
%             I.ImagePath2 = fullfile('Z:\Christian\data\Pictures');
%             I.ImageFileName = obj.recID;
%             

            
%             % CREATE FOLDER IF NON-EXISTENT
%             if ~exist(matfilePath,'dir')
%                 mkdir(matfilePath);
%             end
            
%             %% CHECK IF FILE EXISTS AND LOAD
%             if exist(obj.MatFileID,'file')
%                 obj.loadMatFile;
%                 obj.updateMatFile
%             else
                % TODO: Clean-up import group
                obj.HI_loadHEKAFile;
%                 if isKey(obj.R,'data')
%                 obj.loadImages(I);
%                 obj.RsCorrection;
%                 else
%                     return
%                 end
            end
            
            
            %% CREATE GRAPHICAL USER INTERFACE
                        
%             obj.createGUI
            
            
            
            
            
        end
    
    methods (Access = public)
        
        %%
        %EXTERNAL FUNCTION FILES
%         loadMatFile(obj);
%         updateMatFile(obj);
        HI_loadHEKAFile(obj,varargin);
%         loadImages(obj,I);
%         RsCorrection(obj);
%         createGUI(obj);
%         eventData = findEvents(obj,iR)
        
        % TODO: UPDATE ALL FILES TO MAKE USE OF CLASS
        [tree, data,stimTree,solTree] = HI_ImportHEKAtoMat(obj)
        ephysData = HI_SplitSeries(obj,tree, dCollapse, ephysData, saveName,stimTree);
        HI_extractHEKADataTree(obj,tree);
        HI_extractHEKAStimTree(obj,t,stimTree,ephysData);
        solutions = HI_extractHEKASolutionTree(obj,solTree);

    end
    
end


