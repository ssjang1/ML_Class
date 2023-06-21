package n_generic;
import java.util.*;
class Dept2{
	public int deptno;
	public String dname;
	public String loc;
	public Dept2() {	
	}
	public Dept2(int deptno,String dname,String loc) {
		this.deptno=deptno;
		this.dname=dname;
		this.loc=loc;
	}
	public Integer getDeptno() {
		return Integer.valueOf(deptno);
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String toString() {
		return "부서번호 :"+deptno+" 부서이름 :"+dname+" 위치 :"+loc;
	}
}
public class h_07_dept {
	public static void main(String[] args) {
		Dept2 s1=new Dept2(10,"회계부","서울");
		Dept2 s2=new Dept2(20,"연구부","대전");
		Dept2 s3=new Dept2(30,"영업부","대구");
		Dept2 s4=new Dept2(40,"생산부","천안");
		Dept2 s5=new Dept2(50,"개발부","전주");
		ArrayList<Dept2> al=new ArrayList<Dept2>();
		al.add(s1);al.add(s2);al.add(s3);al.add(s4);al.add(s5);
		
		Iterator<Dept2> itr=al.iterator();
		while(itr.hasNext()) {
			Dept2 st=(Dept2) itr.next(); 
			// 반복자는 위치만 가리킬 뿐 어떤 데이터 타입인지 모른다. 그래서 캐스팅을 해준다
			System.out.println(st);
		}
		
		al.forEach(a->{System.out.println(a);});
		
		itr=al.iterator();
		while(itr.hasNext()) {
			Dept2 st=(Dept2)itr.next();
			if(st.deptno==50) {
				al.remove(st);//데이터 통째로 넘겨줌
				break;
			}
		}
		
		//검색 : generic에서는 Wrapper 클래스만 가능하다.
		Comparator<Dept2>comp=new Comparator<Dept2>() {
			public int compare(Dept2 u1,Dept2 u2) {
				return u1.getDeptno().compareTo(u2.getDeptno());
			}
		};
		Collections.sort(al,comp);//정렬
		int index=Collections.binarySearch(al, new Dept2(30,null,null),comp);
		System.out.println("이진검색으로 찾은 인덱스 :"+index);//번호
		System.out.println("이진검색으로 찾은 데이터 :"+al.get(index));//class
		al.get(index).setLoc("개발부");
		int index2=Collections.binarySearch(al, new Dept2(10,null,null),comp);
		al.remove(index2);
		
		//LinkedList는 삽입삭제가 용이하다
		LinkedList<Dept2> ll=new LinkedList<Dept2>();
		ll.add(s1);
		ll.add(s2);
		ll.add(s3);
		ll.add(s4);
		ll.add(s5);
		Iterator<Dept2> itr2=ll.iterator();
		while(itr2.hasNext()) {
			Dept2 dept2=(Dept2)itr2.next();
			System.out.println(dept2);
		}
		LinkedList<Dept2>ll2=new LinkedList<Dept2>();
		ll2.add(s1);
		ll2.add(s2);
		//링크드 리스트를 다른 링크드 리스트에 추가
		ll.addAll(ll2);
		ll.remove(0);
		//하나의 링크드 리스트를 다른 링크드 리스트에서 삭제
		ll.removeAll(ll2);
		//삽입삭제
//		ll.addFrist()				선두에 추가
//		ll.addLast()				후미 추가
//		ll.removeFirst()			선두삭제
//		ll.removeLast()				후미삭제
//		ll.removeFirstOccurrence()	처음발생하는 것
//		ll.removeLastOccurrence()	마지막에 발견되는 것
//		ll.clear()					모두 지우기
		//역순으로 순회
		System.out.println("역순으로 출력하기");
		Iterator reverse_iter=ll.descendingIterator();
		while(reverse_iter.hasNext()) {
			Dept2 dept2=(Dept2) reverse_iter.next();
			System.out.println(dept2);
		}
		
	}

}
