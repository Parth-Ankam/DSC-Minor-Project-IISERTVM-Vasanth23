
inputFolder = getDirectory("Input Folder");
outputFolder = getDirectory("Merged Files");

// Loop over all folders in the directory
list = getFileList(inputFolder);

for (i = 0; i < list.length; i++) {
    folderName = list[i];
    if (endsWith(folderName, "/")) {
        folderName = substring(folderName, 0, lengthOf(folderName)-1);
    }
    
    // get the list of files in the folder
    fileList = getFileList(inputFolder+folderName);
    
    // create an empty stack to hold the images
    stack = "";
    
    // loop over the files
    for (j = 0; j < fileList.length; j++) {
        fileName = fileList[j];
        if (endsWith(fileName, "01.tif") || endsWith(fileName, "02.tif")) {
            
            // open the image
            path = inputFolder + folderName + "/" + fileName;
            open(path);
            setBatchMode(true);
            print(folderName);
            // add the image to the stack
            if (stack == "") {
                stack = getTitle();
            } else {
                stack = stack + " " + getTitle();
            }
        }
    }
    
     // merge the channels and assign different colors
    channels = split(stack);
    for (c = 0; c < channels.length; c++) {
        selectWindow(channels[c]);
        setColor(c+1);
    }
    run("Merge Channels...", "c1=[" + channels[0] + "] c2=[" + channels[1] + "]");
    run("Enhance Contrast", "saturated equalize");
    
    // save the image
    saveAs("Tiff", outputFolder + folderName + ".tif");
    
    
    // close all images
    close("*");
}