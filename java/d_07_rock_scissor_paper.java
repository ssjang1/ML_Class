package kfunction_pkg;
import java.util.Scanner;
public class d_07_rock_scissor_paper {
	public static int doif(int com,int person) {
		if(person==0) {
			if(com==0) {
				return 0;
			}else if (com==1) {return 2;}
			else return 1;
		}else if (person==1) {
			if (com==0) {return 1;}
			else if(com==1) {return 0;}
			else return 2;
		}else {
			if(com==2) {return 2;}
			else if (com==1) {return 1;}
			else return 0;
		}
	}
	
	public static int doarray(int com,int person) {
		int[][] judge = {{0,1,2},{2,0,1},{1,2,0}};
		return judge[com][person];
	}
	
	
	public static int docalc(int com, int person) {
		if(com==(person%3)) {return 0;}
		else if ((com+1)%3==person%3) {return 1;}
		else {return 2;}
	}
	public static void main(String[] args) {
		String judge[]={"비겼습니다.","이겼습니다.","졌습니다."};
		Scanner person=new Scanner(System.in);
		int input;
		int count=0;
		int victory=0;
		int lose=0;
		int draw=0;
		while (true) {
			System.out.println("가위(0) 바위(1) 보(2) 종료(3) 중에 선택하세요!");
			input=Integer.parseInt(person.nextLine());
			int answer =(int) (Math.random()*100);
			if (input==3) {
				System.out.println("\n===게임결과 :"+count +"전 "+ victory +"승"+draw+"무 "+lose +"패. ===");
				break;
			}
			count++;
			if (!(input==0)||input==1||input==2||input==3) {
				System.out.println("잘못 입력했습니다.");
				count--;
			}else {
				int result=doif(answer%3 , input);
				if(result==0) draw++;
				else if(result==1) victory++;
				else lose++;
				System.out.println("당신은"+judge[result]);
			}
			
		}
		
		//과제 홀짝을 함수화 하시오 
		

	}

}
