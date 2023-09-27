package mypkg;

public class SimpleBean {
	private String msg;
	public SimpleBean() {
		System.out.println("생성자");
	}
	public void setMsg(String msg) {
		this.msg = msg;

	}
	public String getMsg() {
		return msg;
	}
}
