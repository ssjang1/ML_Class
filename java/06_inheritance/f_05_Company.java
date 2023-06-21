package m_inheritance;
import java.util.Scanner;
//회사의 상황
//직원이 6명이 있음 (3명 ,3명)
//매니저가 (직원이면서 관리자) 2명
//Employee class
	//출력, 보너스함수는 급여에서 1.5배를 곱해서 계산하는 함수를 가지고 있음
//Manager class 가 있어야함 //Employee를 상속받음 (상속구조 클래스를 작성해 보시오)
//매니저는 직원 명단을 가지고 있어야함
//매니저는 자기 부서와 직원을 출력 할 수 있어야함
//name   age sex  addr        salary   department
//"대한이",23,"남","서울시 강북구",1500000
//"민국이",35,"남","대전시 쌍용동",2500000
//"김관리",40,"여","서울시 강남구",5000000,"개발부"
//"희망이",23,"남","서울시 강북구",1500000
//"하면됨",35,"남","대전시 쌍용동",2500000
//"이소장",40,"여","서울시 영등포",5000000,"연구부"

class Employee{
	Scanner sc=new Scanner(System.in);
	String name;
	int age;
	String sex;
	String addr;
	double salary;
	double bonus;
	public void Employee(String name,int age,String sex,String addr,double salary) {
		this.name=name;
		this.age=age;
		this.sex=sex;
		this.addr=addr;
		this.salary=salary;
	}
	public double bonus(double salary) {
		this.bonus=1.5*salary;
		return bonus;
	}
	public void setnmae(String name) {
		this.name=name;
	}
	public String getname() {
		return this.name;
	}
}

class Manager extends Employee{
	int number1=3;
	String department;
	String name[];
	
	public Manager() {
	}
	public void Manager(String department) {
		this.department=department;
	}
	public void print() {
		System.out.println("부서는"+department+"입니다.");
	}
	public void Emp() {
		
	}
}

public class f_05_Company {
	public static void main(String[] args) {
		Employee em1=new Employee();
		em1.Employee("대한이",23,"남","서울시 강북구",1500000);
		Employee em2=new Employee();
		em2.Employee("민국이",35,"남","대전시 쌍용동",2500000);
		Employee em3=new Employee();
		em3.Employee("김관리",40,"여","서울시 강남구",5000000);
		Employee em4=new Employee();
		em4.Employee("희망이",23,"남","서울시 강북구",1500000);
		Employee em5=new Employee();
		em5.Employee("하면됨",35,"남","대전시 쌍용동",2500000);
		Employee em6=new Employee();
		em6.Employee("이소장",40,"여","서울시 영등포",5000000);
		
		Manager m1=new Manager();
		m1.Manager("개발부");
		Manager m2=new Manager();
		m2.Manager("연구부");
		
		
		
		

	}

}
