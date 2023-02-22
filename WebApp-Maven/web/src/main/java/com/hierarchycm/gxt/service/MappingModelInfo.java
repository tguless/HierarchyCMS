package com.hierarchycm.gxt.service;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

@Path("/product-asset-info")
public class MappingModelInfo {

    @GET
    @Produces({"application/json", "application/xml"})
    @Path("/getSampleData")    
    public String getAssetStatusGet(@QueryParam("productId") String productIds)
    {
    	return "hello"; 
    	
    	//TestData.getTreeModel();
    }
	
}
