package lclass;
public class Point {
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
