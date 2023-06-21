package m_inheritance;
//추상 클래스는 추상함수가 하나라도 있으면 만들어짐(abstract)
//클래스의 함수가 모두가 추상함수이면 순수 추상 클래스라고하고
//이를 자바에서는 interface라고한다.
//인터페이스에서는 멤버변수를 사용하지 말라고 되어있음 -> 
//사용하면 멤버변수는 public,static(인스턴스 하지 않고 사용),final 수정이 안된다.
//인터페이스는 인스턴스하면 안된다: 부모로 사용은 가능
interface MyInterface{
	public String hello="인터페이스 변수는 기본으로 public static final접근이 가능";
	public void sayHello();
}
//인터페이스는 상속(extends)라고 하지 않고 구현(implements)라고 한다.
//클래스가 인터페이스를 구현
//인터페이스가 인터페이스 상속 될 때는 상속이라고함(인터페이스 간에도 상속이 된다.)
class MyInterfaceImp1 implements MyInterface{
	public void sayHello() {//반드시 오버라이딩 해야함
		System.out.println(MyInterface.hello);
	}
}
public class g_02_interface {
	public static void main(String[] args) {
		System.out.println(MyInterface.hello);//직접 호출이 가능하다.
		MyInterface myinterface=new MyInterfaceImp1();//인스턴스해서 사용
		myinterface.sayHello();
		MyInterface mydim[]=new MyInterface[3];//인터페이스 배열 -부모 배열과 마찬가지
//		mydim[0]=new MyInterface(); 이렇게 하면 안된다.
		mydim[0]=new MyInterfaceImp1(); //구현클래스만 인스턴스가 가능하다.
		mydim[1]=new MyInterfaceImp1();

	}

}