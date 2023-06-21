package n_generic;
import java.util.*;
//문제 Dept 클래스 생성 ( 부서번호, 부서명, 회사위치): 생성자,get/set함수 생성, 출력함수
//다음과 같이 데이터를 입력하고
//{10,"회계부","서울"}
//{20,"연구부","대전"}
//{30,"영업부","대구"}
//{40,"생산부","천안"}
//{50,"개발부","전주"}
//ArrayList에 입력하고 출력하세요(출력 방법은 3가지를 다 사용해보세요)
//50번 부서를 삭제해보세요
//정렬(sort)하고 2진검색(binary search)을 수행해서 30번을 검색해보세요 -> 검색 기준에 Comparator를 구현해서 적용
public class Dept {
	int num;
	String partname;
	String location;
	public Dept() {	
	}
	public Dept(int num, String partname, String location) {
		this.num=num;
		this.partname=partname;
		this.location=location;
	}
	public void setNum(int num) {
		this.num=num;
	}
	public int getNum() {
		return this.num;
	}
	public void setPartname(String partname) {
		this.partname=partname;
	}
	public String getPartname() {
		return this.partname;
	}
	public void setLocation(String location) {
		this.location=location;
	}
	public String getLocation() {
		return location;
	}
	public void print() {
		System.out.println("부서번호 : "+num+"부서명 : "+partname+"회사 위치 : "+location);
	}
	public String toString() {
		return "부서번호 :"+num+" 부서명 :"+partname+" 회사위치 :"+location;
	}
	public int compareTo(Dept dp) {
		if(num==dp.age)
			return 0;
		else if (age>st.age)
			return 1;
		else
			return -1;	
	}
	public static void main(String[] args) {
		Dept d1=new Dept(10,"회계부","서울");
		Dept d2=new Dept(20,"연구부","대전");
		Dept d3=new Dept(30,"영업부","대구");
		Dept d4=new Dept(40,"생산부","천안");
		Dept d5=new Dept(50,"개발부","전주");
		ArrayList<Dept> members=new ArrayList<Dept>();
		members.add(d1);
		members.add(d2);
		members.add(d3);
		members.add(d4);
		members.add(d5);
		
		//출력방법1
		for (int i=0;i<members.size();i++) {
			System.out.println(members.get(i));
		}
		//출력방법2
		for(Dept temp:members) {
			System.out.println(temp);
		}
		//출력방법3
		ListIterator<Dept>listIterator2=members.listIterator();
		while(listIterator2.hasNext()) {
			System.out.println(listIterator2.next());
		}
		
		//50번 부서 삭제
		members.remove(4);
		System.out.println();
		for (int i=0;i<members.size();i++) {
			System.out.println(members.get(i));
		}
		
		//정렬
		Collections.sort(members);
		
		
		

	}

}
