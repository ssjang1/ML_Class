package javadarray;
public class c_03_sort {
	public static void main(String[] args) {
		//CRUD (create read update delete)
		//비교
		int score[]= {79,88,91,33,100,55,95};
		int max= score[0];//별도의 공간 확보로 초기화 시킴 
		int min= score[0];
		int count1=0;
		int count2=0;
		for (int i=1;i<score.length;i++) {
			if(score[i]>max) {
				max=score[i];//79 88 91 100
				count1++;
			}if(score[i]<min) {
				min=score[i];//79 33
				count2++;
			}
		}
//		System.out.println("최대값 : " +max);
//		System.out.println("최소값 : " +min);
		System.out.printf("최대값: %d 최소값: %d \n바뀐 횟수 각각 %d번 %d번",max,min,count1,count2);
		System.out.println();
		//문제 위 로직에서 바뀐 횟수를 카운트해서 출력해보세요
		
		//정렬 
		int number[]=new int[10];
		for (int i =0; i<number.length;i++) {
			number[i]=i;
			System.out.print(number[i]+" ");
		}
		System.out.println("\n");
		
		// 셔플링 shuffling
		// 메모리의 특성(두개의 변수간의 데이터를 직접 교환하는 것이 불가능)
		for (int i=0;i<100;i++) {
			int n=(int) (Math.random()*10);//인덱스를 랜덤하게
			int temp=number[0]; // 
			number[0]=number[n];
			number[n]=temp;
		}
		for (int i=0;i<number.length;i++) {
			System.out.print(number[i]+" ");
		}
		
		//버블 정렬
		//오름차순 ascending
		//내림차순 desceoning
//		for (int i=0;i<number.length;i++) {
//			for(int j=0;j<number.length-i-1;j++) {//-i는 한번 정렬했을 때 오른 쪽 끝에 가장 큰 숫자가 위치하게 되기 때문에 마지막까지 
//				//가지 않기 위해서 최적화를 위해 -i번 덜 돌도록 하는 거임 
//				if(number[j]>number[j+1]) {//인접한 데이터 2개를 비교
//					int temp = number[j];
//					number[j]=number[j+1];
//					number[j+1]=temp;
//				}
//			}
//			
//		}System.out.println();
//		
//		for (int i=0;i<number.length;i++) {
//			System.out.print(number[i]+" ");
//		}
		
		//문제 내림차순으로 정렬해보시오
		
		
		//변화여부를 감지하는 변수 changed:boolean
		
		for (int i=0;i<number.length;i++) {//행 수만큼 회전
			boolean changed = false; // 행마다 초기화가 되어야 하기 때문에
			for(int j=0;j<number.length-i-1;j++) {//열 수 만큼 회전
				if(number[j]<number[j+1]) {//인접한 데이터 2개를 비교
					int temp = number[j];
					number[j]=number[j+1];
					number[j+1]=temp;
					changed=true;
				}
				
			}if (!changed ) break;
			
		}System.out.println();
		
		for (int i=0;i<number.length;i++) {
			System.out.print(number[i]+" ");
		}
		
		
		//문제 위 식에서 정렬이 끝나면 끝내게 해보시오

	}

}
