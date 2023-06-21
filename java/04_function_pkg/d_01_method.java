package kfunction_pkg;
import java.util.Scanner;
public class d_01_method {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		System.out.println(100+300);
		
		System.out.println("첫번째 수를 입력해주세요");
		int num1=input.nextInt();
		System.out.println("두번째 수를 입력해주세요");
		int num2=input.nextInt();
		
//		int result = num1+num2;
//		System.out.println("덧셈결과 : "+result);
		
		float output=add(num1,num2);
		System.out.println("덧셈결과 : "+output);
		
		output=multiply(num1,num2);
		System.out.println("곱셈결과: " +output);
		
		output=divide(num1,num2);
		System.out.println("나눗셈결과 :"+ output);
		
		output=substract(num1,num2);
		System.out.println("뺄셈결과 :"+ output);
				
		
	}
	//1번을 실행하더라도 함수로하는게 유리하다: 수정 유지보수가 편리함
	//함수를 만들더라도 클래스 안에서 만들어야한다.
	
	
	//static을 빼면 에러가 남 instance와 관련
	//class 는 사용자 정의 데이터 타입이기 때문에 메모리를 확보해야함 => 이게 인스턴스임
	//static 영역에 저장되기 때문에 그냥 호출할 수 있음
	//똑같은 함수이름인데 데이터 타입만 int에서 float로 바꿔주면 다른함수로 인식함=>
	//오버로딩: 이름은 같은데 매개변수의 타입이 다르거나 매개변수의 갯수가 다르면 다른 함수로 인식하게 하자 : 오버로딩!
	//리턴값이 다른 것은 다른함수로 인식 안 함 오직 매개변수 타입이나 갯수가 달라야 다른 함수로 인식함
	
	
	public static float add(float n1, float n2) {
		float result = n1+n2;
		return result;
	}	
	public static float multiply(float n1,float n2) {
		float result=n1*n2;
		return result;
	}
	public static float divide(float n1,float n2) {
		float result=n1/n2;
		return result;
	}
	public static float substract(float n1,float n2) {
		float result=n1-n2;
		return result;
	}
	
	//문제 곱하기는 multiply, 나누기 divde 빼기 substract : 두 수를 입력 받아서 곱셈,나눗셈,빼기
	//함수 만들기 입력 100,200해서 출력해보기

}
