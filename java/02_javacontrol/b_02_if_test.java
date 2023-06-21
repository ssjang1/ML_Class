package javacontrol;
import java.util.Scanner; //입력용 
public class b_02_if_test {
	public static void main(String[] args) {
		// class는 instance 를 실행
		// new가 동적 메모리 할당 명령 ->Heap에 저장 -> 변수는 stack에 생성
		// 메모리를 분할 : 힙(작은 메모리로 대량의 데이터를 처리하기위해서 동적메모리 할당을 하는 힙), 스택(함수 호출의 복귀주소를 연결하기위한 스택) 
		// 장치를 사용하거나, 네트워크를 사용하거나 , db를 사용할 때는 반드시 명시적으로 close 해줘야한다.
		Scanner input = new Scanner(System.in); //클래스 초기화 매개변수
		System.out.println("import number please : ");
		int month = input.nextInt();
		String season = null;
		if (month==12 || month==1 || month==2) {
			season="winter";;
		}else if (month==3||month==4||month==5) {
			season="spring";
		}else if (month==6||month==7||month==8) {
			season="summer";
		}else if (month==9||month==10||month==11) {
			season="fall";
		}else {
			season="not exist";
		}
		System.out.println(month +"월은" + season+"입니다." );

		//switch case 문 : 변수에 따라서 분기시키고 싶은 경우에 사용한다 
		
		month = input.nextInt(); //수를 입력받음
		season=null;
		switch (month) { // 변수의 경우의 수에 대해서 분기
		case 12:
		case 1:
		case 2:
			season = "겨울";
			break;
		case 3:
		case 4:
		case 5:
			season="봄";
			break;
		case 6:
		case 7:
		case 8:
			season="여름";
			break;
		case 9:
		case 10:
		case 11:
			season="가을";
			break;
		default:
			season="not exist";
		}//format 문자열 .. digit , string
		System.out.printf("%d월은 %s 입니다.",month,season);
		input.close();
		
	}
	

}
