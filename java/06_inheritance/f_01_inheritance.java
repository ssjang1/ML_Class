package m_inheritance;//상속이라는 의미
//모든 클래스는 보이지는 않지만 extends Object를 뒤에 달고있음
class Super_class //extends Object(명시적으로는 이렇게 씀  
{// 부모(Super,parent) 자식(Child)관계
	int num=20;
	public void display() {
		System.out.println("슈퍼클래스에서 출력");
	}
}
public class f_01_inheritance extends Super_class{//인스턴스를 해야사용가능
	int num=10;//재정의 함
	public void display() {
		System.out.println("서브클래스에서 출력");
	}
	public void my_method() {
		f_01_inheritance sub=new f_01_inheritance();//메쏘드 내 인스턴스
		sub.display(); //자식 실행
		super.display(); // 부모 메쏘드 실행 //super.은 부모꺼 
		//자기자신은 this 메모리에서 실행 될 때 부모의 주소값이나 자식의 주소값을 가지고 있는 포인터)
		display(); // 자식 메쏘드 실행
		System.out.println("자식의 변수 : "+sub.num);
		System.out.println("부모의 변수 : "+super.num);//부모의 값도 자식에서 출력가능
		//=> 메모리 내에서 부모의 영역과 자식의 영역은 별도로 존재한다.
		System.out.println("자식의 변수 : "+num);
	}
	public static void main(String[] args) {
		f_01_inheritance obj=new f_01_inheritance();
		obj.display();
		obj.my_method(); 
		
		

	}

}
