# 2018lhsplit
Text, figures and code for 2018 split paper

Google Drive Folder: https://drive.google.com/drive/u/0/folders/0Bzuz9SPezDtqd1BRWGlsb1J2MmM

See [README](https://docs.google.com/document/d/1xE5--bYUyHU8AjrjMTwjZv1Dx_SFi2iGSdx23J4WoeM/edit)

Analysis code should write output pdfs/pngs to the Google Drive figure folder

First make a symlink from the right place inside the Google Drive folder to your
checkout of the analysis repo.

```
library(here)
file.symlink("~/Google Drive/SplitGAL4_Paper/", here("SplitGAL4_Paper"))
```

Then write output to that place

```
pdf(here("SplitGAL4_Paper/my.pdf"))
plot(something)
dev.off()
```
