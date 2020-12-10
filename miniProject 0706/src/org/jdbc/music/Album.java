package org.jdbc.music;

public class Album {
	private Integer no;
	private String title;
	private String user_Id;
	private String genre;
	private String realese_date;
	private String album_Image_file;
	private Integer likes;
	private String commercial;
	private Integer price;
	private String introduction;
	private Integer quantity;
	
	public Album() {
		
	}
	
	public Album(Integer no, String title, String user_Id, String genre, String realese_date,
			String album_Image_file, Integer likes, String commercial, Integer price, String introduction ) {
		
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getRealese_date() {
		return realese_date;
	}

	public void setRealese_date(String realese_date) {
		this.realese_date = realese_date;
	}

	public String getAlbum_Image_file() {
		return album_Image_file;
	}

	public void setAlbum_Image_file(String album_Image_file) {
		this.album_Image_file = album_Image_file;
	}

	public Integer getLikes() {
		return likes;
	}

	public void setLikes(Integer likes) {
		this.likes = likes;
	}

	public String getCommercial() {
		return commercial;
	}

	public void setCommercial(String commercial) {
		this.commercial = commercial;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	
	
	
}
