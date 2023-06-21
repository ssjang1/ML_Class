package n_generic;

class Box<T> { // 대표 데이터 타입 - 실제 사용하는 타입으로 변화
	private T t;

	public void add(T t) {
		this.t = t;
	}

	public T get() {
		return t;
	}
}

//상속도 아닌데 다양한 데이터타입을 받아서 처리하는 함수
public class h_01_Box {
	public static <E> void printArray(E[] inputArray) {// 함수에 대표타입지정
		for (E element : inputArray) {
			System.out.printf("%s", element);
		}
		System.out.println();
	}

	public static void main(String[] args) {
		// generic에서는 class, interface 등 만 가능
		Integer intArray[] = { 1, 2, 3, 4, 5 };// 정수형배열
		Double doubleArray[] = { 1.1, 2.2, 3.3, 4.4 };
		Character charArray[] = { 'H', 'E', 'L', 'L', 'O' };
		printArray(intArray);
		printArray(doubleArray);
		printArray(charArray);
		
		Box<Integer> integerBox=new Box<Integer>(); // 클래스는 구체적인 데이터타입을 인스턴스 할 때 지정
		Box<String> stringBox=new Box<String>();
		integerBox.add(Integer.valueOf(10)); // 추가 
		stringBox.add(new String("안녕 일반화 프로그램"));
		System.out.printf("정수형 :%d\n\n", integerBox.get());
		System.out.printf("문자형 :%s\n", stringBox.get());
	}

}
