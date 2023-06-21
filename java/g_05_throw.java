package m_inheritance;
public class g_05_throw {
	static void validate(int age) {
		if(age<18)
			throw new ArithmeticException("정당하지 않습니다.");
		//프로그래머가 강제로 수치 에러를 발생 시킴
		else
			System.out.println("투표 권한 있음");
	}
	public static void main(String[] args) {
		try {
			validate(13);
		}
		catch (Exception m) {System.out.println("Exception 발생");}
		
	}
}