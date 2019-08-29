package com.hnzy.hot.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hnzy.hot.pojo.ImgResultDto;

public interface AddCommodityService {
	  ImgResultDto upLoadEditorImg(List<MultipartFile> list,
	            String UploadAbsolutePath,
	            String UploadRelativePath,
	            int commodityId);
	
}
