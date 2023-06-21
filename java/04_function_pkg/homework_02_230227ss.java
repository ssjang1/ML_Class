package kfunction_pkg;
public class homework_02_230227ss {
	//짝:0 홀:1
	//정답:0 오답:1
	public static int evenodd1(int computer, int user) {
		int result=0;
		if (computer==0) {
			if (user==0) return result=0;
			else if(user==1) return result=1;
		}else if (computer ==1) {
			if(user==0) return result=1;
			else if (user==1) return result=0;
		}
		return result;
	}
	
	public static int evenodd2(int computer,int user) {
		int result=0;
		int judge[][]= {{0,1},{0,1}};
		for (int i=0;i<judge.length;i++) {
			for(int j=0;j<judge.length;j++) {
				result=judge[i][j];
			}
		}
		return result;
	}
	
	public static int evenodd3(int computer,int user) {
		int result=0;
		if (computer==user) {
			result=0;
		}else {
			result=1;
		}
		return result;
	}
	public static void main(String[] args) {
		

	}

}
