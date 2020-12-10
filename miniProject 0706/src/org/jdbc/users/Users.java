package org.jdbc.users;

public class Users {
private Integer no;
private String id;
private String password;
private String name;
private String nickName;
private String country;
private String emailFirst;
private String emailSecond;
private String phone;
private String gender;
private String userImageFile;
private String memberType;
private String regDate;


public Users(){
	
}

public Users(Integer no, String id, String password, String name, String nickName, String country, String emailFirst, String emailSecond, String phone, String gender, String userImageFile, String memberType, String regDate) {
	this.no = no;
	this.id = id;
	this.password = password;
	this.name = name;
	this.nickName = nickName;
	this.country = country;
	this.emailFirst = emailFirst;
	this.emailSecond = emailSecond;
	this.phone = phone;
	this.gender = gender;
	this.userImageFile = userImageFile;
	this.memberType = memberType;
	this.regDate = regDate;
}
public Integer getNo() {
	return no;
}

public void setNo(Integer no) {
	this.no = no;
}

public String getCountry() {
	return country;
}

public void setCountry(String country) {
	this.country = country;
}

public String getUserImageFile() {
	return userImageFile;
}

public void setUserImageFile(String userImageFile) {
	this.userImageFile = userImageFile;
}

//회원가입용
public Users(String id, String password, String name, String nickName, String emailFirst, String emailSecond, String phone, String gender, String birth, String regDate) {
	this.id = id;
	this.password = password;
	this.name = name;
	this.nickName = nickName;
	this.emailFirst = emailFirst;
	this.emailSecond = emailSecond;
	this.phone = phone;
	this.gender = gender;
	this.regDate = regDate;
}

public String getId() {
	return id;
}


public void setId(String id) {
	this.id = id;
}


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}


public String getName() {
	return name;
}


public void setName(String name) {
	this.name = name;
}


public String getNickName() {
	return nickName;
}


public void setNickName(String nickName) {
	this.nickName = nickName;
}


public String getEmailFirst() {
	return emailFirst;
}


public void setEmailFirst(String emailFirst) {
	this.emailFirst = emailFirst;
}


public String getEmailSecond() {
	return emailSecond;
}


public void setEmailSecond(String emailSecond) {
	this.emailSecond = emailSecond;
}


public String getPhone() {
	return phone;
}


public void setPhone(String phone) {
	this.phone = phone;
}


public String getGender() {
	return gender;
}


public void setGender(String gender) {
	this.gender = gender;
}


public String getMemberType() {
	return memberType;
}


public void setMemberType(String memberType) {
	this.memberType = memberType;
}


public String getRegDate() {
	return regDate;
}


public void setRegDate(String regDate) {
	this.regDate = regDate;
}




}

