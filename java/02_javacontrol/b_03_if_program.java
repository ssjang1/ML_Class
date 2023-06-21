package javacontrol;
import java.util.Scanner; //키보드 입력 -> 버퍼(임시기억장치) (숫자+엔터 입력)
public class b_03_if_program {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		// 문제 나이는 성년(18), 체중은 50 이상인 사람만 헌혈이 가능하다
		// age=25, weight=48인 사람의 헌혈여부를 결정하는 프로그램을 작성하시오
		// 경우의 수를 4가지가 발생
		int age = 18;
		int weight = 50;
		if (age>=18 & weight >=50) {
			System.out.println("가능");		
		}else if (age<18 || weight<=50) {
			System.out.println("불가능");
		}else {
			System.out.println("no");
		}
		
		//문제 숫자 하나를 입력받아서 홀스, 짝수를 판정하는 프로그램을 작성하시오.
		
//		System.out.println("홀짝판정을 위한 숫자를 입력해주세요 : ");
//		int number = input.nextInt();
//		if (number %2 ==0 & number!=0 ) {
//			System.out.println("짝수입니다.");
//		}else if (number %2 ==1) {
//			System.out.println("홀수입니다.");
//		}else {
//			System.out.println("0입니다.");
//		}

		
		//문제 주급 40시간까지는 시간당 10만원 40시간이상이면 초과인 시간에 대해서 15만원을 지급
		//주 작업시간을 입력받아서 주급을 출력하시오
		//optimization 최적화 -> 저장공간을 효율적으로 사용하고 처리속도를 높일 수 있는 방법
		System.out.println("주 작업시간을 입력해주세요 : ");
		int workhour = input.nextInt();
		if (workhour<40) {
			System.out.println(100000*workhour);
		}else if (workhour>=40 & workhour <=52 ) {
			System.out.println(100000*40+150000*(workhour-40));
		}else {
			System.out.println("쉬세요" );
		}
		//선생님 답
		int hours;
		int pay;
		final int basictime=40;
		final int paypertime=100000;
		final int payperovertime=150000;
		
		System.out.println("주 근무시간을 입력하세요");
		hours=input.nextInt();
		if (hours>basictime) {
			pay= basictime *paypertime;
			pay+= (hours-basictime)*payperovertime;
		}
		
		//문제 점수를 입력 받아서 학점으로 매핑하는 프로그램을 작성하시오 (switch case 사용)

		System.out.println("점수를 입력해주세요 : ");
		int score = input.nextInt();
	
		String grade="";
		switch (score/10) {
		case 10:
		case 9 : 
			grade = "a";
			break;
		case 8 : 
			grade = "b";
			break;
		case 7 : 
			grade = "c";
			break;
		case 6 : 
			grade = "d";
			break;
		case 5 : 
		case 4 :
		case 3 :
		case 2 :
		case 1 :
			grade = "f";
			
		}
			System.out.println(grade);
		
				
		
		input.close();	
	}

}
