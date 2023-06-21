package lclass;
// 생성자를 안 만들면 디폴트 생성자가 기본으로 생성이 된다.
public class Student {
	String name;//인스턴스 할 때 공간만 확보 = 데이터를 초기화하는 것이 필요함
	int kor;
	int mat;
	int eng;
	// 인스턴스 될 때 바로 초기화 시키기 위해서 this를 사용했음
	// 생성자는 강제호출이 불가능 => 초기화 될 때 자동으로 한번만 실행
	// 리턴값을 붙이지 않는다.
	// 이름은 클래스 이름과 동일하다.
	
	//생성자 overloading
	public Student(String name,int kor,int mat,int eng) { //생성자
		this.name=name;// this는 클래스가 인스턴스 되었을 경우 자기 자신을 가리키는 지시자
		this.kor=kor;
		this.mat=mat;
		this.eng=eng;
	}
	public Student(String name,int kor,int mat) {
		this.name=name;
		this.kor=kor;
		this.mat=mat;
	}
	public Student(String name,int kor) {
		this.name=name;
		this.kor=kor;
	}
	public void setStudentName(String name) { // set 이름을 바꿀 때
		this.name=name;
	}
	public String getStudentName() { //get 이름을 얻을 때
		return name;
	}
	public void print() {
		System.out.println("이름 :"+name+"국어 :"+kor+"수학 :"+mat+"영어 :"+eng);
	}

}
