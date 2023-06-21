package lclass;
//생성자를 안 만들면 디폴트 생성자가 기본으로 생성
class test_class{ // public을 넣으면 에러가 남 //ineer class 내부 클래스
	int data;
	int change(int data) {
		data=data+100;
		return data;
	}
}
public class e_01_class {
	int data=50; // 파이썬으로부터 자바측이 받아 들인 것 public이 없어도 퍼블릭이 기본이 됨
	// 클래스의 기본개념
	// 캡슐화 : 데이터 보호
	// 추상화
	// 상속화
	// 다형성
	int change(int data) { //static을 안 붙인경우 //멤버 함수 
		//함수의 지역변수가 우선함
		data=data+100;
		return data;
	}
	//프로그램 진입점
	public static void main(String[] args) {
		//변수는 메인함수 stack에 저장, 데이터는 heap에 저장
		
		e_01_class op = new e_01_class(); // class는 동적 메모리 할당으로 메모리 확보
		System.out.println(op.data);
		int ret = op.change(500);
		System.out.println(ret);
		System.out.println(op.data);
		
		test_class tc= new test_class();
		ret=tc.change(1000);
		System.out.println(ret);
		

	}

}
