package Model;

public class memberDTO {
	String email;
	String pw;
	String tel;
	String address;
	
	
	
	public memberDTO(String email, String pw) {
		super();
		this.email = email;
		this.pw = pw;
	}

	public memberDTO(String email, String pw, String tel, String address) {
		super();
		this.email = email;
		this.pw = pw;
		this.tel = tel;
		this.address = address;
	}

	public memberDTO(String email, String tel, String address) {
		super();
		this.email = email;
		this.tel = tel;
		this.address = address;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	
	
	
}
