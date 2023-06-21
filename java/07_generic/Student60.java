package n_generic;
import java.util.*;//generic의 자료구조
import java.io.*; //파일
//비교와 저장을 위해서 interface구현 (implement)
public class Student60 implements Comparator<Student60>,Comparable<Student60>,Serializable{
	//데이터를 결정
	String name="";
	int ban; int no; int kor; int math; int eng; int total;
	Student60(){}//default 생성자
	//데이터 입력
	Student60(String name,int ban, int no, int kor,int math,int eng){
		this.name=name;this.ban=ban;this.no=no;this.kor=kor;this.math=math;
		this.eng=eng;this.total=kor+math+eng;
	}
	public void setName(String name) {
		this.name=name;
	}
	//데이터 출력
	public void showtitle() {
		System.out.println("이름"+"\t"+"ban"+"\t"+"번호"+"\t"+"국어"+"\t"+"수학"+"\t"+"영어"+"\t"+"합계");
	}
	public String toString() {//Object를 통해 상속해 오버라이딩 하고있음
		return name+"\t"+ban+"\t"+no+"\t"+kor+"\t"+math+"\t"+eng+"\t"+total;
	}
	//비교해야 할 일이 있어 인터페이스를 오버라이딩
	public int compareTo(Student60 sampleStu1) {//문자열 비교
		return name.compareTo(sampleStu1.name);
	}
	public int compare(Student60 samplestud1,Student60 sampleStu2) {//문자열 비교
		return sampleStu2.total-samplestud1.total;
	}
}
