package com.test.java.concept.commonexceptionsoverriding;

public class MainClass02 {

	int test_a, test_b;
	//MainClass02() {}
	MainClass02(int a, int b) {
		test_a = a;
		test_b = b;
	}

	public static void main(String[] args) {
		MainClass02 test = new MainClass02();
		System.out.println(test.test_a + " " + test.test_b);

	}

}
