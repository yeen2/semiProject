package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		int ranNum = (int)(Math.random()*100000);
		
		String name = originFile.getName(); // --> "aaa.png"
		
		String ext = "";
		
		int dot = name.lastIndexOf("."); // 3 (제대로 실행이 안 되면 -1값이 담김)
		
		if(dot != -1) { // 존재할 경우
			ext = name.substring(dot); // ".png"
		}
		
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext;
				
		File newFile = new File(originFile.getParent(), fileName);
		
		return newFile;
	}

}
