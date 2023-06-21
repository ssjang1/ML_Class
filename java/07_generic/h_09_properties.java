package n_generic;
import java.util.*;
import java.io.*;
public class h_09_properties {
	public static void main(String[] args) throws Exception {
		Properties prop=new Properties(); // 프로젝트의 옵션을 관리
		prop.setProperty("timeout", "30"); //입력
		prop.setProperty("language", "kr");
		prop.setProperty("size", "10");
		prop.setProperty("capacity", "10");
		//Enumeration 순차적으로 접근하는 반복자 - 초창기
		Enumeration e =prop.propertyNames();// Properties의 반복자 (이터레이터)
		while(e.hasMoreElements()) {
			String element=(String)e.nextElement();	
			System.out.println(element+"="+prop.getProperty(element));
		}
		prop.setProperty("size", "20"); //입력과 같은 함수인데 수정
		System.out.println("size="+prop.getProperty("size"));
		prop.store(new FileWriter("info.properties"), "test");
		
		try {
			prop.load(new FileInputStream("info.properties"));
		}catch(IOException e1) {
			System.out.println("저장된 파일을 찾을 수 없습니다.");
			System.exit(0);
		}
		System.out.println("size="+prop.getProperty("size"));
		Properties sysProp=System.getProperties();
		System.out.println("java.version : "+sysProp.getProperty("java.version"));
		System.out.println("user.language : "+sysProp.getProperty("user.language"));
		sysProp.list(System.out);
	}

}