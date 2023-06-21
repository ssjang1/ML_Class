package m_inheritance;
//도형의 면적, 출력, 계산 => 부모
//Rectangle, Circle, Triangle
//사각형: 가로 세로
//원: 반지름
//삼각형: 밑변 높이 
//계산 방법만 다른 경우 -> 함수 이름은 같되 다른 일을 하는 재정의를 이용
class Shape{
	//3번 적용되어야 하는 코드를 한번으로 줄임
	public double area; // 공통
	public void display() { // 공통 
		System.out.println("면적은 "+this.area+"입니다. ");
	}
	public void calcArea() { // 오버라이딩 대상
		//함수명도 하나만 알고 있으면 객체마다 다른 계산을 호출
	}
}
class Circle extends Shape{
	public double radius; //원에 추가된 변수
	public Circle(double radius) {
		this.radius=radius;
		calcArea();
	}
	public void calcArea() {
		area=Math.PI*radius*radius;
	}
}
class Rectangle extends Shape{
	public double width;
	public double height;
	public Rectangle(double width,double height) {
		this.width=width;
		this.height=height;
		calcArea();
	}
	public void calcArea() {
		area=width*height; //재정의
	}
}
class Triangle extends Shape{
	public double width;
	public double height;
	public Triangle(double width,double height) {
		this.width=width;
		this.height=height;
		calcArea();
	}
	public void calcArea() {
		area=width*height*0.5;
	}
}
public class f_03_shape {
	public static void main(String[] args) {
		Circle cl=new Circle(10);
		cl.display();
		Rectangle re=new Rectangle(10,20);
		re.display();
		Triangle tr=new Triangle(10,5);
		tr.display();
		
		Shape parent[]=new Shape[3];
		parent[0]=cl;
		parent[1]=re;
		parent[2]=tr;
		for(int i=0;i<3;i++) {
			parent[i].display();
		}
		

	}

}
