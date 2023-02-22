package com.hierarchycm.gxt.client.commands;

import com.hierarchycm.gxt.client.DbServiceProvider;

public class DeleteObjectInstanceCommand extends SimpleCommand {
	String objectKy = null;
	String typeId = null;

	public DeleteObjectInstanceCommand(String objectKy, String typeId) {
		this.objectKy = objectKy;
		this.typeId  = typeId;
	}

	public DeleteObjectInstanceCommand() {
	}

	public void execute() {
		DbServiceProvider.getDbService().deleteObjectInstance(objectKy, typeId, this, simpleVoidCallback);
	}
}
