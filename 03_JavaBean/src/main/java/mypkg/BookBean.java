package mypkg;

public class BookBean {
	private String title;
	private String author;
	private String publisher;
	private String price;
	private String date;
	private String kind;
	private String[] bookstore;
	private String count;
	public String getKind() {
		return kind;
	}
	public String getCount() {
		return count;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String[] getBookstore() {
		return bookstore;
	}
	public void setBookstore(String[] bookstore) {
		this.bookstore = bookstore;
	}
	
	
}
