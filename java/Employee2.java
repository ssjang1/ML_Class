package m_inheritance; 
//100사람을 처리 할 때 한사람을 기준으로 클래스를 만든다.
//이질적인 데이터이기 때문에 클래스를 만든다.
public class Employee2 {//이름 나이 성별 주소 급여 
	String name;
	int age;
	String sex;
	String addr;
	long salary; // 메모리에 인스턴스 될 때 확보하는 메모리양
	//생성자 만들어야함
	public Employee2() {
		
	}
	public Employee2(String name,int age,String sex,String addr,long salary) {
		this.name=name;
		this.age=age;
		this.sex=sex;
		this.addr=addr;
		this.salary=salary;
	}
	//오버로딩
	public Employee2(String name,int age,String sex) {
		this.name=name;
		this.age=age;
		this.sex=sex;
	}
	public void setName(String name) {
		this.name=name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public long getSalary() {
		return salary;
	}
	public void setSalary(long salary) {
		this.salary = salary;
	}
	public String getName() {
		return name;
	}
	public double bonus() {
		return salary*1.5;
	}
	//출력 
	void display() {
		System.out.println("이름"+name+"나이"+age+"성별"+sex+"주소"+addr+"급여"+salary+"보너스+"+bonus());
	}

}
