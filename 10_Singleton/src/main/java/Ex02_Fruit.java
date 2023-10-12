
public class Ex02_Fruit {
	private String name;
	private int price;
	
	private static Ex02_Fruit instance; // null, cd57번지
	public static Ex02_Fruit getInstance() { 
		if(instance == null) {
			instance = new Ex02_Fruit();
		}
		return instance; //  cd57번지
	}
	
	private Ex02_Fruit(){
		System.out.println("Ex02_Fruit 생성자");
	}
	public void apple() {
		System.out.println("apple");
	}
	
	public void banana() {
		System.out.println("banana");
	}
	
	
}
