package mypkg;

public class PersonMain {
	public static void main(String[] args) {
		PersonBean pb = new PersonBean();
		pb.setName("김노아");
		pb.setAge(24);
		pb.setAddr("일산");
		
		System.out.println(pb.getAddr()+" "+pb.getAge()+" "+pb.getName());
	}
}
