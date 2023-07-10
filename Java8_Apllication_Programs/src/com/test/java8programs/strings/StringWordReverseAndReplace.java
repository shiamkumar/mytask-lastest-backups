package com.test.java8programs.strings;

import java.util.ArrayList;
import java.util.List;

public class StringWordReverseAndReplace {
	public static void main(String[] args) {
		String inputStr = "Im a here java j2ee developer";
		String resultStr = "";
		List<String> list = splitMethod(inputStr);
		//System.out.println(list);
		for(String word : list) {
			if(word.equals("java")) {
				String reverseWord = reverseMethod(word);
				//System.out.println(reverseWord);
				resultStr = repalceMethod(inputStr, word, reverseWord);
			}
		}
		System.out.println(resultStr);
	}

	private static List<String> splitMethod(String text) {
		List<String> list = new ArrayList<>();
		int size = text.length();
		int index = 0;
		int i;
		for(i=0; i<size; i++) {
			if(text.charAt(i) == ' ') {
				list.add(text.substring(index, i));
				index = i+1;
			}
		}
		list.add(text.substring(index, i));
		return list;
	}
	
	private static String reverseMethod(String word) {
		String reverse = "";
		int size = word.length();
		for(int i=size-1; i>=0; i--) {
			reverse = reverse + word.charAt(i);
		}
		return reverse;
	}
	
	private static String repalceMethod(String inputStr, String word, String reverseWord) {
		return inputStr.replaceAll(word, reverseWord);
	}

	
}
