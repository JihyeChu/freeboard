package com.tjoeun.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.vo.FreeboardCommentVO;

public class FreeboardCommentDAO {

	private static FreeboardCommentDAO instance = new FreeboardCommentDAO();
	private FreeboardCommentDAO() { }
	public static FreeboardCommentDAO getInstance() {
		return instance;
	}
	
//	FreeboardCommentService 클래스에서 호출되는 mapper와 댓글 데이터가 저장된 객체를 넘겨받고
//	댓글을 저장하는 freeboardcomment.xml 파일의 insert sql 명령을 실행하는 메소드
	public void insertComment(SqlSession mapper, FreeboardCommentVO vo) {
		System.out.println("FreeboardCommentDAO 클래스의 insertComment() 메소드");
//		insert, delete, update sql 명령의 실행 결과를 리턴시키면 sql 명령이 성공적으로 실행된 횟수가
//		리턴된다.
		mapper.insert("insertComment", vo);
	}
	
//	FreeboardCommentService 클래스에서 호출되는 mapper와 메인글의 글번호를 넘겨받고 댓글
//	개수를 얻어오는 freeboardcomment.xml 파일의 select sql 명령을 실행하는 메소드
	public int commentCount(SqlSession mapper, int idx) {
		System.out.println("FreeboardCommentDAO 클래스의 commentCount() 메소드");
		return (int) mapper.selectOne("commentCount", idx);
	}
	
//	FreeboardCommentService 클래스에서 호출되는 mapper와 메인글의 글번호를 넘겨받고 메인글의
//	댓글 목록을 얻어오는 freeboardcomment.xml 파일의 select sql 명령을 실행하는 메소드
	public ArrayList<FreeboardCommentVO> selectCommentList(SqlSession mapper, int idx) {
		System.out.println("FreeboardCommentDAO 클래스의 selectCommentList() 메소드");
		return (ArrayList<FreeboardCommentVO>) mapper.selectList("selectCommentList", idx);
	}
	
//	FreeboardCommentService 클래스에서 호출되는 mapper와 댓글의 글번호를 넘겨받고 댓글 1건을
//	얻어오는 freeboardcomment.xml 파일의 select sql 명령을 실행하는 메소드
	public FreeboardCommentVO selectCommentByIdx(SqlSession mapper, int idx) {
		System.out.println("FreeboardCommentDAO 클래스의 selectCommentByIdx() 메소드");
		return (FreeboardCommentVO) mapper.selectOne("selectCommentByIdx", idx);
	}
	
//	FreeboardCommentService 클래스에서 호출되는 mapper와 수정할 댓글 정보가 저장된 객체를 넘겨받고
//	댓글 1건을 수정하는 freeboardcomment.xml 파일의 update sql 명령을 실행하는 메소드
	public void updateComment(SqlSession mapper, FreeboardCommentVO vo) {
		System.out.println("FreeboardCommentDAO 클래스의 updateComment() 메소드");
		mapper.update("updateComment", vo);
	}
	
//	FreeboardCommentService 클래스에서 호출되는 mapper와 삭제할 댓글 정보가 저장된 객체를 넘겨받고
//	댓글 1건을 삭제하는 freeboardcomment.xml 파일의 delete sql 명령을 실행하는 메소드
	public void deleteComment(SqlSession mapper, FreeboardCommentVO vo) {
		System.out.println("FreeboardCommentDAO 클래스의 deleteComment() 메소드");
		mapper.delete("deleteComment", vo);
	}
	
}
