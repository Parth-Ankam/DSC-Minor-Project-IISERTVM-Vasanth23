
function checkpoint(filename) {
	roiManager("Save", Savepath + "roi_" + list[i] + ".zip");
}

// Define directory paths
path = getDirectory("Marked ROI images");
path1 = getDirectory("Merged images");
Savepath = getDirectory("Save ROI");

// Loop over all images in the directory
list = getFileList(path);
list1 = getFileList(path1);

for (i = 0; i < list.length; i++) {
    if (endsWith(list[i], ".tiff")) {
        roiManager("reset");
        filename = path + list[i];
        open(filename);

        run("Convert to Mask");
        run("Analyze Particles...","add");;
        open(path1 + list1[i]);
		run("Enhance Contrast", "saturated=0.35");

        roiManager("select", 0);
        waitForUser("Confirm all ROI for this image");
        roiManager("save", Savepath + "roi_" + list[i] + ".zip");
        close();
        close();
    }
    roiManager("reset");
}