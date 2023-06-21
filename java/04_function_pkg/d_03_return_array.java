package kfunction_pkg;
public class d_03_return_array {
	public static int makesum(int data[]) {	//매개 변수 값이 array임
		int hab=0;
		for (int i=0;i<data.length;i++) {
			hab+=data[i];
		}return hab;
		
	}
	static int[] makeArray(int count, int basic){ // 주소값을 리턴하라
		int temp[]=new int[count]; // 힙에 정수형 데이터 4개를 저장하는 영역을 만들고 그 주소를 대입
		for(int i=1;i<temp.length+1;i++) {
			temp[i-1]=i*basic;
		}return temp;
		// Gabage Collection 은 참조가 0이 되면 메모리를 해제 한다.
	}
	
	public static void main(String[] args) {
		int returnArray[];//주소값이 저장됨 : reference 이기 때문에 , 데이터를 참조
//		returnArray = makeArray();
//		for(int i=0;i<returnArray.length;i++) {
//			System.out.println(returnArray[i]);
//		}
		
		int temp[];
		temp=makeArray(100,100);
//		for (int i=0;i<temp.length;i++) {
//			System.out.println(temp[i]);
			System.out.println(makesum(temp));
//		}
		
		int numberarr[]= {10,20,30,40,70,55};
		int habresult=makesum(numberarr);
	
		System.out.println(habresult);
		
		
		int temp2[]=new int[4];
		for(int i=0;i<temp2.length;i++) {
			temp2[i]=i*10;
		}
		habresult=makesum(temp2);
		System.out.println(habresult);
		
		
		
		
		//문제 main함수에서 10,20,30,40 배열을 만들어서 함수를 만들어 배열을 전달받고 전달받은 배열의 모든 데이터를
		//합계를 내서 리턴받은 다음 메인에서 출력하시오.
	
		
		//call by value
		//call by reference 배열 클래스 같이 여러개의 값이 저장되어 있는 경우
	
	}
	

}
