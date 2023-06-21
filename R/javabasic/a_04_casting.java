package javabasic;
public class a_04_casting {
	public static void main(String[] args) {
		
		//캐스팅은 타입을 변화시키는 것
		int myInt = 9;
		double myDouble=myInt; // 암묵적 캐스팅: 작은 사이즈에서 큰 사이즈로 변경되는 암묵적 캐스팅이 자동으로 실행 (int :4byte , double= 8byte)
		
		System.out.println(myInt);
		System.out.println(myDouble);
		
		double myDouble1=9.78d;
		int myInt1=(int) myDouble1;//명시적 캐스팅: 큰 것에서 작은것으로 갈 때는 명시적 캐스팅을 해야한다.
		
		System.out.println(myDouble1);
		System.out.println(myInt1);
		System.out.println(myInt1+myDouble1); // 연산: int+double 연산가능 묵시적으로 사잉즈가 큰 것으로 캐스팅된다.
		
		

	}

}
