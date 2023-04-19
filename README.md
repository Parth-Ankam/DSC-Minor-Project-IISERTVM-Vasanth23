# DSC-Minor-Project-IISERTVM-Vasanth23
ImageJ Macros and CellProfiler Pipelines to make everyone's lives easier!

-----
The files are named according to the what step of the quantification process they have automated and the comments in the macro code give a description of the block's function. There is a seperate folder for all the files to be downloaded for the modular ROI marking tool.

## Requirements for the Tool
* CellProfiler: program can be downloaded [here]([url](https://cellprofiler.org/releases))
* Fiji (Fiji is Just ImageJ): program can be downloaded [here]([url](https://imagej.net/downloads)) 
* The folder 'Modular ROI marking' will contain files which have to be downloaded

## Step-by-step Instructions for the Tool
* Import CellProfiler pipeline and adjust the diameter range according to ROI size compared to total size of the image in the 'IdentifyPrimaryObjects' module
* Select the topmost mode 'Images' and import the required folders and images
* Change the output folder to the new desired location in the 'SaveImage' module
* Run 'Analyse Images'
* Open ImageJ and drag-and-drop the ImageJ macros 'Step2'
* Select the input directory and the folder where you wish to save the exported ROIs
* The checkpoint will provide an option as to whether or not the user wishes to continue with the marked ROIs, the ROI manager will be open and all manually marked ROIs will also be accepted and saved.
* Once all images are done, drag-and drop the ImageJ macros 'Step3'
* Each image will open with the corresponding ROI in the ROI manager and you can either modify the macros for your desired quantification process or manually do it for each image.
* Data in the 'Summary' window will be saved to a .csv file hence, ensure to add your data to the 'Summary'
