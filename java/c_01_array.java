package javadarray;
//만약에 stack구조가 없다면 : 100명이라면 코드가 100줄이여야 됨 (스택이 호출했따 부쉈다해서 작은 코드로 대량의 데이터 처리가가능)  
//만약에 heap이 없다면 : 데이터 만큼의 메모리가 있어야함
public class c_01_array {
	public static void main(String[] args) {
		//enhanced for 문
		//배열 초기화는 new를 사용하거나 {}를 이용해서 초기화한다.
		int arr[]= {2,11,45,9};//arr은 배열 인스턴스 변수 -> 주소가 저장
		for (int num: arr) { // num에 입력되는 것은 데이터 자체임 ( 인덱스가 아님)
			System.out.println(num);
		}
		int a[]=new int[4];//동적 메모리 할당에 사용 ->heap 
		//a 변수 주소에 가면 배열의 주소를 입력하는 데이터를 저장
		//포인터(주소)를 저장하는 공간을 만듬 : stack 
		//힙에 4바이트 int형 데이털르 저장하는 공간을 만들고 그 선두 주소를 a가 가리키는 주소에 저장 
		//주소에 있는 주소를 참조하여 데이터를 처리하는 것을 reference 변수라고 함.
		a[0]=100;
		a[1]=200;
		a[2]=300;
		a[3]=400;
		int sum=0;
		sum=a[0]+a[1]+a[2]+a[3];
		System.out.printf("배열의 총합은 %d 입니다. \n",sum);
		sum=0;
		//배열의 length 속성을 이용해서 개수 파악 가능
		for(int i=0; i<a.length;i++) {
			int temp=a[i];
			sum+=temp;
			System.out.println(temp);
		}
		System.out.printf("배열의 총합은 %d 입니다.\n",sum);
		
		//문제 한 학생의 과목별 점수 {100,88,99,99,98} 을 배열에 저장하고 합계를 계산하고 평균을 계산한 결과를 출력하시오
		sum=0;
		int score[]= {100,88,99,99,98};
		for(int j=0;j<score.length;j++) {
			int tri=score[j];
			sum+=tri;
					
		}
		double average= sum/5.;
		System.out.printf("학생의 평균은 %.1f 입니다.",average);
		String grade="";
		if (average>=90){
			grade="A학점";
		}else if (average>80) {
			grade="B학점";
		}else if(average>70) {
			grade="C학점";
		}else if (average>60) {
			grade="D학점";
		}else {
			grade="F학점";
		}
		System.out.println("학점은: "+ grade+ " 입니다.");
		

	}

}
