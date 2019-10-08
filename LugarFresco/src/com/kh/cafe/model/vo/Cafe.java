package com.kh.cafe.model.vo;

import java.sql.Date;
import java.util.ArrayList;

// 추가할것 - 조회수, 평점, 즐겨찾기

public class Cafe {

	private int c_no; // 카페 번호
	private int m_no; // 사장 번호
	private String cafe_name; // 카페 이름
	private String address;   // 카페 주소
	private String address_detail; // 카페 상세 주소
	private String phone;      // 카페 전화번호
	private String content;    // 카페 정보
	private String br_name;    // 사업자 등록증 원본명
	private String br_up_name; // 사업자 등록증 수정명
	private String br_path;
	private String isUpload;  // 실제 업로드 유무
	private String isPower;   // 파워등록 유무
	private Date reg_date;    // 카페 등록 신청 날짜
	private Date upload_date; // 카페 업로드 날짜
	private String idDelete; // 삭제 유무

	private int favorite; // 즐겨찾기 수
	private int count;    // 조회수

	// cafeinfo에서 보여주기용
	private int review_count;
	private double sum_avg;
	ArrayList<CafeImg> imgList;  //카페이미지 리스트
	
	// cafeList
	private int myFavorite;   // 로그인 했으면, 카페리스트중 좋아요 했는지 알아보기 -->  0:안함  1:함
	private String titleImg;  // img_level=1인 대표이미지

	// myPage
	// Favorite에서 필요한 변수
	private int f_no;
	private String img_path;
	private String img_name;

	// RLike에서 필요한 변수
	private int l_no;
	private int r_no;
	private String nickName;
	private String r_content;
	private Date r_date;
	private int r_like;
	private int r_declare;
	private String r_img_path;
	private String r_img_name;

	//성환
	private String profile_path;

	
	public Cafe() {
		// TODO Auto-generated constructor stub
	}

	// cafeInfo 보여줄때 생성자
	public Cafe(int c_no, int m_no, String cafe_name, String address, String address_detail, String phone,
			String content, String isUpload, String isPower, int favorite, int count, int review_count, 
			double sum_avg, ArrayList<CafeImg> imgList) {
		super();
		this.c_no = c_no;
		this.m_no = m_no;
		this.cafe_name = cafe_name;
		this.address = address;
		this.address_detail = address_detail;
		this.phone = phone;
		this.content = content;
		this.isUpload = isUpload;
		this.isPower = isPower;
		this.favorite = favorite;
		this.count = count;
		this.review_count = review_count;
		this.sum_avg = sum_avg;
		this.imgList = imgList;
	}
	

	// cafeInfo 보여줄때 생성자
	public Cafe(int c_no, int m_no, String cafe_name, String address, String address_detail, String phone,
			String content, String isUpload, String isPower, int favorite, int count, int review_count, 
			double sum_avg) {
		super();
		this.c_no = c_no;
		this.m_no = m_no;
		this.cafe_name = cafe_name;
		this.address = address;
		this.address_detail = address_detail;
		this.phone = phone;
		this.content = content;
		this.isUpload = isUpload;
		this.isPower = isPower;
		this.favorite = favorite;
		this.count = count;
		this.review_count = review_count;
		this.sum_avg = sum_avg;
	}
	
	
	// cafeList용
	public Cafe(int c_no, int m_no, String cafe_name, String address, String address_detail, String phone,
			String content, String isUpload, String isPower, int favorite, double sum_avg,
			String titleImg, int myFavorite) {
		super();
		this.c_no = c_no;
		this.m_no = m_no;
		this.cafe_name = cafe_name;
		this.address = address;
		this.address_detail = address_detail;
		this.phone = phone;
		this.content = content;
		this.isUpload = isUpload;
		this.isPower = isPower;
		this.favorite = favorite;
		this.sum_avg = sum_avg;
		this.titleImg = titleImg;
		this.myFavorite = myFavorite;
	}

	// Favorite 매개변수 생성자
		public Cafe(int c_no, String cafe_name, int favorite, int count, int review_count, double sum_avg, int f_no,
				String img_path, String img_name) {
			super();
			this.c_no = c_no;
			this.cafe_name = cafe_name;
			this.favorite = favorite;
			this.count = count;
			this.review_count = review_count;
			this.sum_avg = sum_avg;
			this.f_no = f_no;
			this.img_path = img_path;
			this.img_name = img_name;
		}

