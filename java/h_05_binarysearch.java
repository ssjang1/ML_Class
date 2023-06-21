package n_generic;
import java.util.*;
class Domain{
	private int id;
	private String url;
	public Domain(int id,String url) {
		this.id=id;
		this.url=url;
	}
	public Integer getId() {
		return Integer.valueOf(id);
		//id는 int형인데 왜 Integer을 했을까?
		//정수형은 primitive데이터 타입이다 
		//generic에서는 class를 사용한다.
	}
}
//클래스는 사용자 정의 타입이기 때문에 =>클래스를 비교하는 방법이 없으면 안됨
public class h_05_binarysearch {
	public static void main(String[] args) {
		List<Domain> l=new ArrayList<Domain>();
		l.add(new Domain(10,"http://naver.com"));
		l.add(new Domain(20,"민국"));
		l.add(new Domain(30,"만세"));
		l.add(new Domain(40,"오리"));
		
		Comparator<Domain> c=new Comparator<Domain>() {
			public int compare(Domain u1,Domain u2){//구현해주어야함
			return u1.getId().compareTo(u2.getId()); //아이디로 비교하시오
			}
			
		}; //클래스인 경우에는 비교방법을 지정해주어야함
		int index = Collections.binarySearch(l,new Domain(20,null),c);
		System.out.println("다음 위치에서 발견됨:"+index);
		
		index=Collections.binarySearch(l,new Domain(5,null),c);//없으면 -1
		System.out.println(index);
		index=Collections.binarySearch(l, new Domain(20,"오리"),c);
		System.out.println(index);
		
		

	}

}
