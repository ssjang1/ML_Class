package m_inheritance;
//Point class도 사용 하면서 GUI프로그램에서 사용하기 위해서
//point의 color 값을 지정해야 하는 경우=> 상속으로 해결
class Point { 
	double x;
	double y;
	public Point() { //디폴트 생성자	
	}
	public Point(double x,double y) {
		this.x=x; this.y=y;
	}
	public void setX(double x) {
		this.x=x;
	}
	public void setY(double y) {
		this.y=y;
	}
	public double getX() {
		return this.x;
	}
	public double getY() {
		return this.y;
	}
	public void setPoint(double x,double y) {
		this.x=x;
		this.y=y;
	}
	public double toOrigin() {
		return Math.sqrt(x*x+y*y);
	}
	public double angle() {
		double radian_angle=Math.atan2(x,y);
		return Math.toDegrees(radian_angle);
	}
	public double distanceTo(Point po) {
		double dx= this.x-po.x;
		double dy=this.y-po.y;
		return Math.sqrt(dx*dx+dy*dy);
	}
}
class Circle2 {
	Point po;
	double radius;
	double perimeter;
	double area;
	
	public Circle2(double radius,Point po) {
		this.po=po;
		this.radius=radius;
		calcPerimeter();
		calcArea();
	}
	public void setRadius(double radius) {
		this.radius=radius;
		calcPerimeter();
		calcArea();
	}
	public double getRadius() {
		return this.radius;
	}
	public double getPerimeter() {
		return this.perimeter;
	}
	public double getArea() {
		return this.area;
	}
	public void calcPerimeter() {
		perimeter= 2*Math.PI*radius;
	}
	public void calcArea() {
		area= Math.PI*radius*radius;
	}
	public boolean getCollision(Circle2 cir2) {
		double tot_radius=this.radius+cir2.radius;
		double dist=this.po.distanceTo(cir2.po);
		if (dist<tot_radius) return true;
		else return false;
	}
	public void display() {
		System.out.println("원의 반지름은 :"+ getRadius());
		System.out.println("원의 둘레는: "+getPerimeter());
		System.out.println("원의 면적은: "+getArea());
	}

}
class Colorpoint extends Point{
	String color;
	public Colorpoint() {
		color="검정";
	}
	public Colorpoint(String color) {
		//맨 처음에 나와줘야한다.
		super(10,100);//부모의 생성자 호출을 자식의 생성자에서 호출하는 것이 가능
		this.color=color;
	}
	public Colorpoint(String color,int x,int y) {
		super(x,y);
		this.color=color;
	}
	public void display() {
		System.out.println("x의 위치: "+x+"y의 위치: "+y+"컬러 값은: "+this.color);
	}
}
public class f_04_Colorpoint_test {
	public static void main(String[] args) {
		Colorpoint cp1=new Colorpoint("노랑",100,200);
		Colorpoint cp2=new Colorpoint("파랑",5,6);
		cp1.display();
		cp2.display();
		//Colorpoint가 Point에 들어 갈 수 있는 이유는 부모가 자식을 가리킬 수 있기 때문에 가능
		//=>상속을 사용하면[부모가 자식을 가리킬 수 있다는 점] 유지보수가 편리하다 
		//Point = ColorPoint가 대입 된 것
		//부모가 자식을 가리키는 것(추가 된 것은 못 가리킴)
		Circle2 cl1=new Circle2(100,cp1); //원래 Circle2는 Point가 매개변수
		Circle2 cl2=new Circle2(100,cp2);
		
		System.out.println("두 점 사이의 거리는"+cl1.po.distanceTo(cl2.po));
		if (cl1.getCollision(cl2)) {
			System.out.println("두 점은 충돌합니다.");
		}
		else {
			System.out.println("두 점은 충돌하지 않습니다.");
		}
		

	}

}
