package lclass;
import java.util.Scanner;
public class e_07_Student90_test {
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		System.out.println("몇명을 입력하시겠습니까?");
		int studentnum=Integer.parseInt(sc.nextLine());
		Student90 school[]=new Student90[studentnum];

	
		for (int i=0;i<school.length;i++) {
			school[i]=new Student90();
			school[i].no=i+1;
		}
		System.out.println(school[0].printhead());
		for (int i=0;i<school.length;i++) {
			System.out.println(school[i].lasttoString());
		}
		

		
		System.out.println("==========성적관리 프로그램===========");
		menuOpen(school);

	}
	public static void sort(Student90[] school, int sel) {
		if (sel==1) {
			for(int i=0;i<school.length;i++) {
				boolean changed=false;
				for (int j=0;j<school.length-i-1;j++) {
					if(school[j].total<school[j+1].total) {
						Student90 temp;
						temp=school[j];
						school[j]=school[j+1];
						school[j+1]=temp;
						changed=true;
					}
				}
				if (!changed) break;
			}
		}
		else if(sel==2) {//번호순으로 보기 위해서 번호를 중심하고 정렬
			for (int i=0;i<school.length;i++) {
				boolean changed=false;
				for (int j=0;j<school.length-i-1;j++) {
					if(school[j].no>school[j+1].no) {
						Student90 temp;
						temp=school[j];
						school[j]=school[j+1];
						school[j+1]=temp;
						changed=true;
					}
				}
				if(!changed) break;
			}
		}
	}
	//3번
	public static void modify(Student90[] school,String modifyName, String modifySubject, String modifyNumber) {
			
			for (int i=0;i<school.length;i++) {
				if(school[i].name.equals(modifyName)){
					if(modifySubject.equals("국어")) {
						school[i].kor= Integer.parseInt(modifyNumber);
					}
					else if(modifySubject.equals("수학")) {
						school[i].mat=Integer.parseInt(modifyNumber);
					}
					else if (modifySubject.equals("영어")) {
						school[i].eng=Integer.parseInt(modifyNumber);
					}
				}
			}
	}
	//8번
	public static void columnsum(Student90[] school) {
		int korsum=0;
		int matsum=0;
		int engsum=0;
		for (int i=0;i<school.length;i++) {
			korsum+=school[i].kor;
			matsum+=school[i].mat;
			engsum+=school[i].eng;	
		}
		System.out.println("국어 총합:"+korsum+"수학 총합:"+matsum+"영어 총합:"+engsum);

	}
	public static void menuOpen(Student90[]school) {
		int inputNum=0;
		boolean re=false;
		Scanner sc=new Scanner(System.in);
		while(!re) {
			re=true;
			System.out.println("------성적관리프로그램------");
			System.out.println("1.검색,2.출력,3.수정,8과목별합계출력,9.종료");
			//총점으로 정렬을 해서 등수입력 다시 번호로 정렬
			System.out.print("메뉴선택");
			inputNum=Integer.parseInt(sc.nextLine());
			switch (inputNum) {
			case 1:
				System.out.println("1.검색내용");
				System.out.println("검색할 이름을 입력하세요");
				String inputname=sc.nextLine();
				for (int i=0;i<school.length;i++) {
					if(school[i].name.equals(inputname)) {
						System.out.println(school[i].lasttoString());
					}
				}
				re=false;
				break;
			case 2:
				System.out.println("2.출력내용");
				//등수를 부여하기 위해 점수로 정렬(내림차순으로 정렬하고 등수 부여)
				sort(school,1);
				for (int i=0;i<school.length;i++)
					school[i].ranking=i+1;
				sort(school,2);
				//시각화 하기위해서 번호를 중심하고 재정렬
				System.out.println(school[0].printhead());
				for(int i=0;i<school.length;i++) {
					System.out.println(school[i].lasttoString());
				}
				re=false;
				break;
			case 3:
				System.out.println("3.수정하기");
				
				System.out.println("점수를 수정할 사람의 이름을 입력해주세요");
				String modifyName=sc.nextLine();
				System.out.println(school[0].printhead());
				for (int i=0;i<school.length;i++) {
					if(school[i].name.equals(modifyName)) {
						System.out.println(school[i].lasttoString());
					}
				}
				System.out.println("수정할 과목의 이름을 입력해주세요");
				String modifySubject=sc.nextLine();
				System.out.println("수정할 과목의 점수를 입력해주세요");
				String modifyNumber=sc.nextLine();
				modify(school,modifyName,modifySubject,modifyNumber);
				System.out.println(modifyName+"님의"+modifySubject+"과목 성적이"+modifyNumber+"점으로 수정되었습니다.");
				re=false;
				break;
				
			case 8: columnsum(school);
				re=false;
				break;
		
			case 9: re=true;
			break;
			
			default:
				System.out.println("다시 입력해주세요");
				re=false;
				break;
				
			//3번과 8번은 팀별로 만드세요
				
			}
		}
	}

}
