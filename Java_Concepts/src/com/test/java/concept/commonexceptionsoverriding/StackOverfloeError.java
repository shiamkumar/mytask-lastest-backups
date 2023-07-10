package com.test.java.concept.commonexceptionsoverriding;

public class StackOverfloeError {
	public static void main(String[] args) {
		StackOverfloeError obj = new StackOverfloeError();
		obj.print(0);
	}
	
	public void print(int val) {
		System.out.println(val);
		print(val); //deep or infinte recursion occurs stackoverflow error
		//inspect the stack trace
		//increase thread stack size (-Xss4m)
	}
}
