package org.jdbc.music;

public class Products {
	private String title;
	private String userId;
	private String genre;
	private String realeseDate;
	private String country;
	private String musicFileUrl;
	private String commercial;
	
	public Products(){
		
	}
	public Products(String title, String userId, String genre, String realeseDate, String country, String musicFileUrl, String commercial) {
		
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getRealeseDate() {
		return realeseDate;
	}
	public void setRealeseDate(String realeseDate) {
		this.realeseDate = realeseDate;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getMusicFileUrl() {
		return musicFileUrl;
	}
	public void setMusicFileUrl(String musicFileUrl) {
		this.musicFileUrl = musicFileUrl;
	}
	public String getCommercial() {
		return commercial;
	}
	public void setCommercial(String commercial) {
		this.commercial = commercial;
	}
	
}
