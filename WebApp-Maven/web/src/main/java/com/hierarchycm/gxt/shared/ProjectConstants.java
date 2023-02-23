package com.hierarchycm.gxt.shared;

import java.util.HashSet;

public class ProjectConstants {

	public static final String currentSchema = "hierarchy_cm";
	public static final String dbUser = "root";
	public static final String dbPassword = "mysqlpass";
	public static final String dbConnectionUrl = "jdbc:mysql://localhost:3307/";
	public static final String connectionParams = "?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8";
	
	public static final String imageCategory = "1";
	public static final String videoCategory = "2";
	public static final String albumCategory = "5";
	public static final String commentCategory = "7";
	
	public static final String vicFileExt = "jpg";
	
	public static final HashSet <String> uploadableCategories = getUploadableCats();
	
	private static HashSet <String> getUploadableCats () {
		HashSet<String> hashSet = new HashSet<String>();
		hashSet.add("1");
		hashSet.add("2");
		
		return hashSet;
	}
	
	
}
