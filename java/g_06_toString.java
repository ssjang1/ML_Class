package m_inheritance;
class Student{
	private int rno;
	private String name;
	public Student(int r,String n) {
		rno=r;
		name=n;
	}
	public String toString() {//오버라이딩
		return rno+" "+name;
	}
}
public class g_06_toString {
	public static void main(String[] args) {
		Student s=new Student(101,"대한민국만세");
		System.out.println("학생정보: ");
		System.out.println(s);
		System.out.println(s.toString());
		

	}

}