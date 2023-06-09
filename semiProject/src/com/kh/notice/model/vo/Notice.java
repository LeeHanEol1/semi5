package com.kh.notice.model.vo;

import java.util.Date;

public class Notice {

private int noticeNo;//	NOTICE_NO
private String noticeTitle;//	NOTICE_TITLE
private String noticeWriter;//	NOTICE_WRITER
private String noticeContent;//	NOTICE_CONTENT
private int count;//	COUNT
private Date createDate;//	CREATE_DATE
private String status;//	STATUS

public Notice() {
	super();
}

public Notice(int noticeNo, String noticeTitle, String noticeWriter, String noticeContent, Date createDate) {
	super();
	this.noticeNo = noticeNo;
	this.noticeTitle = noticeTitle;
	this.noticeWriter = noticeWriter;
	this.noticeContent = noticeContent;
	this.createDate = createDate;
}

public Notice(int noticeNo, String noticeTitle, String noticeWriter, int count, Date createDate) {
	super();
	this.noticeNo = noticeNo;
	this.noticeTitle = noticeTitle;
	this.noticeWriter = noticeWriter;
	this.count = count;
	this.createDate = createDate;
}
public int getNoticeNo() {
	return noticeNo;
}
public void setNoticeNo(int noticeNo) {
	this.noticeNo = noticeNo;
}
public String getNoticeTitle() {
	return noticeTitle;
}
public void setNoticeTitle(String noticeTitle) {
	this.noticeTitle = noticeTitle;
}
public String getNoticeWriter() {
	return noticeWriter;
}
public void setNoticeWriter(String noticeWriter) {
	this.noticeWriter = noticeWriter;
}
public String getNoticeContent() {
	return noticeContent;
}
public void setNoticeContent(String noticeContent) {
	this.noticeContent = noticeContent;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public Date getCreateDate() {
	return createDate;
}
public void setCreateDate(Date createDate) {
	this.createDate = createDate;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
@Override
public String toString() {
	return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeWriter=" + noticeWriter
			+ ", noticeContent=" + noticeContent + ", count=" + count + ", createDate=" + createDate + ", status="
			+ status + "]";
}



}
