package com.hierarchycm.gxt.client.commands;

import com.hierarchycm.gxt.client.DbServiceProvider;

public class DeleteObjectInstanceLinkCommand extends SimpleCommand {
	String objectLinkKy = null;

	public DeleteObjectInstanceLinkCommand(String objectLinkKy) {
		this.objectLinkKy = objectLinkKy;
	}

	public DeleteObjectInstanceLinkCommand() {
	}

	public void execute() {
		
		
		
		DbServiceProvider.getDbService().deleteObjectInstanceLink(objectLinkKy, this, simpleVoidCallback);
	}
}
