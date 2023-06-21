package kfunction_pkg;
//프로그램은 순차적으로 실행 
//분기하는 경우 : if , for, 함수분기, 클래스 영역 분기
public class d_02_method_order {
	int b; //멤버 변수
	int c; 
	static String name; // static 변수 : 딱 1번만 만들어지는 변수 , 클래스 공유변수 , 바꿀 순 있음
	
	public static void main(String[] args) {
		System.out.println("프로그램 시작 첫 함수 호출");
		staticMethod1();//함수 영역으로 분기
		staticMethod1();
		System.out.println("메인으로 복귀");
		System.out.println("종료합니다.");
		
		int x=2;
		System.out.println(equation1(x));

	}
	public static void staticMethod1() {
		//함수가 만들어졌을 때 stack영역에 지역변수가 생성이되고 -> 함수와 생명을 같이한다.
		//함수 처리에 필요한 모든 데이터는 stack에 저장되어야한다. ->주소로 참조하는 것도 가능(참조 변수가 stack에 만들어져야함)
		int a=10;
		System.out.println("첫 함수 진입");
		staticMethod2();
		System.out.println("두번째 함수 호출 종료");
	}
	public static void staticMethod2() {
		System.out.println("두번째 함수 진입");
		System.out.println("두번째 함수 종료");
	}
	public static double equation1(double n1) {
		double y=  (2*Math.pow(n1, 2)+4*n1+1);
		return y;
	}
	
	//문제 y=ax^2 +bx+ c 일 때 이를 함수로 구현하고 a=2,b=4,c=1일때 x가 2라면 어떤 값을 리턴하는지 출력하시오
	//자바에서 제곱은 Math.pow( , )
	

}
