package lclass;
import java.util.Scanner;
class Comp{//User class, Judge class : 무한루프로 돌아가면서 게임을 진행
	private int answer;
	Comp(){answer=0;}
	Comp(int answer) {this.answer=answer;}
	public int getComputer() {
		answer=((int) (Math.random()*100))%3;
		return answer;
	}
}
public class e_08_game {

	public static void main(String[] args) {
		

	}

}