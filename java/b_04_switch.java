package javacontrol;
import java.util.Scanner;
public class b_04_switch {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		//문제 2월달 윤달을 고려해서 말일을 결정하는 프로그램을 작성하시오 
		//1:31 ,2 ,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31
		//2월달은 년도가 4로 나누어떨어지면 윤년
		//4로 나뉘고 100으로 나누어 떨어지지 않으면 윤년이 아님
		//400으로 나누어 떨어지면 윤년
		
		//경우의 수: 30,31,변동이 있는경우
		//switch case 문 사용해서 해결
		System.out.println("연도를 입력해주세요 : ");
		int year = input.nextInt();
		System.out.println("달을 입력해주세요 : ");
		int month = input.nextInt();
		String lastday=null;
		switch (month) {
			case 4: case 6:
			case 9:
			case 11:
				lastday="30";
				break;
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				lastday="31";
				break;
			case 2: // 논리연산자의 우선순위 단항연산자(!),&&,||
				if (year%400==0 ) {
					lastday="29";
				}else if (year%100==0 ) {
					lastday="28";
				}else if (year%4==0) {
					lastday="29";
				}else {
					lastday="28";
				}break;
			default: System.out.println("해당 월이 없습니다."); break;
		}
		
		
		
		System.out.println("해당 월의 말일은 : " + lastday);
		input.close();	
	}

}
