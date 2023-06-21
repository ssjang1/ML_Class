package lclass;
public class e_05_Point_test {
	public static void main(String[] args) {
		Point po1=new Point(3,4);
		System.out.println(po1.getX());
		System.out.println(po1.getY());
		System.out.println(po1.toOrigin());
		System.out.println();
		System.out.println("각도는"+po1.angle());
		
		Point po2=new Point(10,20);
		System.out.println("두 포인트 간의 거리는 "+po1.distanceTo(po2));

	}
	//문제 Circle class 생성해보시오
	//중심점(point), 둘레(perimeter):2*pi*r, 면적(area)=pi*r*r
	//두 원 사이의 거리는 이미 point에서 구해져 있음
	//두 원은 충돌하는 가

}