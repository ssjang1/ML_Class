package javadarray;
public class c_05_sungjuk {
	public static void main(String[] args) {
		//입력 ->처리->출력
		//변수와 데이터타입 결정 : 이름:String 1차원배열, 성적:int 2차원 배열,평균:double 배열
		//3가지를 통일 시키는 것 인덱스에의해 구분
		
		//입력
		String name[]= {"대한","민국","만세"};
		int sungjuk[][]= {{90,90,90,0},{89,89,89,0},{90,99,99,0}};
//		System.out.print(sungjuk.length);
		double acr[]=new double[3];
		//처리
		for(int i=0;i<acr.length;i++) {
			int tot=0;
			for(int j=0;j<acr.length;j++) {
				tot+=sungjuk[i][j];
			}
			sungjuk[i][3]=tot;
			acr[i]=tot/3.0;
		}
		//출력
		System.out.println("----< 성적 계산표 >----");
		System.out.println("이름 국어 영어 수학 합계 평균");
		for (int i=0;i<name.length;i++) {
			System.out.print(name[i]+" ");
			for (int j=0;j<sungjuk[i].length;j++) {
				System.out.print(sungjuk[i][j]+" ");
			}
			System.out.print(acr[i]);
			System.out.println();
		}
		
		
		//팀별과제 
		//1)홀짝 게임 만들기
		//2)가위바위보 
		
		
		
	}
}
