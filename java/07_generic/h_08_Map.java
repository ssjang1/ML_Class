package n_generic;
import java.util.*;
public class h_08_Map {
	//Map은 Iterator가 없음 (순서적으로 접근)->Map은 계산된 위치에 저장
	//Map은 순서가 없음 : 
	public static void main(String[] args) {
		//Map은 기본적으로 정렬되지 않는데 정렬이 필요한 경우는 SortedMap을 사용-> TreeMap
		//HashTable(동기화를 보장),HashMap(동기화를 보장하진 않지만 처리가 빠름)이 있음
		//동기화 
		HashMap hm=new HashMap();//키(hash함수로 주소값으로 변환)+데이터로 저장
		hm.put("소득", Double.valueOf(1234.12));// put 키가 지정된 위치에 둔다
		hm.put("체중", Double.valueOf(48.2));
		hm.put("체중", 8.2);
		hm.put("저축",123123123);
		
		Set set=hm.entrySet();//키(set) : Map의 키는 Set
		//Set: 범주형 데이터를 생성( 중복을 허용하지 않는 종류)
		Iterator i=set.iterator(); // Collections를 상속
		while(i.hasNext()) {
			Map.Entry me=(Map.Entry) i.next();//Entry=> 키와 데이터의 조합
			System.out.println(me.getKey()+":");//키 값
			System.out.println(me.getValue());//데이터 값을 가져옴
		}
		double balance = (Double) hm.get("소득"); //키 값
		hm.put("소득", 2000); // 데이터 수정
		System.out.println(set);
		System.out.println(hm);
	}

}
