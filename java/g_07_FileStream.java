package m_inheritance;
import java.io.*;
//Stream 저장을 하기 위해서 Serializable을 구현해 준다.
class Employee23 implements java.io.Serializable{
	public String name;
	public String address;
	public int number;
}
public class g_07_FileStream {
	public static void main(String[] args) {
		Employee23 e=new Employee23();
		e.name="korea";
		e.address="Seoul";
		e.number=101;
		
		try {//파일 처리는 예외처리해야 함
			//파일 오픈
			//파일이나 네트워크,DB접속은 os 자원을 사용 
			FileOutputStream fileOut = new FileOutputStream("C:\\\\work\\test.txt");
			//객체를 스트림으로 -> 저장할 때는 순서적으로 Serial하게 
			ObjectOutputStream out=new ObjectOutputStream(fileOut);
			out.writeObject(e);//객체 저장하시오
			out.close(); //파일,네트워크,db,객체 등응ㄴ 반드시 닫아주어야함 (자원 누수 방지)
			fileOut.close();
			System.out.printf("Serialized 된 클래스의 데이터가 c:\\test.txt에 저장");
		}catch (IOException i) {
			i.printStackTrace();
		}

	}

}
