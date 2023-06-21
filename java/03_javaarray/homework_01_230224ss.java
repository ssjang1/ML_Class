package javadarray;
import java.util.Scanner;
public class homework_01_230224ss {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
	
//		홀짝게임
		int battle=0;
		int win=0;
		int lose=0;
		String temp="";
		
		
		System.out.println("문제1 홀짝게임\n");
		while(true) {
			int randomnumber=(int) (2*Math.random());
			System.out.printf("전적 : %d전 %d승 %d패\n\n",battle,win,lose );
			
			System.out.println("게임을 시작합니다. (시작하려면 아무키나 입력해주세요 종료는 -1)");
			temp=input.nextLine();
			if (temp.isEmpty()==true || temp.equals("-1")) {
				break;}
			battle++;
			System.out.println("컴퓨터의 홀 짝을 맞추세요 : ");
			String oddeven = input.nextLine();
			if (oddeven.equals("홀")) {
				if(randomnumber%2==0) {
					System.out.println("틀렸습니다!\n");
					lose++;
				}else {
					System.out.println("맞췄습니다!\n");
					win++;
				}
			}else if (oddeven.equals("짝")) {
				if(randomnumber%2==1){
					System.out.println("틀렸습니다!\n");
					lose++;
				}else {
					System.out.println("맞췄습니다!\n");
					win++;
				}
			}else {
				System.out.println("다시 입력해주세요\n");
				battle-=1;
			}
		}
		
		
		//가위바위보게임
//		int battle1=0;
//		int win1=0;
//		int draw1=0;
//		int lose1=0;
//		String temp="";
//		
//		System.out.println("문제2 가위바위보 게임\n");
//		int randomnumber1=(int) (3*Math.random());
//		while(true) {
//			System.out.printf("전적 : %d전 %d승 %d무 %d패\n\n",battle1,win1,draw1,lose1 );
//			battle1++;
//		
//			System.out.println("게임을 시작합니다. (시작하려면 아무키나 입력해주세요 종료는 -1)");
//			temp=input.nextLine();
//			if (temp.isEmpty()==true || temp.equals("-1")) {
//				break;}
//			System.out.println("가위? 바위? 보? : ");
//			String rsp = input.nextLine();
//			if(rsp.equals("가위")) {
//				if(randomnumber1==0) {
//					System.out.print("비겼습니다.");
//					draw1++;
//				}else if(randomnumber1==1) {
//					System.out.print("졌습니다.");
//					lose1++;
//				}else if(randomnumber1==2) {
//					System.out.print("이겼습니다.");
//					win1++;
//				}
//				
//			}else if(rsp.equals("바위")) {
//				if(randomnumber1==0) {
//					System.out.print("이겼습니다.");
//					win1++;
//				}else if(randomnumber1==1) {
//					System.out.print("비겼습니다.");
//					draw1++;
//				}else if(randomnumber1==2) {
//					System.out.print("졌습니다.");
//					lose1++;
//				}
//				
//			}else if(rsp.equals("보")){
//				if(randomnumber1==0) {
//					System.out.print("졌습니다.");
//					lose1++;
//				}else if(randomnumber1==1) {
//					System.out.print("이겼습니다.");
//					win1++;
//				}else if(randomnumber1==2) {
//					System.out.print("비겼습니다.");
//					lose1++;
//				}
//			}else {
//				System.out.println("다시 시도하세요");
//				battle1-=1;
//			}
//		}
		
		
		

	}

}
