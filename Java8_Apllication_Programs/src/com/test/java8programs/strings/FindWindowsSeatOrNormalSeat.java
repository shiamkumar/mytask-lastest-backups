package com.test.java8programs.strings;

import java.util.Arrays;
import java.util.List;

public class FindWindowsSeatOrNormalSeat {
	public static void main(String[] args) {
		List<Integer> seats = Arrays.asList(1,2,3,4,5,6,7,8,9,10,11,12);
		findWindowsOrNormalSheet(seats);
	}

	private static void findWindowsOrNormalSheet(List<Integer> seats) {
		for(int i=0; i<seats.size(); i++) {
			if(seats.get(i)%4==0 || seats.get(i)%4==0 +1) {
				System.out.println("windows seat:: "+seats.get(i));
			} else {
				System.out.println("normal seat:: "+seats.get(i));
			}
		}
	}
	
	
}
