package org.springside.examples.miniweb.dao.account;

import java.io.File;

public class UploadFile {
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private Long uploadid;

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public Long getUploadid() {
		return uploadid;
	}

	public void setUploadid(Long uploadid) {
		this.uploadid = uploadid;
	}

}
