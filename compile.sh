#!/bin/bash
module load matlab/2019a

mkdir -p compiled

cat > build.m <<END
addpath(genpath('/N/u/brlife/git/vistasoft'))
addpath(genpath('/N/u/brlife/git/jsonlab'))
mcc -m -R -nodisplay -d compiled mergeROI
exit
END
matlab -nodisplay -nosplash -r build
