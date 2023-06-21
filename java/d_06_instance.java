package kfunction_pkg;
public class d_06_instance {
	
	public long sum(int... temp) {//... => 변동 매개변수, 배열을 만들어서 입력
		//static이 생략된 경우에는 반드시 instance를 해야함.
		long sum=0;
		for(int i=0;i<temp.length;i++) {
			sum+=temp[i];
		}
		return sum;
	}
	//가위(0) 바위(1) 보(2)
	//(0,0)(0,1)(0,2)
	//(1,0)(1,1)(1,2)
	//(2,0)(2,1)(2,2)
	public static String rsp1(int computer,int user) {
		String result="";
		if (computer==0) {
			if (user==0) {
				result="비겼습니다.";
			}else if (user==1) {
				result="이겼습니다.";
			}else if (user==2) {
				result="졌습니다.";
			}
		}else if (computer==1) {
			if (user==0) {
				result="졌습니다.";
			}else if (user==1) {
				result="비겼습니다.";
			}else if (user==2) {
				result="이겼습니다.";
			}
		}else if (computer==2) {
			if(user==0) {
				result="이겼습니다.";
			}else if(user==1) {
				result="졌습니다.";
			}else if (user==2) {
				result="비겼습니다.";
			}
		}System.out.println(result);
		return result;
	}
	
	public static String rsp2(int computer,int user) {
		String judge[][]= {{"비겼다","이겼다","졌다"},{"졌다","비겼다","이겼다"},{"이겼다","졌다","비겼다"}};
		String result=judge[computer][user];
		System.out.println(result);
		return result;
		
	}
	
	public static String rsp3(int computer,int user) {
		String result="";
		if (computer==user) {
			result="비김";
		}else if((computer+1)%3==user%3) {
			result="이김";
		}else if(computer%3==(user+1)%3) {
			result="짐";
		}
		System.out.println(result);
		return result;
	}
	
	
	
	public static void main(String[] args) {
		d_06_instance v1= new d_06_instance();//class instance (클래스의 데이터를 저장하기 위해서 메모리를 확보하는 방법)
		long s1=v1.sum(1,2);
		System.out.println(s1);
		long s2=v1.sum(1,2,3,4);
		System.out.println(s2);
		rsp1(2,1);
		rsp2(1,2);
		rsp3(1,2);
		
		
		//문제 가위바위보를 함수로 만드는 문제 
		//1 매개변수
		//2 배열로 결과판정
		//3 연산식으로 경우의수를 9->로 줄임 같게되는 상태를 만들고 그 경우의수
		
		
		

	}
	
}
