package com.hnzy.hot.pojo;

public class ImgResultDto {
	public ImgResultDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ImgResultDto(int errno, String[] data) {
		super();
		this.errno = errno;
		this.data = data;
	}

	private int  errno;//错误代码

    private String[] data;//存放数据

	public int getErrno() {
		return errno;
	}

	public void setErrno(int errno) {
		this.errno = errno;
	}

	public String[] getData() {
		return data;
	}

	public void setData(String[] data) {
		this.data = data;
	}
    
}
