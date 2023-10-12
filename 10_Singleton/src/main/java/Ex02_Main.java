
public class Ex02_Main {
	public static void main(String[] args) {
//		Ex02_Fruit f1 = new Ex02_Fruit();
//		f1.apple();
//		f1.banana();
//		f1.getInstance();
		
		Ex02_Fruit obj = Ex02_Fruit.getInstance();
		Ex02_Fruit obj1 = Ex02_Fruit.getInstance();
		System.out.println(obj);
		System.out.println(obj1);
		obj.apple();
		obj1.banana();
	}
}
/*
singleton 패턴 규칙
1.생성자는 private 설정
2.객체를 생성하고 리턴해주는 static 메서드 생성
3.클래스 타입의 변수는 static설정
*/