		// RLike 매개변수 생성자
		public Cafe(int c_no, String cafe_name, double sum_avg, String img_path, String img_name, int l_no, int r_no,
				String nickName, String r_content, Date r_date, int r_like, int r_declare, String r_img_path, String r_img_name) {
			super();
			this.c_no = c_no;
			this.cafe_name = cafe_name;
			this.sum_avg = sum_avg;
			this.img_path = img_path;
			this.img_name = img_name;
			this.l_no = l_no;
			this.r_no = r_no;
			this.nickName = nickName;
			this.r_content = r_content;
			this.r_date = r_date;
			this.r_like = r_like;
			this.r_declare = r_declare;
			this.r_img_path = r_img_path;
			this.r_img_name = r_img_name;
		}
		
		// owner 카페 리스트 매개변수
		public Cafe(int c_no, int m_no, String cafe_name, String address, String address_detail, String phone,
				String content, String isUpload, String isPower, Date reg_date, int favorite, int count, int review_count, 
				double sum_avg, String img_path, String img_name) {
			super();
			this.c_no = c_no;
			this.m_no = m_no;
			this.cafe_name = cafe_name;
			this.address = address;
			this.address_detail = address_detail;
			this.phone = phone;
			this.content = content;
			this.isUpload = isUpload;
			this.isPower = isPower;
			this.reg_date = reg_date;
			this.favorite = favorite;
			this.count = count;
			this.review_count = review_count;
			this.sum_avg = sum_avg;
			this.img_path = img_path;
			this.img_name = img_name;
		}

		// 사업자등록증 다운로드 매개변수
		public Cafe(String br_name, String br_up_name, String br_path) {
			super();
			this.br_name = br_name;
			this.br_up_name = br_up_name;
			this.br_path = br_path;
		}
		

	public Cafe(int c_no, int m_no, String cafe_name, String address, String address_detail, String phone,
			String content, String br_name, String br_up_name, String isUpload, String isPower, Date reg_date,
			Date upload_date, String idDelete, int favorite) {
		super();
		this.c_no = c_no;
		this.m_no = m_no;
		this.cafe_name = cafe_name;
		this.address = address;
		this.address_detail = address_detail;
		this.phone = phone;
		this.content = content;
		this.br_name = br_name;
		this.br_up_name = br_up_name;
		this.isUpload = isUpload;
		this.isPower = isPower;
		this.reg_date = reg_date;
		this.upload_date = upload_date;
		this.idDelete = idDelete;
		this.favorite = favorite;
	}

	// 성환이 admin에서 씀
	public Cafe(int c_no, int m_no, String cafe_name, String address, String address_detail, String phone,
			String content, String br_name, String br_up_name, String isUpload, String isPower, Date reg_date,
			Date upload_date, String idDelete) {
		super();
		this.c_no = c_no;
		this.m_no = m_no;
		this.cafe_name = cafe_name;
		this.address = address;
		this.address_detail = address_detail;
		this.phone = phone;
		this.content = content;
		this.br_name = br_name;
		this.br_up_name = br_up_name;
		this.isUpload = isUpload;
		this.isPower = isPower;
		this.reg_date = reg_date;
		this.upload_date = upload_date;
		this.idDelete = idDelete;
	}
	
	//cafeList에 게시글과 대표사진
	public Cafe(int c_no, String img_path,String cafe_name, int review_count) {
		super();
		this.c_no= c_no;
		this.img_path=img_path;
		this.cafe_name=cafe_name;
		this.review_count=review_count;
	}
	//성환
	public Cafe(int c_no, String cafe_name, String nickName, Date reg_date, Date upload_date, String isUpload) {
		super();
		this.c_no = c_no;
		this.cafe_name = cafe_name;
		this.nickName = nickName;
		this.reg_date = reg_date;
		this.upload_date = upload_date;
		this.isUpload = isUpload;
	}
	//성환
	public Cafe(int c_no, int m_no, String cafe_name, String address, String address_detail, String phone,
			String content, String br_name, String br_up_name, String isUpload, String isPower, Date reg_date,
			Date upload_date, String idDelete, int review_count, String profile_path, String nickName) {
		super();
		this.c_no = c_no;
		this.m_no = m_no;
		this.cafe_name = cafe_name;
		this.address = address;
		this.address_detail = address_detail;
		this.phone = phone;
		this.content = content;
		this.br_name = br_name;
		this.br_up_name = br_up_name;
		this.isUpload = isUpload;
		this.isPower = isPower;
		this.reg_date = reg_date;
		this.upload_date = upload_date;
		this.idDelete = idDelete;
		this.review_count = review_count;
		this.profile_path = profile_path;
		this.nickName = nickName;
	}
	
