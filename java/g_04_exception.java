package m_inheritance;
//예외처리
//프로그램은 기본적으로 파일공간이 넉넉하고, 네트워크가 작동하고, 서버가 작동한다는 전제조건에서 진행
//예외적으로 파일공간이 부족하거나 네트워크가 물리적으로 끊어져있거나 서버가 죽어 있는 경우
//프로그램이 중지 될 때 예외를 처리하고 프로그램이 지속적으로 동작하도록 하는 것을 예외처리라고 함
//try catch finally 사용
public class g_04_exception {
	public static void main(String[] args) {
		try {
			int a[]=new int[5]; //배열은 공간 확보하고
//			a[5]=30/0; //0으로 나누면 예외가 발생
			a[5]=30;
			a[4]=30;            //그 다음 값 대입
		}
		//Exception은 클래스 생성이 되어있음
		//예외는 Exception을 상속받아서 구현
		//=>부모인 Exception은 자식 예외의 뒤에 있어야함
//		catch(Exception e) {System.out.println(e);}//부모는 자식을 받을 수 있음
		//=>이런 식이면 Exception이 예외를 다 받아버려서 다른게 에러가 뜸 
		
		//toString을 오버라이딩 해놨다.
		catch(ArithmeticException e) {System.out.println(e);} // 연산에러
		catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("인덱스가 없습니다.");
		}
		catch(Exception e) {System.out.println(e);}
		finally{System.out.println("마지막은 항상 실행");} 
		//예외가 발생하더라도 마지막에 반드시 실행
	}
}