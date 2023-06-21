package javadarray;
public class c_02_array {
	public static void main(String[] args) {
		int a[][]=new int[3][2];//행렬 = 배열 + 선형대수 // 공간만 확보
		a[0][0]=10;a[0][1]=20;
		a[1][0]=30;a[1][1]=40;
		a[2][0]=50;a[2][1]=60;
		int b[][]= {{10,20},{30,40},{50,60}};
		for (int i=0; i<a.length;i++) { // 행 더디게 진행
			for (int j=0; j<a[i].length;j++) { // 열 빠르게 진행 //2차원배열 a[][] 에서 a[] 하나를 표현하면 행을 의미함 
				System.out.print(a[i][j]+"\t");
			}
			System.out.println();
			
			System.out.println(b);
		
		}
		int arr3[][]=new int[3][]; //행만결정
		
		//비정방형 배열 만들기 => 메모리 최적화때문에 
		arr3[0]=new int[3];
		arr3[1]=new int[4];
		arr3[2]=new int[2];
		int count = 1;
		for(int i=0; i<arr3.length;i++) {
			for(int j=0;j<arr3[i].length;j++) {
				arr3[i][j]=count++;
			}
//			System.out.println();
			
			
		}
		//위의 입력된 데이터를 출력해보시오 
		for(int i=0; i<arr3.length;i++) {
			for(int j=0;j<arr3[i].length;j++) {
				System.out.print(arr3[i][j]+" ");
			}
			System.out.println();
		}
		
		
		
	}
}
