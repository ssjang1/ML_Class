package m_inheritance;
public class Manager2 extends Employee2{
	public String department;
	public Employee2 sub[];// 직원 정보 입력을 위한 배열
	public Manager2() {
	}
	public Manager2(String name,int age,String sex,String addr,long salary,String department) {
		super(name,age,sex,addr,salary);//상속시 부모의 생성자를 명시적으로 호출
		this.department=department;
		this.sub=new Employee2[2]; // 배열에 주소 데이터가 입력 될 공간을 확보
	}
	public void displayEmployee2() {
		for (int i=0;i<sub.length;i++) {
			sub[i].display();
		}
	}
	public void display() {
		System.out.println("담당부서: "+this.department);
		System.out.println("부하직원수: "+this.sub.length);
		System.out.println("부서장");
		super.display();
		System.out.println("부서직원: ");
		displayEmployee2();
	}

}
