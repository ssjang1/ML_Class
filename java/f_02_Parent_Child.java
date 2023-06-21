package m_inheritance;
class Parent{
	int x=100;
	public void setvalue(int x) {
		this.x=x;
	}
	void method() {
		System.out.println("부모함수");
	}
}
class Child extends Parent{
	int x=200;//재정의
	Child(){x=1000;}//자식 생성자
	public void setvalue(int x) {
		this.x=x;
	}
	void method() {
		System.out.println("자식 제1-1함수 : "+x);//부모 함수 오버라이딩
	}
	void method2() {
		System.out.println("자식 제1-2함수 : "+x);//자식에서 추가된 함수
	}
}
class Child2 extends Parent{
	int x=300;
	Child2(){x=2000;}
	public void setvalue(int x) {
		this.x=x;
	}
	void method() {
		System.out.println("자식 2-1함수 : "+x);
	}
	void method3() {
		System.out.println("자식 2-2함수 : "+x);
	}
}
public class f_02_Parent_Child {
	public static void main(String[] args) {	
		Child c=new Child();
		c.method();//Upcasting 은 자동으로 벌어짐
		Parent p=new Child();//부모는 자식을 가리킬 수 있다.
		p.method();//자식의 메쏘드가 출력됨
		c.method2();
//		p.method2();//컴파일 타임에 에러가 남 //부모가 자식을 가리킬 순 있지만 
		//추가된 자식의 메쏘드를 호출 할 수 없다.
		//Downcasting을 동해 호출 할 수 있다.
		Child d=(Child) p;
		d.method2(); //왜 이 행위를 할까?
		Child ch[]=new Child[3]; // 배열의 형태를 지정
		for (int i=0;i<3;i++) {
			ch[i]=new Child();// 실제 메모리를 확보하는 것
		}
		ch[0].setvalue(100);
		ch[1].setvalue(20);
		ch[2].setvalue(10);
		for(int i=0;i<3;i++) {
			ch[i].method();
		}
		System.out.println();
		//Child 3개 Child2 3개가 필요한경우
		//부모의 이름으로 동시에 호출 가능하다.
		Parent chp[]=new Parent[6];
		for (int i=0;i<3;i++) {
			chp[i]=new Child();
		}
		for(int i=3;i<6;i++) {
			chp[i]=new Child2();
		}
		for(int i=0;i<6;i++) {
			chp[i].method();
		}
		//추가된 method는 부모가 알 수가 없다. 그래서 Downcasting 한 다음 호출
		Child ch1[]=new Child[3];
		Child2 ch2[]=new Child2[3]; //0,1,2
		
		for (int i=0;i<3;i++) {
			ch1[i]=(Child)chp[i]; //(Child) 다운 캐스팅 후 호출
			ch1[i].method2();
		}
		for (int i=3;i<6;i++) {
			ch2[i-3]=(Child2)chp[i];
			ch2[i-3].method3();
		}
	}

}
