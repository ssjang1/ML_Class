package m_inheritance;
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
public class Company2 {
	public static void main(String[] args) {
		Employee2 el1=new Employee2("대한이",23,"남","서울시 강북구",1500000);
		Employee2 el2=new Employee2("민국이",35,"남","대전시 쌍용동",2500000);
		Employee2 el4=new Employee2("희망이",23,"남","서울시 강북구",1500000);
		Employee2 el5=new Employee2("하면됨",35,"남","대전시 쌍용동",2500000);
		Manager2 co[]=new Manager2 [2] ;
		Manager2 ma1=new Manager2("김관리",40,"여","서울시 강남구",5000000,"개발부");
		ma1.sub[0]=el1;
		ma1.sub[1]=el2;
		Manager2 ma2=new Manager2("이소장",40,"여","서울시 영등포",5000000,"연구부");
		ma2.sub[0]=el4;
		ma2.sub[1]=el5;
		co[0]=ma1;
		co[1]=ma2;
		
		System.out.println("현재 직원현황");
		for (int i=0;i<co.length;i++) {
			co[i].display();
		}
	}

}
