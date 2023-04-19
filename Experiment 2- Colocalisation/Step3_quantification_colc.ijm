inputFolder = getDirectory("Input Folder");
roifilepath = getDirectory("Folder with ROIs");
resultspath = getDirectory("Excel File");

list = getFileList(inputFolder);
list1 = getFileList(roifilepath);

for (i = 0; i < list.length; i++) {
    folderName = list[i];
    print(folderName);
    if (endsWith(folderName, "/")) {
        folderName = substring(folderName, 0, lengthOf(folderName)-1);
    }
    
    fileList = getFileList(inputFolder+folderName);
    
    stack = "";
    
    for (j = 0; j < fileList.length; j++) {
        fileName = fileList[j];
        if (endsWith(fileName, "01.tif") || endsWith(fileName, "02.tif")) {
            path = inputFolder + folderName + "/" + fileName;
            open(path);
            setBatchMode(true);
            run("8-bit");
            setThreshold(20, 255);
            if (stack == "") {
                stack = getTitle();
            } else {
                stack = stack + " " + getTitle();
            }
        }
    }
    channels = split(stack);
    for (c = 0; c < channels.length; c++) {
    	print(channels[c]);
        selectWindow(channels[c]);
        setColor(c+1);
    }
    run("Merge Channels...", "c1=[" + channels[0] + "] c2=[" + channels[1] + "] ");

    roipath = roifilepath + list1[i];
    roiManager("reset");
	roiManager("open", roipath);
	nRois = roiManager("count");
	print(folderName, nRois);
    	roiManager("select",0);
    	run("BIOP JACoP", "channel_a=1 channel_b=2 get_manders");  
	close();
}

selectWindow("Results");
saveAs("Results", resultspath + "biop_jacop.csv");
  		