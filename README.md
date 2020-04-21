[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.219-blue.svg)](https://doi.org/10.25663/brainlife.app.314)

### Author
- Sophia Vinci-Booher (svincibo@indiana.edu)

### Project director
- Franco Pestilli (franpest@indiana.edu)

# app-mergeROI

This app will take one brainlife dataset of the ROI datatype and merge two rois within the ROI dataset into one large ROI. Functionality is restricted to two rois (and not more) for parsimony and rois may overlap with one another.

Users can input a string to tell the app which rois that want to merge. If the user does not specify which rois to merge (i.e., by leaving either field blank), it will merge all rois in the ROI dataset.

NOTE: The rois supplied MUST BE IN ALIGNMENT with one another -- they must be in the same space. If the rois to be merged are not in alignment with one another, then the output of this app will be UNUSABLE (even though the app will not fail to complete).

If, for example, the input ROI has 5 rois inside of it and the user asks for ROI1 and ROI2 to be merged, then the output will be an ROI data set with one roi inside. That one roi will comprise all of the voxels from ROI1 and ROI2.

### Funding 
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NIH-T32-HD007475](https://img.shields.io/badge/NIH_T32-HD007475-blue.svg)](https://www.nichd.nih.gov/grants-contracts/training-careers/extramural/institutional)

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/brainlife.app.314](https://doi.org/10.25663/brainlife.app.314) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
"roi": ["data/rois/"],
"roi1_name": ["ROI000012172"],
"roi2_name": ["ROI000012157"],
"roiout_name": ["hippocampus"]
}
```

3. Launch the App by executing `main`

```bash
./main
```

### Sample Datasets

If you don't have your own input file, you can download sample datasets from Brainlife.io, or you can use [Brainlife CLI](https://github.com/brain-life/cli).


## Output

All output files will be generated under the current working directory (pwd). The main output of this App is the ROI folder that contains a .nii.gz file for the merged roi. 

### Dependencies

Vistasoft
