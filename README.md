[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.314-blue.svg)](https://doi.org/10.25663/brainlife.app.314)

### Author
- Sophia Vinci-Booher (svincibo@indiana.edu)

### Project director
- Franco Pestilli (franpest@indiana.edu)

# app-mergeROI

This app will take one brainlife dataset of the ROI datatype and merge two rois (or all rois) within the ROI dataset into one large ROI. Rois may overlap with one another.

Users can input a string to tell the app which rois that want to merge. If the user does not specify which rois to merge (i.e., by leaving either field blank), it will merge all rois in the ROI dataset.

NOTE: The rois supplied MUST BE IN ALIGNMENT with one another -- they must be in the same space. If the rois to be merged are not in alignment with one another, then the output of this app will be UNUSABLE (even though the app will not fail to complete).

If, for example, the input ROI has 5 rois inside of it and the user asks for ROI1 and ROI2 to be merged, then the output will be an ROI data set with one roi inside. That one roi will comprise all of the voxels from ROI1 and ROI2.

### Funding 
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-SMA-2004877](https://img.shields.io/badge/NSF_SMA-2004877-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=2004877)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)
[![NIH-T32-HD007475](https://img.shields.io/badge/NIH_T32-HD007475-green.svg)](https://www.nichd.nih.gov/grants-contracts/training-careers/extramural/institutional)

### Citations

We kindly ask that you cite the following articles when publishing papers and code using this code.

Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). https://doi.org/10.1038/s41597-019-0073-y

MIT Copyright (c) 2020 brainlife.io The University of Texas at Austin and Indiana University

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

This app requires Vistasoft to run. If you do not have Vistasoft, you will need to install the following dependency:

VISTASOFT: https://github.com/vistalab/vistasoft/

