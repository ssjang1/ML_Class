package javadarray;
public class c_04_string_compare {
	public static void main(String[] args) {
//		String str1="Hello";
//		String str2="Hello";
//		String str3="Hello";
//		
//		//문자열 동일여부
//		System.out.println("str1.equals(str2):" +str1.equals(str2));
//		System.out.println("str2.equals(str1):" +str2.equals(str1));
//		System.out.println("str1.equals(str3):" +str1.equals(str3));
//		
//		//비교한 다음 앞이크면 양수, 같으면 0, 앞이 작으면 음수를 출력
//		System.out.println("str1.compareTo(str2) ?" +str1.compareTo(str2));
//		System.out.println("str1.compareTo(str3) ?" +str1.compareTo(str3));
//		//대소문자를 불문하고 
//		System.out.println("str1.compareToIgnoreCase(str2) ?" +str1.compareToIgnoreCase(str2));
//		System.out.println("str1.compareToIgnoreCase(str3) ?" +str1.compareToIgnoreCase(str3));
//		
//		//문제 다음 배열에 입력하고 {"대한","민국","만세","한국","대전"} 정렬하는 프로그램을 작성해보세요
//		String korea[]= {"대한","민국","만세","한국","대전"};
//		for (int i=0;i<korea.length;i++) {
//			for (int j=0;j<korea.length-1;j++) {
//				if(korea[j].compareTo(korea[j+1])>0) { //오름차순
//					String temp = korea[j];
//					korea[j]=korea[j+1];
//					korea[j+1]=temp;
//				}
//			}
//
//			
//		}
//		for (int i=0;i<korea.length;i++) {
//			System.out.print(korea[i]+ " ");
//		}
//		
//		System.out.println();
		//문제 표 출력하기
		//배열은 동질적 데이터만 처리가능
		//데이터 타입은 이름string, 점수int, 평균double =>3개의 배열 필요
		String name[]= {"이름","국어","영어","수학","합계","평균"};
		String student[]= {"대한","민국","만세"};
		int score[][]= {{90,90,90,270},{89,89,89,267},{90,99,99,288}};
		double average[]= {90.0,89.0,96.0};
		
		System.out.println("  성적계산표");
		for (int i=0;i<name.length;i++) {
			System.out.print(name[i]+" ");
		}
		System.out.println();
		for (int i=0;i<score.length;i++) {
			System.out.print(student[i]+"  ");
			for(int j=0;j<score[i].length;j++) {
				System.out.print(score[i][j]+"  ");
			}
			System.out.print(average[i]);
			System.out.println();
		}
		
		
		
	
	}
	
	
}


