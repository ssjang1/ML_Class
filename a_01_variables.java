package javabasic;
public class a_01_variables {
	public static void main(String[] args) {
		System.out.println("대한민국"); //오버로딩
		System.out.println("천안시");
		String str = "대전시"; //' 싱글 쿼테이션:문자, "더블 쿼테이션: 문자열인 경우
		//변수는 물리적 주소 위치를 가리킴 예) 0x0000000123
		String str2 = "공주시";
		str = "만세";
		System.out.println(str + "에 살아요");
		System.out.println(str2 + "에 살아요");
		
		int korea=90;
		korea=97;
		int english=100;
		int result=korea+english; // + - * /
		float average=result/2.0f; //float 타입의 데이터는 f
		System.out.println("평균은 "+average);
		//Math는 클래스, static함수들로 구성 
		//클래스는 인스턴스를 해야함 -> Math는 인스턴스하지 않고 사용하고 있음(static 함수로 구성)
		System.out.println("평균은 "+ Math.round(average));
		
		//문제 3.141592출력하기
		final float pi = 3.141592f; // final 을 처리한 변수는 값이 안 바뀜
		System.out.println(pi);
//		pi = 1.5f; //위에 final이 있기때문에 pi값을 바꿀 수 없음
		System.out.println(pi);
		
		
		//문제 소수점 4째자리에서 반올림
		System.out.println(Math.round(1000*pi)/1000f);
		//Math.round 함수는 소수점 첫째자리에서 반올림하기 때문에 원하는 자리에서 반올림 하기위해서 10의 x제곱을 곱해줬다.
		
		//증가연산자
		int i=5;
		i++; //i=i+1 후위 증가연산자
		System.out.println(i++);
		System.out.println(i);
		i=5;
		++i; //전위 증가연산자
		System.out.println(i);
		System.out.println(i++);
		System.out.println(++i);
		
		System.out.println("십의 삼승"+Math.pow(10, 3)); //power

		//데이터 변환 =>데이터가 송수신 될 때는 문자로 변환
		//데이터 타입과 데이터가 불일치하면 입력이 안 됨 
		int num=200; // 변수: 사용한다 
		String s=String.valueOf(num); //클래스: 인스턴스 한다.  //String은 문자열을 다루는 class
		System.out.println(num+100); 
		System.out.println(s+100+100); // 묵시적 캐스팅
		//Wrapper class 
		int num1=Integer.parseInt(s);
		System.out.println(num1); 
		//class는 인스턴스 되어야함 -> 클래스는 사용자 정의 데이터타입
		
		boolean isExisted = false;//true/false 예약어
		System.out.println(isExisted);
		double d1=123456.78;
		System.out.println(d1);
		
		String PI= String.valueOf(Math.PI);
		System.out.println(pi);
		System.out.println(Math.PI);
	
		
		
	}

}
