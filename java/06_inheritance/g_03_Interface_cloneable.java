package m_inheritance;
//Cloneable인터페이스-> 객체 복사가 가능하도록 해줌
//어떤 클래스던지 이 인터페이스를 구현하면 객체 복사가 가능해짐
//이렇게 공통기능을 자바측에서 만들어서 제공해 준다.
//:어떤 객체든지 Cloneable을 implement하면 clone이 가능하다.

//Cloneable은 인터페이스
public class g_03_Interface_cloneable implements Cloneable {
	int rollno;
	String name;
	public g_03_Interface_cloneable(int rollno,String name) {
		this.rollno=rollno;
		this.name=name;
	}
	//clone()을 구현
	public Object clone() throws CloneNotSupportedException{//구현해줌
		return super.clone();//Object를 상속받음
	}
	public static void main(String[] args) {
		try {//예외처리
			g_03_Interface_cloneable s1=new g_03_Interface_cloneable(101,"대한민국");
			//Cloneable 을 구현하면 clone함수를 사용하는 것이 가능
			//왜 클론함수가 필요하냐?
			//클래스 대입은 
			//g_03_Interface_cloneable s2=s1; 이런 경우는 복사가 아니라 주소를 전달해서 
			//s2나 s1이나 같은 주소를 가리키게 된다. : 하나를 바꾸면 다른 변수에도 영향을 준다.
			g_03_Interface_cloneable s2=(g_03_Interface_cloneable) s1.clone();
			//위와 같이 clone을 하게 되면 힙에 별도의 공간을 만들어서 데이터를 복사하기 때문에
			//두 변수가 가리키는 위치는 다르다.
			System.out.println(s1.rollno+" "+s1.name);
			System.out.println(s2.rollno+" "+s2.name);
		}
		catch (CloneNotSupportedException cnse) {
			cnse.printStackTrace();
		}
		
		}

}
