package javabasic;
public class a_02_binary {
	public static void main(String[] args) {
		System.out.println(Integer.toBinaryString(-8)); //메모리에 있는 내용을 그대로 보여줌
		
		//8은 2진수로 00001000
		//보수를 취함
		//0,1을 바꿔버리는 거(1의보수) 에 +1 을 한다.(2의 보수)
		// 48와 -48을 2진수로 만들어보고 확인하기
		// 110000 , 11111111111111111111111111010000
		System.out.println(Integer.toBinaryString(48));
		System.out.println(Integer.toBinaryString(-48));
		
		int temp=8>>2; //bit shift 하시오
		System.out.println(temp);
		
		//  &:and , |:or 연산자 // 암호화와 관련
		int x= 123;
		int y= 205;
		System.out.println(Integer.toBinaryString(x)); // 01111011
		System.out.println(Integer.toBinaryString(y)); // 11001101
		                                               // 01001001 : and 연산 &
		                                               // 11111111 : or  연산 |
                                                     // 10110110 : xor  연산 ^
		int a = x&y;
		System.out.println(a);
		System.out.println(Integer.toBinaryString(a));
		
		int zz = x|y; // 둘 중 하나라도 참이면 참
		System.out.println(zz);
		System.out.println(Integer.toBinaryString(zz));
		
		int k = x^y; //xor 다르면 참이고 같으면 거짓   // 송신자
		System.out.println(k);
		System.out.println(Integer.toBinaryString(k));
		
		int t= k^y; //수신자
		System.out.println(t);
		System.out.println(Integer.toBinaryString(t));
		
		//비교: 관계연산자 (>, >= , < , <=, ==) 관계연산자의 결과값: true / false
		//숫자 ->큰수
		//문자 ->ascii code 순 (8비트 -> 256, unicode UTF-8로 통일 : 2바이트 문자열)
		
		x=10;
		y=-10;
		int absX= (x>=0) ? x: -x; // 참이면 왼쪽값 : 거짓이면 오른쪽 값
		int absY= (y>=0) ? y: -y;
		System.out.println("x= "+absX);
		System.out.println("y=-"+absY);
		
		
		
	}                                                 
	

}
