package junbjn98;

import java.util.Arrays;
import java.util.Set;
import java.util.TreeSet;

public class Sudoku {

	static int[][] testTrue =  {{1,3,2,5,4,6,9,8,7}, 
		                    {4,6,5,8,7,9,3,2,1}, 
		                    {7,9,8,2,1,3,6,5,4}, 
		                    {9,2,1,4,3,5,8,7,6}, 
		                    {3,5,4,7,6,8,2,1,9}, 
		                    {6,8,7,1,9,2,5,4,3}, 
		                    {5,7,6,9,8,1,4,3,2}, 
		                    {2,4,3,6,5,7,1,9,8}, 
		                    {8,1,9,3,2,4,7,6,5}};
	
	static int[][] testFalse = 	{{1,3,2,5,4,6,9,2,7}, 
					 {4,6,5,8,7,9,3,8,1}, 
					 {7,9,8,2,1,3,6,5,4}, 
					 {9,2,1,4,3,5,8,7,6}, 
					 {3,5,4,7,6,8,2,1,9}, 
					 {6,8,7,1,9,2,5,4,3}, 
					 {5,7,6,9,8,1,4,3,2}, 
					 {2,4,3,6,5,7,1,9,8}, 
					 {8,1,9,3,2,4,7,6,5}};
	
	public static void main(String[] args) {
		System.out.println(sudokuPro(testTrue));
		System.out.println(sudokuSuperPro(testTrue));
		System.out.println(sudokuPro(testFalse));
		System.out.println(sudokuSuperPro(testFalse));
	}

	///////////////////////////////////////////////////////////////
	static boolean sudokuPro(int[][] arr) {
		for (int i = 0; i < 9; i++) {

			int[] row = new int[9];
			int[] square = new int[9];
			int[] column = arr[i].clone();

			for (int j = 0; j < 9; j++) {
				row[j] = arr[j][i];
				square[j] = arr[(i / 3) * 3 + j / 3][i * 3 % 9 + j % 3];
			}
			if (!(validate(column) && validate(row) && validate(square)))
				return false;
		}
		return true;
	}

	static boolean validate(int[] check) {
		int i = 0;
		Arrays.sort(check);
		for (int number : check) {
			if (number != ++i)
				return false;
		}
		return true;
	}

	///////////////////////////////////////////////////////////////
	static boolean sudokuSuperPro(int[][] arr) {
		Set<Integer>[] rows = (Set<Integer>[]) new Set<?>[9];
		Set<Integer>[] cols = (Set<Integer>[]) new Set<?>[9];
		Set<Integer>[] subs = (Set<Integer>[]) new Set<?>[9];
		for (int i = 0; i < 9; i++) {
			rows[i] = new TreeSet<Integer>();
			cols[i] = new TreeSet<Integer>();
			subs[i] = new TreeSet<Integer>();

			for (int j = 0; j < 9; j++) {
				if (!rows[i].add(arr[i][j]) || !cols[i].add(arr[j][i])
						|| !subs[i].add(arr[((i / 3) * 3) + (j / 3)][((i % 3) * 3) + (j % 3)])) {
					return false;
				}
			}
		}
		return true;
	}
}
