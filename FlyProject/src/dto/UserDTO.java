package dto;

public class UserDTO {
String email;
String passwd;
String first_name;
String last_name;
String national;
String N_number;
String P_number;
String P_port;
String p_issue;
String p_expiry;
String salt;
String birth;
String gender;

public String getEmail() {
	System.out.println("dto : "+email);
	return email;

}

public void setEmail(String email) {
	System.out.println("dto : "+email);
	this.email = email;
}

public String getPasswd() {
	return passwd;
}

public void setPasswd(String passwd) {
	this.passwd = passwd;
}

public String getFirst_name() {
	return first_name;
}

public void setFirst_name(String first_name) {
	this.first_name = first_name;
}

public String getLast_name() {
	return last_name;
}

public void setLast_name(String last_name) {
	this.last_name = last_name;
}

public String getNational() {
	return national;
}

public void setNational(String national) {
	this.national = national;
}

public String getN_number() {
	return N_number;
}

public void setN_number(String n_number) {
	N_number = n_number;
}

public String getP_number() {
	return P_number;
}

public void setP_number(String p_number) {
	P_number = p_number;
}


public String getP_port() {
	return P_port;
}

public void setP_port(String p_port) {
	P_port = p_port;
}

public String getP_issue() {
	return p_issue;
}

public void setP_issue(String p_issue) {
	this.p_issue = p_issue;
}

public String getP_expiry() {
	return p_expiry;
}

public void setP_expiry(String p_expiry) {
	this.p_expiry = p_expiry;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public String getBirth() {
	return birth;
}

public void setBirth(String birth) {
	this.birth = birth;
}

public String getSalt() {
	return salt;
}

public void setSalt(String salt) {
	this.salt = salt;
}



}
