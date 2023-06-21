package lclass;
public class Circle {
	Point po;
	double radius;
	double perimeter;
	double area;
	
	public Circle(Point po, double radius) {
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
	public boolean getCollision(Circle cir2) {
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
