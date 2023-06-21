package m_inheritance;
abstract class Weapon{
	//추상 클래스: 추상 함수가 하나라도 있으면
	//추상 클래스는 인스턴스 하면 안된다. 
	//안되는 이유: 정의가 안 된 함수는 실행하면 에러가 발생한다.
	public void prepare() {
		System.out.println("무기 작동을 준비합니다.");
	}
	public abstract void attack(); //추상 함수
}
//추상 클래스를 상속받는 이유
//1)추상함수는 반드시 오버라이딩 해야함 ->프로그래머가 잊지않고 같은 이름으로 구현해주길 바랄 때
//=>약속 plugin에서 사용
//2)인스턴스는 하지 않지만 부모로서 상속받은 자식을 가리킬 수가 있다.
class MyWeapon extends Weapon{
	@Override // annotation(자바) ->장식자- 특수한 기능
	public void attack() {
		System.out.println("김구라를 공격해요");
	}
}
class YourWeapon extends Weapon{
	@Override
	public void attack() {
		System.out.println("원숭이를 공격해요!");
	}
}
public class g_01_abstract {

	public static void main(String[] args) {
		MyWeapon w1=new MyWeapon();
		w1.prepare();
		w1.attack();
		YourWeapon w2=new YourWeapon();
		w2.prepare();
		w2.attack();
		useWeapon(w1);
		useWeapon(w2);
	}
	public static void useWeapon(Weapon w) {
		//부모로 매개변수를 정의-> 유지보수에 좋음
		w.prepare();
		w.attack();
	}

}