package lclass;
public class e_03_Student_test {
	public static void main(String[] args) {
		Student st=new Student("대한이",100,90,95);//인스턴스 하면서 데이터 초기화
		st.print();
		//멤버 변수가 초기화 되지 않으면 0으로 자동 초기화 됨
		Student st2=new Student("민국이",100,90);
		st2.print();
		
		//문제: 만세를 저장하는 생성자를 오버로딩하는데 국어만 100점 입력하도록 생성자를 만들고 인스턴스하기
		Student st3=new Student("만세",100);
		st3.print();
		//문제 만세의 이름을 만세야로 바꾸고 이름만 출력해보시오
		st3.setStudentName("만세야");
		System.out.println(st3.getStudentName());
		
		
	}

}