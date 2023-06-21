package javacontrol;
public class b_05_for {
	public static void main(String[] args) {
//		for (int i =1; i <=10; i++) {
//			System.out.print(i+",");
//			
//		int hab=0;	
//		for ( i =1; i <=10; i++) {
//			hab+=i;
//			
//		for (i =1; i <=10; i++) {
//			System.out.println(i);
//			if (i==5) {
//				continue; // 다음실행
//			System.out.println(i);
//			}
//		}
//		
//		}
//		System.out.println("1부터 10까지의 합 =" + hab);
		
		//2중 for 문
		for (int i=1;i<=3;i++) {
			for (int j=1;j<=3;j++) {
				System.out.println(i+" "+j);
			}
		}
		
		//문제 위의 2중 for 문에서 i=2,j=2일때 중지시키시오
		//for 문을 벗어난 초기화된 변수는 증가한 값으로 남아있음
		//2중 for 문에서 break문은 해당하는 for문에만 영향을 미침
		for (int i=1;i<=3;i++) {
			for (int j=1;j<=3;j++) {
				System.out.println(i+" "+j);
				if (i==2 && j==2 ) {
					break;
				}
			}
			if (i==2 ) {
				break;
			}
		}
		
		
		
		
	}

}
