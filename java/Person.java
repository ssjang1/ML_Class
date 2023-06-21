package lclass;
public class Person {
	String name;
	int age;
	public Person() {//디폴트 생성자 생성자가 없으면 자동으로 만들어줌, 배열처리 때문에		
	}
	public Person(String name,int age) {
		this.name=name;
		this.age=age;
	}
	public void setName(String name) {
		this.name=name;
	}
	public void setAge(int age) {
		if(age>200) age=200; // 데이터 보호가능
		this.age=age;
	}
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}
	public void print() {
		System.out.println("이름은: "+name+", 나이는: "+age);
	}

}