	// 성환이 admin에서 씀
		public Cafe(int c_no, int m_no, String cafe_name, String address, String address_detail, String phone,
				String content, String br_name, String br_up_name, String isUpload, String isPower, Date reg_date,
				Date upload_date, String idDelete, String nickName) {
			super();
			this.c_no = c_no;
			this.m_no = m_no;
			this.cafe_name = cafe_name;
			this.address = address;
			this.address_detail = address_detail;
			this.phone = phone;
			this.content = content;
			this.br_name = br_name;
			this.br_up_name = br_up_name;
			this.isUpload = isUpload;
			this.isPower = isPower;
			this.reg_date = reg_date;
			this.upload_date = upload_date;
			this.idDelete = idDelete;
			this.nickName = nickName;
		}



	public Cafe(int c_no, int m_no, String cafe_name, String address, String address_detail, String phone,
			String content, String br_name, String br_up_name, String br_path, String isUpload, String isPower,
			Date reg_date, Date upload_date, String idDelete, int favorite, int count, int f_no, String img_path,
			String img_name, int l_no, int r_no, String r_content) {
		super();
		this.c_no = c_no;
		this.m_no = m_no;
		this.cafe_name = cafe_name;
		this.address = address;
		this.address_detail = address_detail;
		this.phone = phone;
		this.content = content;
		this.br_name = br_name;
		this.br_up_name = br_up_name;
		this.br_path = br_path;
		this.isUpload = isUpload;
		this.isPower = isPower;
		this.reg_date = reg_date;
		this.upload_date = upload_date;
		this.idDelete = idDelete;
		this.favorite = favorite;
		this.count = count;
		this.f_no = f_no;
		this.img_path = img_path;
		this.img_name = img_name;
		this.l_no = l_no;
		this.r_no = r_no;
		this.r_content = r_content;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getCafe_name() {
		return cafe_name;
	}

	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBr_name() {
		return br_name;
	}

	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}

	public String getBr_up_name() {
		return br_up_name;
	}

	public void setBr_up_name(String br_up_name) {
		this.br_up_name = br_up_name;
	}

	public String getBr_path() {
		return br_path;
	}

	public void setBr_path(String br_path) {
		this.br_path = br_path;
	}

	public String getIsUpload() {
		return isUpload;
	}

	public void setIsUpload(String isUpload) {
		this.isUpload = isUpload;
	}

	public String getIsPower() {
		return isPower;
	}

	public void setIsPower(String isPower) {
		this.isPower = isPower;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public String getIdDelete() {
		return idDelete;
	}

	public void setIdDelete(String idDelete) {
		this.idDelete = idDelete;
	}

	public int getFavorite() {
		return favorite;
	}

	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public double getSum_avg() {
		return sum_avg;
	}

	public void setSum_avg(double sum_avg) {
		this.sum_avg = sum_avg;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public int getL_no() {
		return l_no;
	}

	public void setL_no(int l_no) {
		this.l_no = l_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getR_like() {
		return r_like;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}

	public int getR_declare() {
		return r_declare;
	}

	public void setR_declare(int r_declare) {
		this.r_declare = r_declare;
	}

	public String getR_img_path() {
		return r_img_path;
	}

	public void setR_img_path(String r_img_path) {
		this.r_img_path = r_img_path;
	}

	public String getR_img_name() {
		return r_img_name;
	}

	public void setR_img_name(String r_img_name) {
		this.r_img_name = r_img_name;
	}
	
	//성환
	public String getProfile_path() {
		return profile_path;
	}

	//성환
	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	
	public ArrayList<CafeImg> getImgList() {
		return imgList;
	}

	public void setImgList(ArrayList<CafeImg> imgList) {
		this.imgList = imgList;
	}

	public int getMyFavorite() {
		return myFavorite;
	}

	public void setMyFavorite(int myFavorite) {
		this.myFavorite = myFavorite;
	}
	
	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Cafe [c_no=" + c_no + ", m_no=" + m_no + ", cafe_name=" + cafe_name + ", address=" + address
				+ ", address_detail=" + address_detail + ", phone=" + phone + ", content=" + content + ", br_name="
				+ br_name + ", br_up_name=" + br_up_name + ", br_path=" + br_path + ", isUpload=" + isUpload
				+ ", isPower=" + isPower + ", reg_date=" + reg_date + ", upload_date=" + upload_date + ", idDelete="
				+ idDelete + ", favorite=" + favorite + ", count=" + count + ", review_count=" + review_count
				+ ", sum_avg=" + sum_avg + ", imgList=" + imgList + ", myFavorite=" + myFavorite + ", titleImg="
				+ titleImg + ", f_no=" + f_no + ", img_path=" + img_path + ", img_name=" + img_name + ", l_no=" + l_no
				+ ", r_no=" + r_no + ", nickName=" + nickName + ", r_content=" + r_content + ", r_date=" + r_date
				+ ", r_like=" + r_like + ", r_declare=" + r_declare + ", r_img_path=" + r_img_path + ", r_img_name="
				+ r_img_name + ", profile_path=" + profile_path + "]";
	}

	

	
	

	

}
