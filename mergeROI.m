function [] = mergeROI()

% This app will take one brainlife dataset of the ROI datatype and merge two
% rois within the ROI dataset into one large ROI. Functionality is
% restricted to two rois (and not more) for parsimony and rois may overlap
% with one another.

% Users can input a string to tell the app which rois that want to merge.
% If the user does not specify which rois to merge (i.e., by leaving either 
% field blank), it will merge all rois in the ROI dataset.

% NOTE: The rois supplied MUST BE IN ALIGNMENT with one another -- they must
% be in the same space. If the rois to be merged are not in alignment with
% one another, then the output of this app will be UNUSABLE
% (even though the app will not fail to complete).

% If, for example, the input ROI has 5 rois inside of it and the user asks for
% ROI1 and ROI2 to be merged, then the output will be an ROI data set
% with one roi inside. That one roi will comprise all of the voxels from
% ROI1 and ROI2. 

% Dependencies:
% vistasoft

% Setup json lab.
if ~isdeployed
    
    addpath(genpath('/N/u/brlife/git/jsonlab'));
    addpath(genpath('/N/u/hayashis/git/vistasoft'))
    
end

% Read in config.json.
config = loadjson('config.json');

% Check that the user entered something for roiout_name.
if isempty(config.roiout_name)
    error('You must enter a name for the output ROI.')
end

% Get available rois.
rois_avail = dir(config.rois);

% Remove the '.' and '..' files.
rois_avail = rois_avail(arrayfun(@(x) x.name(1), rois_avail) ~= '.');

% Decide if all rois should be merged or just two.
if ~isempty(config.roi1_name) || ~isempty(config.roi2_name) % merge two
    
    % Update user.
    disp(['Merging ' config.roi1_name ' and ' config.roi2_name '...']);
    disp(['Reading: ' config.roi1_name '...'])
    
    % ROI1: Get the index of the second roi requested. Account for possibility
    % that the user entered the .nii.gz at the end.
    if endsWith(config.roi1_name, '.nii.gz')
        roi1_idx = find(strcmp({rois_avail.name}, config.roi1_name));
    else
        roi1_idx = find(strcmp({rois_avail.name}, [config.roi1_name '.nii.gz']));
    end
    
    % ROI1: Read in data for the first roi.
    roi1 = niftiRead(fullfile(rois_avail(roi1_idx).folder, rois_avail(roi1_idx).name));
    
    % ROI1: Check that the first roi was appropriately identified.
    if size(roi1_idx, 2) ~= 1
        error('Please check that the name of the first requested ROI is the name of one (and only one) of the rois within the ROI datatype supplied.');
    end
    
    % Update user.
    disp(['Reading: ' config.roi2_name '...'])
    
    % ROI2: Get the index of the second roi requested. Account for possibility
    % that the user entered the .nii.gz at the end.
    if endsWith(config.roi2_name, '.nii.gz')
        roi2_idx = find(strcmp({rois_avail.name}, config.roi2_name));
    else
        roi2_idx = find(strcmp({rois_avail.name}, [config.roi2_name '.nii.gz']));
    end
    
    if size(roi2_idx, 2) ~= 1
        error('Please check that the name of the second requested ROI is the name of one (and only one) of the rois within the ROI datatype supplied.');
    end
    
    % ROI2: Read in data for the second roi.
    roi2 = niftiRead(fullfile(rois_avail(roi2_idx).folder, rois_avail(roi2_idx).name));
    
    % Simple check 1: Image dimensions
    if (roi1.dim ~= roi2.dim)
        error('Merge failed. Image dimensions of the first roi must match the image dimensions of the second roi.');
    end
    
    % Simple check 2: Pixel dimensions
    if (roi1.pixdim ~= roi2.pixdim)
        error('Merge failed. Pixel dimensions of the first roi must match the pixel dimensions of the second roi.');
    end
    
    % Merge: Add together.
    roiout.data = roi1.data + roi2.data;
    
    % Simple check 3: Account for the possibility that the two rois might have an area of overlap.
    roiout.data(roiout.data > 1) = 1;
    
    % Construct nifti for output. No need to update header, just use header from roi1.
    roi1.data = roiout.data;
    
else % merge all rois
    
    % Update user.
    disp('Merging all rois ...');
  
    for r = 1:size(rois_avail, 1)
        
        if r == 1
            
            % Initialize roiout.data by setting all entries to zero.
            roiout = niftiRead(fullfile(rois_avail(r).folder, rois_avail(r).name));
            roiout.data = int16(zeros(size(roiout.data)));
            
        end % if r = 1
        
        disp(['Reading: ' rois_avail(r).name '...'])
        
        % ROI: Read in data for the current roi.
        roi(r) = niftiRead(fullfile(rois_avail(r).folder, rois_avail(r).name));
        
        if r > 1
            
            % Simple check 1: Image dimensions
            if (roi(r-1).dim ~= roi(r).dim)
                error(['Merge failed. Image dimensions of ' rois_avail(r).name ' and/or ' rois_avail(r-1).name 'do not match the image dimensions of the other rois.']);
            end
            
            % Simple check 2: Pixel dimensions
            if (roi(r-1).pixdim ~= roi(r).pixdim)
                error(['Merge failed. Pixel dimensions of ' rois_avail(r).name ' and/or ' rois_avail(r-1).name 'do not match the pixel dimensions of the other rois.']);
            end
            
        end
        
        % Merge: Add together.
        roiout.data = roiout.data + roi(r).data;
        
    end % for r in rois_avail

    % Simple check 3: Account for the possibility that the two rois might have an area of overlap.
    roiout.data(roiout.data > 1) = 1;
    
    % Construct nifti for output. No need to update header, just use header from roi1.
    roi1 = roiout;
    
end % if isempty roi names

% Update user.
disp('Writing merged ROI file ...')

% Make the output directory if it does not exist.
if ~exist('output'); mkdir output; end

% Make the output/rois directory if it does not exist.
if ~exist('output/rois'); mkdir output/rois; end

% Write out nifti containing merged roi. Account for possibility
% that the user entered the .nii.gz at the end.
if endsWith(config.roi2_name, '.nii.gz')
    niftiWrite(roi1, fullfile('output/rois', config.roiout_name))
else
    niftiWrite(roi1, fullfile('output/rois', [config.roiout_name '.nii.gz']))
end

% Update user.
disp('Finished writing merged ROI file.')

exit



