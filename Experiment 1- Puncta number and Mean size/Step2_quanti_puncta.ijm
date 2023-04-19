inputFolder = getDirectory("Select input folder");
roifilepath = getDirectory("Select folder with saved ROIs");
resultspath = getDirectory("Select folder to save quantification data");

// Loop over all images in the directory
list = getFileList(inputFolder);
roiList = getFileList(roifilepath);

// loop over the files
for (i = 0; i < list.length; i++) {
    file = list[i];
    if (endsWith(file, ".tif")) {
        print("inside if 25");
        // open the image
        path = inputFolder + file;
        open(path);
        run("8-bit");
		run("Auto Local Threshold", "method=Bernsen radius=15 parameter_1=0 parameter_2=0 white");
		setOption("BlackBackground", true);
		run("Convert to Mask");
        list1 = getFileList(roifilepath);
    	roipath = roifilepath + roiList[i];
    	roiManager("reset");
	    roiManager("open", roipath);
	    nRois = roiManager("count");
			for (j = 0; j < nRois; j++) {
    			roiManager("select", j);
    			run("Analyze Particles...", "size=0.15-Infinity summarize");
			}
		close();
		roiManager("reset");
    }
}

selectWindow("Summary");
saveAs("Results", resultspath+"summarise.csv");
    
    

