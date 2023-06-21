package javacontrol;
import java.util.Scanner;
//프로그래밍은 처리 순서가 중요
public class b_06_while {
	public static void main(String[] args) {
		int i=1;
		while(i<=10) {
			System.out.println(i);
			i++;
		}
		
		i=1;
		do {
			System.out.println(i);
			i++;
		}while(i<=10);
		
		//문제 컴퓨터 유저
		//유저는 숫자를 입력받아서 컴퓨터가 생성한 숫자를 맞추는 게임입니다.
		//컴퓨터는 난수를 이용해서 1부터 100까지의 숫자를 선택합니다.
		//유저는 숫자를 입력해서 컴퓨터가 선정한 숫자를 맞춰야합니다.
		//입력한 숫자가 컴퓨터 숫자보다 크면 크다. 작으면 작다. 같으면 ㅇㅋ
		//게임이 종료되면 몇 번 입력했는지 입력횟수를 출력합니다.
		Scanner input = new Scanner(System.in);
		
//		double randomnumber = Math.floor(100*Math.random()+1);
		
		int win=0;
		int lose=0;
		int battle=0;
		String temp = "";
		
		while(true) {
			battle+=1;
			System.out.println("게임을 시작합니다. (시작은 y 종료는 -1)");
			temp=input.nextLine();
			int randomnumber = (int) (100 * Math.random())+1;
			if (temp.isEmpty()==true || temp.equals("-1")) {
				break;}
			else {
				while(true) {
//					int randomnumber = (int) (100 * Math.random())+1;
					int usertry=1;
					System.out.println("컴퓨터의 숫자를 맞추세요 : ");
					String number = input.nextLine();
					
						if (randomnumber>Integer.parseInt(number)) {
							System.out.println("입력값보다 큰수입니다.");
							usertry+=1;
						}else if (randomnumber<Integer.parseInt(number)) {
							System.out.println("입력값보다 작은수입니다.");
							usertry+=1;
						}else {
							System.out.println("정답!");
							System.out.printf("입력한 횟수는 %d회 입니다." ,usertry);
							if (usertry>7) {
								lose+=1;
								System.out.printf("전적은 %d전 %d승 %d패 입니다.",battle,win,lose);
							}else {
								win+=1;
								System.out.printf("전적은 %d전 %d승 %d패 입니다.",battle,win,lose);
							}
							break;
						}
				}
			}
			
			

		}
		//추가 문제 : 게임이 끝나면 ?전 ?승 ?패를 출력하도록 여러번 게임이 가능하도록 수정하세요
		//중간에 -1이 입력이 되거나 빈 데이터가 들어오면 중지하도록 수정해보세요
		//입력된 내용이 없는 것을 확인하고자 할 때는 문자열로 입력받아서 isEmpty()함수 사용
		//문자열 비교는 equals("-1")
		//input.isEmpty(), input.equals("-1")
		input.close();
		
	}

}
