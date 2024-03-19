package dto;

public class MemberVo {
	private int memberno;
	private String id;
	private String email;
	private String nickname;
	
	public MemberVo() {}
	
	
	public MemberVo(String id, String email, String nickname) {
		this.id = id;
		this.email = email;
		this.nickname = nickname;
	}

	public MemberVo(int memberno, String id, String email, String nickname) {
		this.memberno = memberno;
		this.id = id;
		this.email = email;
		this.nickname = nickname;
	}


	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	@Override
	public String toString() {
		return "MemberVo [memberno=" + memberno + ", id=" + id + ", email=" + email + ", nickname=" + nickname + "]";
	}
	
	


}

