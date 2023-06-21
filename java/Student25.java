package m_inheritance;
//문제 (toString 사용) 
//Student25 class에 번호와 이름을 저장하도록 클래스를 구성하고
//문자열을 요구하는 함수에 매개변수로 던져지면 이름과 번호가 출력이 되도록 클래스를 작성해서
//데이터 101,"대한민국만세"로 초기화한 다음 출력해보세요
public class Student25 {
	int number;
	String name;
	public Student25() {
	}
	public Student25(int number,String name) {
		this.number=number;
		this.name=name;
	}
	public void setName() {
		this.name=name;
	}
	public void setNumber() {
		this.number=number;
	}
	public void print(String typing) {
		typing= Integer.toString(number)+name;
		System.out.println(typing);
	}
	
	public static void main(String[] args) {
		Student25 s1=new Student25(101,"대한민국만세");
		String a="hi";
		s1.print("hello");

	}

}
