package javabasic;
public class a_03_math {
	public static void main(String[] args) {
		System.out.println(Math.max(5, 10));
		System.out.println(Math.min(5, 10));
		System.out.println(Math.abs(-4.1));//절대값
		System.out.println(Math.random()); //의사난수: 0~1 사이의 수 1은 포함이 안된다.
		
		//문제 0에서 100사이의 정수형 값을 만들어보시오
		//내 정답
		double random = 101*Math.random();
		System.out.println(Math.round(random));
		//선생님 답
		int randomNum1=(int) (Math.random()*101);
		System.out.println(randomNum1);
		
		System.out.println((int) (Math.random()*101)); //이렇게도 됨
		
		System.out.println(Math.sqrt(65)); // 루트
		System.out.println(Math.pow(10, 3)); //제곱
		System.out.println(Math.log(28)); // 밑이 e 인 로그
		System.out.println(Math.log10(28)); // 상용로그
		System.out.println(Math.exp(3)); 
		
		//삼각함수: 회전하거나 주기성이 있는 두 벡터의 사이각을 구할 때 사용
				
		double b = Math.toRadians(90); // java에서 삼각함수는 라디안사용
		//다시 디그리는 Math.toDegrees()
		System.out.println(Math.sin(b));
		
		//문제 cos 30도 값을 계산한다음 그 결과를 다시 각도로 변환해 보시오.
		
		double degree1=Math.toRadians(30);
		System.out.println(Math.toRadians(30));
		System.out.println(Math.cos(degree1));
		System.out.println(Math.sin(degree1));
		
		System.out.println(Math.toDegrees(Math.acos(Math.cos(degree1)))); //acos => 코사인의 역함수
		
		int degree2= (int) Math.round( Math.toDegrees(degree1));
		System.out.println(degree2);
		
		//문제 32 는 자연대수의 몇승인가?
		double x = Math.log(32);
		System.out.println(x); // 답) 3.4657359027997265
		double y=Math.exp(x);
		System.out.println(y);
		
		//문제 32는 10의 몇 제곱인가?
		double xx= Math.log10(32);
		System.out.println(xx);
		System.out.println(Math.pow(10, xx));
		
		//문제 두 변의 사이각이 45도이고 대각선의 길이가 28이다. 이 때 밑변의 길이는?
		System.out.println(28/Math.sqrt(2));
		System.out.println(28/Math.pow(2,1./2));
		System.out.println(28*Math.cos(Math.toRadians(45)));
		
		
		//문제 밑변이 8 높이가 4라면 사이각은?
		System.out.println(Math.toDegrees(Math.acos(0.5)));


		
		
		
		
	}

}
