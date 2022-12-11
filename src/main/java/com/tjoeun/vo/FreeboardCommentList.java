package com.tjoeun.vo;

import java.util.ArrayList;

//	특정 메인글의 댓글 목록을 기억한다.
public class FreeboardCommentList {

	private ArrayList<FreeboardCommentVO> list = new ArrayList<FreeboardCommentVO>();

	public ArrayList<FreeboardCommentVO> getList() {
		return list;
	}
	public void setList(ArrayList<FreeboardCommentVO> list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return "FreeboardCommentList [list=" + list + "]";
	}
	
}
