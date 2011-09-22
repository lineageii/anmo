package org.springside.examples.miniweb.service.account;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.swing.ImageIcon;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springside.examples.miniweb.dao.account.UploadDao;
import org.springside.examples.miniweb.dao.account.UploadFile;
import org.springside.examples.miniweb.entity.account.Technician;
import org.springside.examples.miniweb.entity.account.Upload;

import com.google.common.collect.Lists;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

@Component
public class UploadService {
	private static Logger logger = LoggerFactory.getLogger(UploadService.class);
	@Autowired
	private UploadDao uploadDao;

	public UploadDao getUploadDao() {
		return uploadDao;
	}

	public void setUploadDao(UploadDao uploadDao) {
		this.uploadDao = uploadDao;
	}

	public List<Upload> uploadFiles(List<UploadFile> files, String uploadDir, Technician technician) {
		List<Upload> uploads = Lists.newArrayList();
		int i = 0;
		for (UploadFile file : files) {
			if (file.getUpload() != null) {

				uploads.add(uploadFile(file, uploadDir, technician));
			}
			i++;
		}
		return uploads;

	}

	public Upload uploadFile(UploadFile file, String uploadDir, Technician technician) {
		String ramdom = UUID.randomUUID().toString();
		String sysFileName = ramdom + getExtention(file.getUploadFileName());
		String smallSysFileName = ramdom + "_small" + getExtention(file.getUploadFileName());
		File sysFile = new File(uploadDir + "/" + sysFileName);
		try {
			FileUtils.copyFile(file.getUpload(), sysFile);
		} catch (IOException e) {
			logger.error("上传文件错误", e);
			throw new RuntimeException("上传文件错误", e);
		}
		ImageIcon imgIcon = new ImageIcon(uploadDir + "/" + sysFileName);
		int width = imgIcon.getIconWidth() / (imgIcon.getIconHeight() / 160);
		this.resizeImg(sysFile, uploadDir + "/" + smallSysFileName, width, 160);

		Upload upload = new Upload();
		upload.setOriname(file.getUploadFileName());
		upload.setSysname(sysFileName);
		upload.setCreateDate(new Date());
		upload.setTechnician(technician);
		upload.setId(file.getUploadid());
		return upload;

	}

	private String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	public void resizeImg(File srcfile, String imgdist, int widthdist, int heightdist) {
		try {
			Image src = javax.imageio.ImageIO.read(srcfile);

			BufferedImage tag = new BufferedImage(widthdist, heightdist, BufferedImage.TYPE_INT_RGB);

			tag.getGraphics().drawImage(src.getScaledInstance(widthdist, heightdist, Image.SCALE_SMOOTH), 0, 0, null);

			FileOutputStream out = new FileOutputStream(imgdist);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(tag);
			out.close();

		} catch (IOException ex) {
			logger.error("压缩图片错误", ex);
		}
	}
}
