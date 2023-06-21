package lclass;
public class e_04_Person_test {
	public static void main(String[] args) {
		
		//문제 name과 age를 저장하는 person class를 만들고
		//멤버함수는 데이터를 초기화하는 생성자를 만들고 각 데이터를 get,set하는 함수를 작성하시오
		//만들어진 person 클래스를 인스턴스하여 대한이:13 , 민국이:14, 만세는: 15인 데이터를 저장하시오
		
		Person pr1=new Person("대한이",13);
		Person pr2=new Person("민국이",14);
		Person pr3=new Person("만세",15);
		
		pr1.print();//출력
		pr2.print();
		pr3.print();
		Person pe_dim[]=new Person[3];//생성자 (디폴트 생성자가 있어야함)
		pe_dim[0]=new Person("대한이",13);
		pe_dim[1]=new Person("민국이",14);
		pe_dim[2]=new Person("만세",15);
		for(Person pe: pe_dim) {
			pe.print();
		}
		
		String st_arr[]= {"대한이","민국이","만세"};
		int age_arr[]= {10,11,12};
		Person pe_arr[]=new Person[st_arr.length];
		for(int i=0;i<st_arr.length;i++) {
			pe_arr[i]=new Person(st_arr[i],age_arr[i]);
		}
		for (Person pe: pe_arr) {
			pe.print();
		}
	}

}
// point class를 만들어서 x,y값을 저장 
// 1) 원점으로부터의 거리 
// 2) 각도 tan 사용  -> atan 이용
// 3) 점과 다른 점 사이의 거리  