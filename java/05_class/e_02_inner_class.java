package lclass;
class Student99{//클래스 = 멤버변수 (데이터) + 멤버함수(메서드:처리)
	int studentId; // 변수만 선언
	String studentName;
	int grade;
	String address;
	public void showStudentInfo() {
		System.out.println("학생의 이름은"+studentName+",주소는 "+address+"입니다.");
	}
	String getStudentName() {
		return studentName;
	}
	void printGreeting(String name) {
		System.out.println(name+"님 안녕하세요~^^");
		return;
	}
}
public class e_02_inner_class {

	public static void main(String[] args) {
		Student99 student1=new Student99();// 공간확보 
		student1.studentName="도마동주민";
		String name= student1.getStudentName();
		System.out.println(name);
		student1.showStudentInfo();
		//데이터가 없으면 원래는 에러 발생했는데 이제 수정되서 에러는 안나고 null값이라고 나옴
		student1.address="대전시 도마동";
		student1.showStudentInfo();
		
		//문제 printGreeting 함수를 이용해서 대한이에게 인사해 보세요
		student1.printGreeting("대한");
		
		//이름:강하늘 주소:서울시로 입력해보시오
		Student99 student2 = new Student99();
		student2.studentName="강하늘";
		student2.address="서울시";
		student2.showStudentInfo();
		
		
	}

}
