package kfunction_pkg;

import java.lang.reflect.Array;

public class d_04_swap {
	
	public static void printarray(float array[]) {
		for (int i=0;i<array.length;i++){
			System.out.print(array[i]+" ");
			
		}
		System.out.println();
	}
	
	//배열에 의한 데이터 전달은 주소에 의한 전달이라 호출한 곳에도 영향을 미침
	//배열에 지정된 값이 또 다른 주소이기 때문에 일일이 교환해주는 작업을 해줘야 교환이 됨
	public static void swap(float x[],float y[]) {
		float temp[]= {x[0],x[1],x[2]}; //함수안에서 데이터를 교환했음
		x[0]=y[0]; 
		x[1]=y[1];
		x[2]=y[2];
		y[0]=temp[0];
		y[1]=temp[1];
		y[2]=temp[2];
		
	}
	
	public static void main(String[] args) {
		int a1=30;
		int b1=45;
		System.out.println("교환전,a="+a1+"b="+b1);
		swapFunction(a1,b1);
		System.out.println("교환후,a="+a1+"b="+b1);
		//값이 바뀌지 않은 이유는 데이터가 값으로 전달되었기 때문에
		
		float anyarray[]= {1,2,3,4,5};
//		printarray(anyarray);
		
		float a[]= {4,1,2};
		float b[]= {2,1,6};

		printarray(a);
		printarray(b);// 함수를 호출하고 난 뒤에 값이 바뀌었다.
		swap(a,b); //호출한 곳에 데이터 교환효과가 미쳤다. call by reference 
		printarray(a); 
		printarray(b);
		
		
	}
	public static void swapFunction(int a,int b) {//호출 한 곳으로 영향을 미치지 않음
		System.out.println("교환전,a="+a+"b="+b);
		int c =a;
		a=b;
		b=c;
		System.out.println("교환후,a="+a+"b="+b);
	}
	
	
	//문제 배열을 입력받아서 배열에 있는 데이터를 출력하는 함수를 작성하시오

}
