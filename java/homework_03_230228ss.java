package lclass; //과제 가위,바위,보를 클래스로 작성 computer,user,judge 클래스를 만들어서 구현하시오
import java.util.Scanner;
class computer{
	int comrsp;
	public computer() {
	}
	public int computer() {
	comrsp=(int) (Math.random()*100)%3;
	return comrsp;
	}
}
class user{
	Scanner sc=new Scanner(System.in);
	int userrsp;
	public int user() {
	System.out.println("가위(0) 바위(1) 보(2)중에 하나를 선택해주세요.");
	userrsp=sc.nextInt();
	return userrsp;
	}
}
class judge{
	computer cp = new computer();
	int judgement; //0:무승부 1:유저승 2:유저패
	int comrsp=cp.computer();
	user us=new user();
	int userrsp=us.user();
	public void judge() {
		int battle=0; int win=0; int lose=0; int draw=0;
			while (true) {
					if (comrsp==userrsp) {
						judgement=0;
						draw++;
					}
					else if((comrsp+1)%3==userrsp) {
						judgement=1;
						win++;
					}
					else if(comrsp==(userrsp+1)%3) {
						judgement=2;
						draw++;
					}
					battle++;
					System.out.println("결과는 : "+judgement+" (무승부(0) 승리(1) 패배(2))");
					System.out.println(battle+"전"+win+"승"+draw+"무"+lose+"패"+"\n");
			}
	}
}

public class homework_03_230228ss {
	public static void main(String[] args) {
		boolean re=false;
		while(!re) {
			judge jm=new judge();
			jm.judge();

		
		}

	}

}
