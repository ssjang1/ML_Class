package n_generic;
import java.io.*;
import java.util.*;

//1)
//sungjuk88 클래스 작성 :1인분 데이터 다룸
//번호,이름,국어,영어,수학,합계,평균,데이터 가지고있음
//sungjuk88 class는 비교가 가능하고 파일 저장이 가능하도록 Comparable, Serializable을 implement합니다.
//2)
//sungjukArray
//별도의 class에서 ArrayList에 데이터를 저장하고 CRUD를 구현한다.create read update delete
//입력은 Scanner을 이용해서 입력합니다.
//출력,//검색후삭제,//이름수정,//검색후출력,//정렬,파일 저장,파일 로딩
//메뉴 관리 함수를 작성해서 메뉴로 구동하도록 하고 9일 때는 프로그램 중지하도록 합니다.
//3) 
//main이 담긴 클래스에서 위의 클래스들을 이용해서 자동하도록 프로그램하시오
//검색후 출력 -> 삭제하시겠습니까? 삭제
class sungjuk88 implements Comparable<sungjuk88>,java.io.Serializable{
	Scanner sc=new Scanner(System.in);
	int num;
	String name;
	int kor;
	int mat;
	int eng;
	int tot;
	double avr;
	int rank;
	char grade;
	static int numcnt =1;
	static int rankcnt=1;
	
	
	public int tot() {
		return this.kor+this.eng+this.mat;
	}
	public double avr() {
		return (this.kor+this.eng+this.mat)/3;
	}

	public char grade_check() {
		char hakjum;
		switch ((int) avr/10) {
		case 10:
		case 9: hakjum='A'; break;
		case 8: hakjum='B'; break;
		case 7: hakjum='C'; break;
		case 6: hakjum='D'; break;
		default: hakjum='F'; break;
		}
		return hakjum;
	}
	public sungjuk88() {
		System.out.println("이름을 입력하세요");
		this.name=sc.nextLine();
		System.out.println("국어점수: ");
		this.kor=Integer.parseInt(sc.nextLine());
		System.out.println("수학점수: ");
		this.mat=Integer.parseInt(sc.nextLine());
		System.out.println("영어점수: ");
		this.eng=Integer.parseInt(sc.nextLine());
		this.num = numcnt;
		numcnt++;
		rank=1;
		this.tot=tot();
		this.avr=avr();
		this.grade=grade_check();
	}
	public sungjuk88(String name, int kor, int mat,int eng) {
		this.name=name; this.kor=kor; this.mat=mat; this.eng=eng;
		tot=tot();
		avr=avr();
		grade=grade_check();
	}
	public void setNum(int num) {
		this.num=num;
	}
	public int getNum() {
		return num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
		total_calc();
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
		total_calc();
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
		total_calc();
	}
	public Integer getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String printhead() {
		return "번호"+" "+"이름"+" "+"국어"+" "+"수학"+" "+"영어"+" "+"합계"+" "+"평균"+" "+"학점"+" "+"등수";
	}
	public String lasttoString() {
		return num+" "+name+" "+kor+" "+mat+" "+eng+" "+tot+" "+avr+" "+grade+" "+rank;
	}
	public void total_calc() {
		tot=tot();
		avr=avr();
		grade=grade_check();
	}
	
	public String toString() {
		return "번호:"+num+" 이름:"+name+" 국어:"+kor+" 수학:"+mat+" 영어:"+eng+" 합계:"+tot+" 평균:"+avr+" 등급:"+grade+" 등수:"+rank;
	}
	public int compareTo(sungjuk88 sj) {//오버라이딩
		if(tot==sj.tot)
			return 0; //같다
		else if (tot>sj.tot)
			return 1; //앞이 크다
		else
			return -1;//뒤가 크다
	}		
}



