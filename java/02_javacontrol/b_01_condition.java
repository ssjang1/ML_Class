package javacontrol;
public class b_01_condition {
	public static void main(String[] args) {
		int x=10;
		System.out.println(x++); //10 ->11
		System.out.println(++x); //12 
		System.out.println(x--); //12 ->11
		System.out.println(--x); //10
		int a =10;
		int b =10;
		System.out.println(a++ + ++a); // 10 + 12 => 22
		System.out.println(b++ + b++); // 10 + 11 => 21

		boolean c = true; //1과 의미가 같다
		c=!c; //!는 논리연산자이면서 단항연산자
		System.out.println(c);//false
		c=!c;
		System.out.println(c);//true
		
		a=10;
		b=5;
		int d=20;
		System.out.println(a<b && a<d); //false && true -> false
		System.out.println(a<b & a<d); // false & true -> 0 
		System.out.println(a<b || a<d); //false & true -> true //파이프 기호
		
		a/=100;
		System.out.println(a); 
		
		int number =-13;
		if(number >0) { //false 
			System.out.println("긍정(POSITIVE)");
		}else if (number<0) { //true
			System.out.println("부정(NEGATIVE)");
		}else {
			System.out.println("ZERO");
		}
		//단일명령일 경우에는 block 생략 가능 //block은 처리명령어의 집합이다 
		if (number>0) System.out.println("긍정(POSITIVE)");
		else if (number<0) System.out.println("부정(NEGATIVE)");
		else System.out.println("ZERO");
	}

}
