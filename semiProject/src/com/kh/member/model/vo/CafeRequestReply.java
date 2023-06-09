package com.kh.member.model.vo;

import java.util.Date;

public class CafeRequestReply {
	private int replyNo;
	private int refBno;
	private String replyTitle;
	private String replyWriter;
	private String replyContent;
	private Date createDate;
	private String read;
	private String status;
	
	public CafeRequestReply() {
		super();
	}

	public CafeRequestReply(int refBno, String replyWriter, String replyContent, Date createDate) {
		super();
		this.refBno = refBno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
	}

	public CafeRequestReply(int replyNo, int refBno, String replyTitle, String replyWriter, String replyContent,
			Date createDate, String read, String status) {
		super();
		this.replyNo = replyNo;
		this.refBno = refBno;
		this.replyTitle = replyTitle;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.read = read;
		this.status = status;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getReplyTitle() {
		return replyTitle;
	}

	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CafeRequestReply [replyNo=" + replyNo + ", refBno=" + refBno + ", replyTitle=" + replyTitle
				+ ", replyWriter=" + replyWriter + ", replyContent=" + replyContent + ", createDate=" + createDate
				+ ", read=" + read + ", status=" + status + "]";
	}

	
}
