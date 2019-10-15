package com.kh.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.PowerLink.model.vo.PowerLink;
import com.kh.admin.model.dao.AdminPageDao;
import com.kh.admin.model.vo.PageInfo;
import com.kh.cafe.model.vo.Cafe;
import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.Member;
import com.kh.question.model.vo.QnAList;
import com.kh.review.model.vo.Declare;
import com.kh.review.model.vo.Review;

public class AdminPageService {

	public ArrayList<Cafe> selectCafeList(PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Cafe> list = new AdminPageDao().selectCafeList(conn, pi);

		if (list != null) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;
	}

	public int getListCount() {

		Connection conn = JDBCTemplate.getConnection();

		int listCount = new AdminPageDao().getListCount(conn);

		if (listCount > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return listCount;
	}

	public int updateIsupload(String arr) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().updateIsupload(conn, arr);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;

	}

	public ArrayList<Cafe> selectCafeNameSearch(String search) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Cafe> list = new AdminPageDao().selectCafeNameSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return list;

	}

	public ArrayList<Cafe> selectApplicantNameSearch(String search) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Cafe> list = new AdminPageDao().selectApplicantNameSearch(conn, search);

		if (list != null) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;
	}

	public int updateIsdelete(String arr) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().updateIsdelete(conn, arr);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;
	}

	public ArrayList<Member> selectMemberList(PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Member> list = new AdminPageDao().selectMemberList(conn, pi);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;
	}

	public ArrayList<Member> selectMemberNickNameSearch(String search) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Member> list = new AdminPageDao().selectMemberNickNameSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	public ArrayList<Member> selectMemberEmailSearch(String search) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Member> list = new AdminPageDao().selectMemberEmailSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	public int getMemberListCount() {

		Connection conn = JDBCTemplate.getConnection();

		int listCount = new AdminPageDao().getMemberListCount(conn);

		if (listCount > 0) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return listCount;
	}

	public int updateMemberDelete(String arr) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().updateMemberDelete(conn, arr);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;
	}

	public ArrayList<Member> WriteCount() {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Member> list = new AdminPageDao().WriteCount(conn);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	public ArrayList<Cafe> CafeImgWriteCount(PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Cafe> list = new AdminPageDao().CafeImgWriteCount(conn);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	public ArrayList<Declare> selectDeclareList(PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Declare> list = new AdminPageDao().selectDeclareList(conn, pi);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;
	}

	public int getDeclareList() {

		Connection conn = JDBCTemplate.getConnection();

		int listCount = new AdminPageDao().getDeclareList(conn);

		if (listCount > 0) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return listCount;
	}

	public ArrayList<Declare> selectDeclareNameSearch(String search) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Declare> list = new AdminPageDao().selectDeclareNameSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	public ArrayList<Declare> selectDeclareContentSearch(String search) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Declare> list = new AdminPageDao().selectDeclareContentSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	public int getPowerLinkCount() {

		Connection conn = JDBCTemplate.getConnection();

		int listCount = new AdminPageDao().getPowerLinkCount(conn);

		if (listCount > 0) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return listCount;

	}

	public ArrayList<PowerLink> selectPowerLinkList(PageInfo pi) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<PowerLink> list = new AdminPageDao().selectPowerLinkList(conn, pi);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		System.out.println(list);
		return list;
	}

	public ArrayList<PowerLink> selectPowrLinkApplicantNameSearch(String search) {
		// TODO Auto-generated method stub

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<PowerLink> list = new AdminPageDao().selectPowrLinkApplicantNameSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	public ArrayList<PowerLink> selectPowerLinkCafeNameSearch(String search) {
		// TODO Auto-generated method stub

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<PowerLink> list = new AdminPageDao().selectPowerLinkCafeNameSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	public int powerRegistration(String arr) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().getPowerCount(conn);

		if (result >= 3) {

			JDBCTemplate.rollback(conn);

			result = 0;

		} else {
			
			result = new AdminPageDao().updatePowerLink(conn, arr);

			JDBCTemplate.commit(conn);

		}

		JDBCTemplate.close(conn);
		return result;
	}

	public int powerCancel(String arr) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().powerCancel(conn, arr);

		if (result > 0) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return result;

	}

	public int PowerLinkCount() {

		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().PowerLinkCount(conn);

		if (result > 0) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;

	}

	public ArrayList<Cafe> selectCafeApplyList(PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Cafe> list = new AdminPageDao().selectCafeApplyList(conn, pi);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;
	}

	public ArrayList<Cafe> selectCafeApplyApplicantNameSearch(String search) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Cafe> list = new AdminPageDao().selectCafeApplyApplicantNameSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return list;
	}

	public ArrayList<Cafe> selectCafeApplyCafeNameSearch(String search) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Cafe> list = new AdminPageDao().selectCafeApplyCafeNameSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return list;
	}

	public int getCafeApplyCount() {

		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().getCafeApplyCount(conn);

		if (result > 0) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;

	}

	public int cafeRegistraion(String arr) {
		int result = 0;
		Connection conn = JDBCTemplate.getConnection();

		int result1 = new AdminPageDao().cafeRegistraion(conn, arr);
		// 사장님으로 승급
		int result2 = new AdminPageDao().updateIsOwner(conn, arr);

		if (result1 > 0 && result2 > 0) {
			JDBCTemplate.commit(conn);
			result = 1;

		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;

	}

	public ArrayList<QnAList> selectQnAList(PageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<QnAList> list = new AdminPageDao().selectQnAList(conn, pi);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	public ArrayList<QnAList> selectQnaApplicantNameSearch(String search) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<QnAList> list = new AdminPageDao().selectQnaApplicantNameSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return list;
	}

	public ArrayList<QnAList> selectQnaTitleSearch(String search) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<QnAList> list = new AdminPageDao().selectQnaTitleSearch(conn, search);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return list;
	}
	
	// 파워링크 상태 바꾸는 메소드
	public int powerLinkStatusChange(int ck, int no, int c_no) {
		int result = 0;

		Connection conn = JDBCTemplate.getConnection();

		int result1 = new AdminPageDao().powerLinkStatusChange(conn, ck, no);
		int result2 = 0;
		
		if(ck == 2) {  //파워링크 등록
			result2 = new AdminPageDao().updateMemberPowerY(conn, c_no);
			
		}else if(ck == 1 || ck == 3){
			result2 = new AdminPageDao().updateMemberPowerN(conn, c_no);
		}
		
		
		if (result1 > 0 && result2>0) {

			JDBCTemplate.commit(conn);
			result = 1;

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;

	}

	public int getQnaCount() {

		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().getQnaCount(conn);

		if (result > 0) {
			JDBCTemplate.commit(conn);

		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;

	}

	public int getReviewList() {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().getReviewList(conn);

		if (result > 0) {
			JDBCTemplate.commit(conn);

		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;

	}

	public ArrayList<Review> selectReviewList(PageInfo pi) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Review> list = new AdminPageDao().selectReviewList(conn, pi);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	public int updateBlack(String arr) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().updateBlack(conn, arr);

		if (result > 0) {

			result = new AdminPageDao().insertBlack(conn, arr);

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return result;

	}

	public int updateBlack(int blackNum) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().updateBlack(conn, blackNum);

		if (result > 0) {

			result = new AdminPageDao().insertBlack(conn, blackNum);

			JDBCTemplate.commit(conn);

		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

	public int getBlackListCount() {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().getBlackListCount(conn);

		if (result > 0) {
			JDBCTemplate.commit(conn);

		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;

	}

	public ArrayList<Member> selectBlackList(PageInfo pi) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Member> list = new AdminPageDao().selectBlackList(conn, pi);

		if (list != null) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return list;
	}

	public int updateRelease(int blackNum) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminPageDao().updateRelease(conn, blackNum);

		if (result > 0) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return result;

	}

}
