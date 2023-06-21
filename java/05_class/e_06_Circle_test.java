package lclass;
public class e_06_Circle_test {
	public static void main(String[] args) {
		Point po=new Point(5,6);
		Circle cl=new Circle(po,100);
		cl.display();
		cl.setRadius(1);
		cl.display();
		
		Point po2=new Point(10,8);
		Circle cl2=new Circle(po2,1);
		if (cl.getCollision(cl2))
			System.out.println("두 원은 충돌했습니다.");
		else {
			System.out.println("두 원은 충돌하지 않습니다.");
		}
		
	}

}