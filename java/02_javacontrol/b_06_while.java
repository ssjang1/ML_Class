package javacontrol;
import java.util.Scanner;
//���α׷����� ó�� ������ �߿�
public class b_06_while {
	public static void main(String[] args) {
		int i=1;
		while(i<=10) {
			System.out.println(i);
			i++;
		}
		
		i=1;
		do {
			System.out.println(i);
			i++;
		}while(i<=10);
		
		//���� ��ǻ�� ����
		//������ ���ڸ� �Է¹޾Ƽ� ��ǻ�Ͱ� ������ ���ڸ� ���ߴ� �����Դϴ�.
		//��ǻ�ʹ� ������ �̿��ؼ� 1���� 100������ ���ڸ� �����մϴ�.
		//������ ���ڸ� �Է��ؼ� ��ǻ�Ͱ� ������ ���ڸ� ������մϴ�.
		//�Է��� ���ڰ� ��ǻ�� ���ں��� ũ�� ũ��. ������ �۴�. ������ ����
		//������ ����Ǹ� �� �� �Է��ߴ��� �Է�Ƚ���� ����մϴ�.
		Scanner input = new Scanner(System.in);
		
//		double randomnumber = Math.floor(100*Math.random()+1);
		
		int win=0;
		int lose=0;
		int battle=0;
		String temp = "";
		
		while(true) {
			battle+=1;
			System.out.println("������ �����մϴ�. (������ y ����� -1)");
			temp=input.nextLine();
			int randomnumber = (int) (100 * Math.random())+1;
			if (temp.isEmpty()==true || temp.equals("-1")) {
				break;}
			else {
				while(true) {
//					int randomnumber = (int) (100 * Math.random())+1;
					int usertry=1;
					System.out.println("��ǻ���� ���ڸ� ���߼��� : ");
					String number = input.nextLine();
					
						if (randomnumber>Integer.parseInt(number)) {
							System.out.println("�Է°����� ū���Դϴ�.");
							usertry+=1;
						}else if (randomnumber<Integer.parseInt(number)) {
							System.out.println("�Է°����� �������Դϴ�.");
							usertry+=1;
						}else {
							System.out.println("����!");
							System.out.printf("�Է��� Ƚ���� %dȸ �Դϴ�." ,usertry);
							if (usertry>7) {
								lose+=1;
								System.out.printf("������ %d�� %d�� %d�� �Դϴ�.",battle,win,lose);
							}else {
								win+=1;
								System.out.printf("������ %d�� %d�� %d�� �Դϴ�.",battle,win,lose);
							}
							break;
						}
				}
			}
			
			

		}
		//�߰� ���� : ������ ������ ?�� ?�� ?�и� ����ϵ��� ������ ������ �����ϵ��� �����ϼ���
		//�߰��� -1�� �Է��� �ǰų� �� �����Ͱ� ������ �����ϵ��� �����غ�����
		//�Էµ� ������ ���� ���� Ȯ���ϰ��� �� ���� ���ڿ��� �Է¹޾Ƽ� isEmpty()�Լ� ���
		//���ڿ� �񱳴� equals("-1")
		//input.isEmpty(), input.equals("-1")
		input.close();
		
	}

}
