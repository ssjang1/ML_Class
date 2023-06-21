package javadarray;
import java.util.Scanner;
public class c_06_rock_scissor_papper {	
	public static void main(String[] args) {
		//입력 (컴퓨터, 사람) 처리(if) 출력(print)
		Scanner input = new Scanner(System.in);
		
		String judge[]= {"비겼습니다.","이겼습니다.","졌습니다"};//각각 0,1,2
		
		int count=0;
		int win=0;
		int draw=0;
		int lose=0;
		
		while(true) {
		
			System.out.println("가위(0)/바위(1)/보(2) 중에 하나를 선택하세요");
			int person= Integer.parseInt(input.nextLine());
			int com = (int) (Math.random()*99);
			if(person==9) {
				break; //무한루프 방지용
			}
			
			person %=3;
			com %=3;
			count+=1;
			int result =0;
			
			if (person==0) {
				if(com==0) {result=0;
			}else if(com==1) {result=2;
			}else {
				result=1;
			}
			}
				else if(person==1) {
					if (com==0) {result=1;
					}else if(com==1) {result=0;
					}else {
						result=2;
					}
				}else {
					if(com==2) {result=2;
					
					}else if (com==1) {result=1;
					
					}else {
						result=0;
					}
					
				}
			switch(result) {
			case 0:draw+=1;break;
			case 1:win+=1;break;
			case 2:lose+=1;break;
			}
			System.out.println("게임결과: "+judge[result]);
			System.out.println("----- 게임결과 : "+count +"전"+win+"승"+draw+"무"+lose+"패 -----\n");
		}
		
	}

}

