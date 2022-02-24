

//Author: Annalisa Bellandi

//This macro allows for:

//registration of images with two channels - channel 1 is adjusted to account for movement of the sample, 
//the adjustment matrix is then used on channel 2

///--------------------------------------------------------------------------------------------------------------------------------------------------------------

//this is automated batch processing
folder = getDirectory("Choose folder with images to be registered")

setBatchMode(true);

list = getFileList(folder);
		for (i=0; i<list.length; i++) {
            print(list[i]);
            path = folder+list[i];
            run("Bio-Formats Importer", "open=[" + path + "] autoscale color_mode=Default open_files rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
			imageTitle=getTitle;
			title_without_extension = substring(imageTitle, 0, lengthOf(imageTitle)-4);

run("HyperStackReg ", "transformation=[Rigid Body] channel1 show");

//make sure image selected is the output file of the plugin

selectWindow(title_without_extension + "-registered.czi");

//this converst the composite merged image into a normal hyperstack where the channels are visible separately
run("Channels Tool...");
Stack.setDisplayMode("grayscale");

saveAs("Tiff",  folder + title_without_extension + "_reg.tif");
close();

}