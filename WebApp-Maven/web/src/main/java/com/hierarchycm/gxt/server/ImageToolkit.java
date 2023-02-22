package com.hierarchycm.gxt.server;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Blob;

import com.hierarchycm.gxt.server.ImageUtil.ImageDims;

public interface ImageToolkit {

	public abstract Blob rotateImage(Blob blob, double d);

	public abstract int getImageType(Blob image);

	//public abstract Blob resizeImage(Blob image, int type, int width);


	public abstract Blob getBlobFromFile(File cachedFile);

	public abstract void writeFile(Blob smallimage, String fileExt,	FileOutputStream fos);

	public abstract ImageDims getDimensions(Blob originalImage);

	/*
	public abstract Blob resizeImage(Blob image, int type, int width, int height);
	
	public abstract Blob resizeImageByWidth(Blob image, int type, int width);
	
	public abstract Blob resizeImageByHeight(Blob image, int type, int height);
	*/
	
	public abstract Blob resizeImage(Blob image, int type, int width, int height, String fileExt);
	
	public abstract Blob resizeImageByWidth(Blob image, int type, int width, String fileExt);
	
	public abstract Blob resizeImageByHeight(Blob image, int type, int height, String fileExt);

	

}
