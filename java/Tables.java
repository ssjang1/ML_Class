package n_generic;
import java.util.*;//generic의 자료구조
import java.io.*; //파일
public class Tables {
	ArrayList<Student60> list=new ArrayList<Student60>();//자료구조 선언 (개수를 지정하지 않아도 됨)
	Scanner in=new Scanner(System.in);
	Iterator<Student60> itr;
	//CRUD
	Student60 st1=new Student60();//마지막에 입력한 데이터로 입력됨
	public void inputInfo() throws IOException{
		Student60 st1=new Student60(); // stack에 변수가 만들어지고 heap영역에 데이터 저장 
		boolean re=false;
		System.out.println("이름을 입력하세요: ");
		st1.name=in.nextLine();
		System.out.println("반을 입력하세요: ");
		st1.ban=Integer.parseInt(in.nextLine());//버퍼에 엔터가 남는 것을 방지
		
		System.out.println("번호를 입력하세요:");
		st1.no=Integer.parseInt(in.nextLine());
		while(!re) {
			re=true;
			do {
				try {
					System.out.println("국어 점수를 입력하세요:");
					st1.kor=Integer.parseInt(in.nextLine());
				}catch (NumberFormatException e) {
					System.out.println("숫자로 입력해주세요");
					re=false;
				}
			}while (st1.kor<0||st1.kor>100);
		}
		System.out.println("수학 점수를 입력하세요:");
		st1.math=Integer.parseInt(in.nextLine());
		System.out.println("영어 점수를 입력하세요:");
		st1.eng=Integer.parseInt(in.nextLine());
		st1.total=(st1.math+st1.kor+st1.eng);
		list.add(st1);//1명추가
	}
	public void display() {
		System.out.println("입력된 값들을 출력합니다.");
		System.out.println("--------------------");
		itr=list.iterator(); // 위치만 가리키는 반복자-데이터의 최 선수를 가리킴
		while (itr.hasNext()) {
			Student60 s=(Student60) itr.next(); // 위치만 가리키기 때문에 캐스팅이 필요하다
			System.out.println(s);//to_String을 오버라이딩 했기때문에 문자열 출력
		}
	}
	public void delete()throws IOException{
		System.out.println("삭제하고자 하는 이름을 입력해주세요:");
		String inputValue=in.nextLine();
		itr=list.iterator();
		while(itr.hasNext()) {
			Student60 s=(Student60) itr.next();
			if(s.name.equals(inputValue)) {
				itr.remove();
			}
		}
		System.out.println("삭제완료");
	}
	public void edit() throws IOException{
		System.out.print("수정하고자 하는 이름을 입력해주세요:");
		String inputValue=in.nextLine();
		itr=list.iterator();//반복자 초기화
		while(itr.hasNext()) {
			Student60 s=(Student60) itr.next();
			if(s.name.equals(inputValue)) {
				System.out.print("수정할 이름을 입력해주세요:");
				String ChangeValue=in.nextLine();
				s.setName(ChangeValue);//이름 수정
			}
		}
		System.out.println("수정완료");
	}//삭제 수정 검색 기능별로 함수를 작성: 설계-> 구현-> 호출
	public void searchAndShow() {
		System.out.println("검색하고자 하는 이름을 입력하세요:");
		String inputValue=in.nextLine();
		itr=list.iterator();
		while (itr.hasNext()) {
			Student60 s=(Student60) itr.next();
			if(s.name.equals(inputValue)) {
				System.out.println(s);
				break;
			}
		}
	}
	//Collections/Map
	//Collections->list(ArrayList,LinkedList,Stack),queue,set(HashedSet,TreeSet)
	//Map:HashMap,TreeMap
	public void sort() throws IOException{
		Collections.sort(list);//상속관계에 있는 상위 부모인 Collections의 함수를 사용
		display();
	}
	//파일 저장
	public void objectDataWrite() {
		try {
			FileOutputStream fos=new FileOutputStream("sungjuk");//바이트단위처리
			ObjectOutputStream oos=new ObjectOutputStream(fos);//객체단위로 처리하는 클래스
			oos.writeObject(list);
			oos.close();
			fos.close();
		}
		catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	//파일로딩
	public void objectDataRead() {
		try {
			FileInputStream fis = new FileInputStream("sungjuk");
			ObjectInputStream ois=new ObjectInputStream(fis);
			list=(ArrayList)ois.readObject();
			ois.close();
			fis.close();
		}
		catch(IOException ioe) {
			ioe.printStackTrace();
			return;
		}
		catch(ClassNotFoundException c) {
			System.out.println("클래스를 발견할 수 없습니다.");
			c.printStackTrace();
			return;
		}
	}
	public int windowFor() throws IOException{
		System.out.println("==============성적관리시스템==============");
		System.out.println("------------------");
		System.out.println("1.입력 2.출력 3.편집 4.조회 5.정렬 6.삭제 7.저장 8.로딩 9.종료");
		System.out.println("------------------");
		System.out.println("메뉴를 선택하세요");
		int ch=0;
		try {
			ch=Integer.parseInt(in.nextLine());
		}
		catch(NumberFormatException e) {
		}
		switch (ch) {
		case 1:inputInfo();return 1;
		case 2:display(); return 1;
		case 3:edit(); return 1;
		case 4:searchAndShow();return 1;
		case 5:sort();return 1;
		case 6:delete();return 1;
		case 7:objectDataWrite();return 1;
		case 8:objectDataRead();return 1;
		case 9:System.out.println("종료합니다."); in.close(); return 0;//0이면 종료
		default: System.out.println("잘못입력하셨습니다."); return 1;
		}
	}
}
