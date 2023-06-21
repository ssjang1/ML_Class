package javabasic; //상단에 패키지 이름
// 자바는 패키지를 기본으로 하고 + 클래스가 기본 
// 접근 지정자 (public)
// 데이터타입
// 변수 앞에는 데이터타입이 있어야 함
// 사용자정의 데이터타입 (기본 데이터타입을 이용해서 사용자가 정의한 데이터타입)
public class a_00_test { //public / protected(상속)/ private
	// 프로그램 진입점 -> 시작하는 클래스
	// 진입점 함수 : 접근 지정자 필요 -> 데이터를 보호하기 위해서 
	// 함수는 리턴해야 한다 -> void는 리턴 값이 없다는 뜻 
	// 함수는 괄호와 함께
	// string은 문자열을 지정 []는 배열 -> 문자열 배열을 받겠다	
	public static void main(String[] args) { //정적함수  
		// 데이터입력 -> 처리 -> 출력
		int a = 100; // 입력     (;은 문장종료점)
		int b = 200;
		int c = a + b; // 처리 
		System.out.println(c); // 출력  (패키지.클래스.함수)

	}

}
