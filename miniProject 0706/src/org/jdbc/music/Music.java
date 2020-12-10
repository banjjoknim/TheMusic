package org.jdbc.music;

public class Music {
	private Integer no;
	private String title;
	private String albumTitle;
	private String user_Id;
	private String genre;
	private String realese_date;
	private String music_Song_file;
	private String music_Image_file;
	private Integer likes;
	private String commercial;
	private Integer price;
	private String introduction;
	private Integer quantity;


	
	public Music (Integer no, String title) {
		this.no = no;
		this.title = title;
	
	}
	public Music (Integer no, String title, String albumTitle, String user_Id, 
			String genre, String realese_date, String music_Song_file, String music_Image_file, 
			Integer likes, String commercial, Integer price, String introduction) {
		this.no = no;
		this.title = title;
		this.albumTitle = albumTitle;
		this.user_Id = user_Id;
		this.genre = genre;
		this.realese_date = realese_date;
		this.music_Song_file = music_Song_file;
		this.music_Image_file = music_Image_file;
		this.likes = likes;
		this.commercial = commercial;
		this.price = price;
		this.introduction = introduction;
		
	}
	public Music (Integer no, String title, String albumTitle, String user_Id, 
			String genre, String realese_date, String music_Song_file, String music_Image_file, 
			Integer likes, String commercial, Integer price, String introduction, Integer quantity) {
		this.no = no;
		this.title = title;
		this.albumTitle = albumTitle;
		this.user_Id = user_Id;
		this.genre = genre;
		this.realese_date = realese_date;
		this.music_Song_file = music_Song_file;
		this.music_Image_file = music_Image_file;
		this.likes = likes;
		this.commercial = commercial;
		this.price = price;
		this.introduction = introduction;
		this.quantity = quantity;
	}

	public Music () {	
		
		
	}

	public Integer getQuantity() {
		return quantity;
	}
	
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getLikes() {
		return likes;
	}

	public void setLikes(Integer likes) {
		this.likes = likes;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getAlbumTitle() {
		return albumTitle;
	}

	public void setAlbumTitle(String albumTitle) {
		this.albumTitle = albumTitle;
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



	public String getMusic_Song_file() {
		return music_Song_file;
	}


	public void setMusic_Song_file(String music_Song_file) {
		this.music_Song_file = music_Song_file;
	}


	public String getMusic_Image_file() {
		return music_Image_file;
	}


	public void setMusic_Image_file(String music_Image_file) {
		this.music_Image_file = music_Image_file;
	}


	public String getCommercial() {
		return commercial;
	}


	public void setCommercial(String commercial) {
		this.commercial = commercial;
	}
	
	

}