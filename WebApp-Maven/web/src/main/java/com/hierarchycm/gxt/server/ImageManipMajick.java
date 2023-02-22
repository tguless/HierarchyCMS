package com.hierarchycm.gxt.server;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;

import com.hierarchycm.gxt.server.ImageUtil.ImageDims;

import magick.ImageInfo;
import magick.MagickException;
import magick.MagickImage;

public class ImageManipMajick implements ImageToolkit {


	@Override
	public Blob rotateImage(Blob blob, double d)  {
		Blob result = null;
		try {
			ImageInfo info = new ImageInfo();
			MagickImage blobImage = new MagickImage(info, ImageUtil.blobToByteArray(blob));	
			//MagickImage blobImage = new MagickImage(info,  blob.getBinaryStream());
			MagickImage blobImageRot = blobImage.rotateImage(d);
			result = ImageUtil.byteArrayToBlob(blobImageRot.imageToBlob(info));
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	public static byte[] rotateImage(BufferedImage originalImage, String fileExt) throws MagickException, IOException {
		ImageInfo info = new ImageInfo();
		MagickImage blobImage = new MagickImage(info, ImageManipAwt.bufferedImageToByteArray(originalImage, fileExt));
		blobImage.rotateImage(90D);
		return blobImage.imageToBlob(info);
	}

	@Override
	public int getImageType(Blob image) {
		//TODO Try to change this method to use Magick tricks. 		
		return (new ImageManipAwt()).getImageType(image);
	}

	@Override
	public Blob resizeImageByWidth(Blob image, int type, int width, String fileExt) {
		Blob result = null;
		try {
			return ImageUtil.resizeImageByWidth(image, type, width, fileExt);
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	@Override
	public Blob resizeImageByHeight(Blob image, int type, int height, String fileExt) {
		Blob result = null;
		try {
			return ImageUtil.resizeImageByHeight(image, type, height, fileExt);
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	@Override
	public Blob resizeImage(Blob image, int type, int width, int height, String fileExt) {
		Blob result = null;
		try {
			ImageInfo info = new ImageInfo();
			MagickImage blobImage = new MagickImage(info, ImageUtil.blobToByteArray(image));	
			//MagickImage blobImage = new MagickImage(info,  blob.getBinaryStream());
			MagickImage blobImageRot = blobImage.scaleImage(width, height);
			result = ImageUtil.byteArrayToBlob(blobImageRot.imageToBlob(info));
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}

	@Override
	public Blob getBlobFromFile(File cachedFile) {
		// TODO Try to change this method to use Magick tricks. 		
		return (new ImageManipAwt()).getBlobFromFile(cachedFile);		
	}

	@Override
	public void writeFile(Blob smallimage, String fileExt, FileOutputStream fos) {
		// TODO Try to change this method to use Magick tricks. 		
		(new ImageManipAwt()).writeFile(smallimage, fileExt, fos);
	}

	@Override
	public ImageDims getDimensions(Blob originalImage) {
		// TODO Try to change this method to use Magick tricks. 				
		return (new ImageManipAwt()).getDimensions(originalImage);
	}

	/*
	@Override
	public Blob resizeImage(Blob image, int type, int width, int height, String fileExt) {
		return resizeImage(image, type, width, height);
		
	}

	@Override
	public Blob resizeImageByWidth(Blob image, int type, int width, String fileExt) {
		return resizeImageByWidth(image, type, width);
	}

	@Override
	public Blob resizeImageByHeight(Blob image, int type, int height, String fileExt) {
		return resizeImageByHeight(image, type, height);
	}
	*/
}
