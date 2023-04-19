inputFolder = getDirectory("Input Folder");
roifilepath = getDirectory("Folder with ROIs");

// Loop over all images in the directory
list = getFileList(inputFolder);
roiList = getFileList(roifilepath);
// loop over the files
for (i = 0; i < list.length; i++) {
    file = list[i];
    if (endsWith(file, ".tif")) {
        // open the image
        path = inputFolder + file;
        open(path);
        list1 = getFileList(roifilepath);
    	roipath = roifilepath + roiList[i];
    	roiManager("reset");
	    roiManager("open", roipath);
    	waitForUser("Perform Analysis", "Select OK after the analysis is complete to open the next image. P.S. Ensure your data is added to the 'Summary'");
		close();
		roiManager("reset");
    }
}

selectWindow("Summary");
saveAs("Results", resultspath+"summarise.csv");
    
    