public class h_10_sungjuk_general_menu implements java.io.Serializable{
	public static void main(String[] args) throws Throwable{
		FileOutputStream fileOut = new FileOutputStream("C:\\\\test\\test.txt");
		//객체를 스트림으로 -> 저장할 때는 순서적으로 Serial하게 
		ObjectOutputStream out=new ObjectOutputStream(fileOut);
		
		sungjuk88 sj88=new sungjuk88("0",0,0,0);
		
		//학생 정보 입력
		
		Scanner sc=new Scanner(System.in);
		System.out.println("몇명을 입력하시겠습니까?");
		int stunum=Integer.parseInt(sc.nextLine());
		ArrayList<sungjuk88> student=new ArrayList<sungjuk88>();
			for (int i=0;i<stunum;i++) {
			student.add(new sungjuk88());
			}
		
			//등수 입력
		Collections.sort(student,Collections.reverseOrder()); // 내림차순 
		for (int i=0;i<stunum;i++) {
			student.get(i).setRank(i+1);
		}
		
		
		int inputNum=0;
		boolean re=false;
		while(!re) {
//			re=true;
			System.out.println("------성적관리프로그램------");
			System.out.println("1.검색,2.전체출력,3.이름수정,4.삭제,5.번호순정렬,6파일저장,7파일로딩 ,9.종료");
			System.out.print("메뉴선택");
			inputNum=Integer.parseInt(sc.nextLine());
			switch (inputNum) {
			case 1: //검색 
				System.out.println("1.검색내용");
				System.out.println("검색할 이름을 입력하세요");
				String inputname=sc.nextLine();
				for (int i=0;i<student.size();i++) {
					boolean changed=false;
					if(student.get(i).getName().equals(inputname)) {
						System.out.println(sj88.printhead());
						System.out.println(student.get(i).lasttoString());
						changed=true;
					}
					if(!changed) break;
				}
				
				break;

			case 2: //전체 인원 출력
				System.out.println("2.출력내용");
				System.out.println(sj88.printhead());
				for (int i=0;i<student.size();i++) {
					System.out.println(student.get(i).lasttoString());
				}
				break;
				
			case 3: // 이름 수정
				System.out.println("수정하고 싶은 사람의 이름을 입력해주세요");
				String modifyname=sc.nextLine();
				for (int i=0;i<student.size();i++) {
					if(student.get(i).getName().equals(modifyname)) {
						System.out.println("수정할 이름을 입력해주세요");
						String modifytoname=sc.nextLine();
						student.get(i).setName(modifytoname);
					}
				}
				break;
				
			case 4: // 삭제
				System.out.println("삭제하고 싶은 사람의 이름을 입력해주세요");
				String deletename=sc.nextLine();
				for (int i=0;i<student.size();i++) {
					if(student.get(i).getName().equals(deletename)) {
						student.remove(i);
					}			
				}
				Collections.sort(student,Collections.reverseOrder()); // 내림차순 
				for (int i=0;i<stunum;i++) {
					student.get(i).setRank(i+1);
				} // 삭제 후 다시 순위 부여
				
				break;
			
			case 5: //번호순으로 정렬	
				Comparator<sungjuk88>comp=new Comparator<sungjuk88>() {
					public int compare(sungjuk88 sj1,sungjuk88 sj2) {
						if(sj1.num==sj2.num)
							return 0; //같다
						else if (sj1.num>sj2.num)
							return 1; //앞이 크다
						else
							return -1;//뒤가 크다
					}
				};
				Collections.sort(student,comp);
				break;
			case 6: //ArrayList인 student를 파일에 저장 
				public void Save() {
					if (Grade_management.info.Sungjuk_Array.size() >0) {
						Grade_management.info.Save_Data();
					} else System.out.println("The data does not exist.");
					Grade_management.select_num = 0;
				}
					
			case 7: //저장한 파일로딩
				public void Load() {
					Grade_management.info.Load_Data();
					Grade_management.select_num = 0;
				}
			
					
			case 9: 
				re=true;
				break;
			
			default:
				System.out.println("다시 입력해주세요");
				break;
			}
		
		

			
		}
			
	}
	public void Save_Data() {
		try {
			FileOutputStream fileout = new FileOutputStream("Grade_Data.txt");
			ObjectOutputStream out = new ObjectOutputStream(fileout);
			out.writeObject(sungjuk_Array);
			out.close();
			
			System.out.println("Data Save");
		}catch(IOException except) {except.printStackTrace();};
	}
	public void Load_Data() {
		ObjectInputStream ois = null;
		
		try {
			FileInputStream fn = new FileInputStream("Grade_Data.txt");
			ois = new ObjectInputStream(fn);			
			
			List<T> data = (List<T>) ois.readObject();
			Sungjuk_Array.addAll(data);
			
			System.out.println("Data Load");
			
		} catch(IOException e) {System.out.println("err");}
		catch (Exception e) {System.out.println("err");}
	}
}