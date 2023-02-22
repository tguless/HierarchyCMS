package com.hierarchycm.gxt.server;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import com.hierarchycm.gxt.server.ImageUtil.ImageDims;


import magick.MagickException;

public class ImageManipAwt  implements ImageToolkit{	
	
	
	/*
	public Blob resizeImageByWidth(Blob originalImage, int type, int newwidth) {
		Blob result = null;
		try {		
			result=  bufferedImageToBlob(resizeImageByWidth(blobToBufferedImage(originalImage), type, newwidth), "jpg");
		} catch (Exception e) {
			// throws MagickException, IOException, SQLException
			e.printStackTrace();
			System.out.println(e);
		}
	
		return result;
	}	
	*/
	@Override
	public Blob resizeImageByWidth(Blob originalImage, int type, int newwidth, String fileExt) {
		Blob result = null;
		try {		
			result=  bufferedImageToBlob(resizeImageByWidth(blobToBufferedImage(originalImage), type, newwidth), fileExt);
		} catch (Exception e) {
			// throws MagickException, IOException, SQLException
			e.printStackTrace();
			System.out.println(e);
		}	
		return result;
	}	
	
	/*
	public Blob resizeImageByHeight(Blob originalImage, int type, int newheight) {
		Blob result = null;
		try {		
			result=  bufferedImageToBlob(resizeImageByHeight(blobToBufferedImage(originalImage), type, newheight), "jpg");
		} catch (Exception e) {
			// throws MagickException, IOException, SQLException
			e.printStackTrace();
			System.out.println(e);
		}
	
		return result;
	}
	*/	
	
	@Override
	public Blob resizeImageByHeight(Blob originalImage, int type, int newheight, String fileExt) {
		Blob result = null;
		try {		
			result=  bufferedImageToBlob(resizeImageByHeight(blobToBufferedImage(originalImage), type, newheight), fileExt);
		} catch (Exception e) {
			// throws MagickException, IOException, SQLException
			e.printStackTrace();
			System.out.println(e);
		}
	
		return result;
	}	
	
	/*
	public  Blob resizeImage(Blob originalImage, int type, int width, int height) {		
		Blob result = null;
		try {
			result=  bufferedImageToBlob(resizeImage(blobToBufferedImage(originalImage), type, width, height),"jpg");
		} catch (Exception e) {
			// throws MagickException, IOException, SQLException
			e.printStackTrace();
			System.out.println(e);
		}
		
		return result;
	}
	*/	
	
	@Override
	public  Blob resizeImage(Blob originalImage, int type, int width, int height, String fileExt) {		
		Blob result = null;
		try {
			result=  bufferedImageToBlob(resizeImage(blobToBufferedImage(originalImage), type, width, height),fileExt);
		} catch (Exception e) {
			// throws MagickException, IOException, SQLException
			e.printStackTrace();
			System.out.println(e);
		}
		
		return result;
	}	
	
	private static BufferedImage resizeImageByWidth(BufferedImage originalImage, int type, int newwidth) throws MagickException, IOException {		
		
		//Dimensions dims = imageManip.getDimensions(originalImage);
		
		int originalHeight = originalImage.getHeight();
		int originalWidth = originalImage.getWidth();
		
		float aspectRatio =  (float)originalHeight/(float)originalWidth;
		
		float newheight= newwidth * aspectRatio;
				
		return resizeImage(originalImage, type, newwidth, Math.round(newheight)  );
	}
	
	private static BufferedImage resizeImageByHeight(BufferedImage originalImage, int type, int newheight) throws MagickException, IOException {		
		
		//Dimensions dims = imageManip.getDimensions(originalImage);
		
		int originalHeight = originalImage.getHeight();
		int originalWidth = originalImage.getWidth();
		
		float aspectRatio = (float)originalWidth/(float)originalHeight;
		
		float newwidth= newheight * aspectRatio;
				
		return resizeImage(originalImage, type,  Math.round(newwidth), newheight);
				
	}


	private static BufferedImage resizeImage(BufferedImage originalImage, int type, int width, int height) throws MagickException, IOException {
		
		BufferedImage resizedImage = new BufferedImage(width, height, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, width, height, null);
		
		g.dispose();

		return resizedImage;
	}
	
	private static BufferedImage resizeImageWithHint(BufferedImage originalImage, int type, int width, int height) {

		BufferedImage resizedImage = new BufferedImage(width, height, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, width, height, null);
		g.dispose();
		g.setComposite(AlphaComposite.Src);

		g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

		return resizedImage;
		
	}
	
	public int getImageType(Blob img ) {
		int result = 0;
		try {
			result =  getImageType(blobToBufferedImage(img));
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	public static int getImageType(BufferedImage img ) {
		return img.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : img.getType();
		
	}

	@Override
	public Blob rotateImage(Blob blob, double d) {
		// TODO Auto-generated method stub
		return null;
	}

	public static byte[] bufferedImageToByteArray (BufferedImage originalImage, String fileExt) throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(originalImage, fileExt, baos);
		byte[] bytesOut = baos.toByteArray();
		
		return bytesOut;
	}
	
	public static Blob bufferedImageToBlob(BufferedImage smallimage, String fileExt) throws SerialException, SQLException, IOException {
		return new SerialBlob(bufferedImageToByteArray(smallimage, fileExt)); 			
	}

	@Override
	public Blob getBlobFromFile(File cachedFile)  {
		Blob result = null;
		try {
			result = ImageManipAwt.bufferedImageToBlob(ImageIO.read(cachedFile), cachedFile.getName().substring(cachedFile.getName().lastIndexOf(".")+1));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		return result;		
	}
	
	public static BufferedImage blobToBufferedImage(Blob originalImage) throws IOException, SQLException {	
		return ImageIO.read(originalImage.getBinaryStream());
	}

	@Override
	public void writeFile(Blob smallimage, String fileExt, FileOutputStream fos) {
		try {
			ImageIO.write(blobToBufferedImage(smallimage), fileExt, fos);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}

	@Override
	public ImageDims getDimensions(Blob blob) {
		ImageDims dims = new ImageDims();
		
		try {
			BufferedImage originalImage = blobToBufferedImage(blob);
			
			dims.height = originalImage.getHeight();
			dims.width = originalImage.getWidth();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		return dims;
	}
}
