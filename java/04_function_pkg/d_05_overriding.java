package kfunction_pkg;
public class d_05_overriding {
	//함수 이름은 같되 매개변수 타입과 매개변수 숫자가 다르면 다른 함수로 인식하는 것 : 오버로딩
	//함수 이름을 데이터 타입마다 기억해야 하는 번거로움을 덜어주는 방법
	
	public static void f(char c) {System.out.println("문자(char)입니다.");}
	public static void f(int i) {System.out.println("int 형입니다.");}
	public static void f(long i) {System.out.println("long 형입니다.");}
	
	// public 이 없어도 실행되는데에는 문제없음 
	// public이 없으면 클래스 내부에서만 사용한다.
	public static void m() {}
	public static void m(int i) {i=99;}
	public static void m(Integer i) {i=99;}
	public static void m(int arr[]) {arr[0]=99;}
	
	public static void main(String[] args) {
		f('a');
		f(2);
		f(2L);
		
		m();
		int i=10;
		m(i);
		System.out.println(i);
		
		Integer val=10; // Integer 는 정수 wrapper class 라고 함 ( parseInt() ) 
		m(val);
		System.out.println(val);
		
		int arr[]= {10,20,30};
		m(arr);
		//배열, 클래스 instance인 경우: new를 사용하는 경우 reference가 됨
		System.out.println(arr[0]); // 99가 출력됨 배열의 경우 reference로 전달 될 경우 수정시 원본에 영향을 미친다.
		System.out.println(arr.length);
		//데이터 타입마다 함수를 만들어서 사용해야한다.
		
	}

}
