<h1 align="center">mergeROI</h1>

<p align="center">
  Merges two named ROIs, or all ROIs, of an ROI collection into a single binary ROI with a compiled MATLAB (vistasoft) script.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.314"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.314-blue.svg" alt="Run on brainlife.io"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Merges two named ROIs, or all ROIs, of an ROI collection into a single binary ROI with a compiled MATLAB (vistasoft) script.**

Reads the ROI NIfTI files of an rois dataset and combines the two requested ROIs (or every ROI when either name is left empty) into one binary ROI containing all their voxels. Use it to build a larger region from smaller ones before tracking or analysis. The ROIs must be in the same space; misaligned ROIs give an unusable output without an error.

| | |
|---|---|
| **Inputs** | `neuro/rois` |
| **Outputs** | `neuro/rois` |
| **Container** | `brainlife/mcr:r2019a` |
| **Resources** | 1 CPUs |
| **Run it** | [doi.org/10.25663/brainlife.app.314](https://doi.org/10.25663/brainlife.app.314) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `roi` | `neuro/rois` | yes | Collection of ROI NIfTI files (rois folder) in the same space. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/rois` | ROI collection containing the single merged ROI. |

<details>
<summary><b>Parameters</b> (3)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `roi1_name` | string |  | If this field is left empty, the all rois within the ROI dataset will be merged. |
| `roi2_name` | string |  | If this field is left empty, the all rois within the ROI dataset will be merged. |
| `roiout_name` | string |  | Name of the merged output ROI file; required (the App stops with an error when it is empty). |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.314](https://doi.org/10.25663/brainlife.app.314), choose `neuro/rois` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/rois`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/mcr:r2019a`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "rois": "/path/to/roi/rois",
       "roi1_name": "",
       "roi2_name": "",
       "roiout_name": ""
   }
   ```

3. Run `./main`.

## Troubleshooting

- **You must enter a name for the output ROI.**: Set roiout_name.
- **output roi folder missing**: Check the log for the MATLAB error; the ROI names must match files in the input.

## app-mergeROI

This app will take one brainlife dataset of the ROI datatype and merge two rois (or all rois) within the ROI dataset into one large ROI. Rois may overlap with one another.

Users can input a string to tell the app which rois that want to merge. If the user does not specify which rois to merge (i.e., by leaving either field blank), it will merge all rois in the ROI dataset.

NOTE: The rois supplied MUST BE IN ALIGNMENT with one another -- they must be in the same space. If the rois to be merged are not in alignment with one another, then the output of this app will be UNUSABLE (even though the app will not fail to complete).

If, for example, the input ROI has 5 rois inside of it and the user asks for ROI1 and ROI2 to be merged, then the output will be an ROI data set with one roi inside. That one roi will comprise all of the voxels from ROI1 and ROI2.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- mergeROI. brainlife.io App. [doi:10.25663/brainlife.app.314](https://doi.org/10.25663/brainlife.app.314)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Sophia Vinci-Booher

**Project director**

- Franco Pestilli

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io, which runs this App, is publicly funded by Wellcome, the U.S. National Institutes of Health and the U.S. National Science Foundation; acknowledging that support helps keep it running.</sub>
