package fasttrackse.ffse1702a.fbms.test;

import java.util.ArrayList;

public class TestJVC {

	private String word;
	static String s2;
	static String s3;
	static String s4;
	static String s5;
	static String s6;
	static int c2;
	static int c3;
	static int c4;
	static int n1;
	static int n2;
	static int n3;
	static int d;
	static int y;
	static int y1;
	static int y2;
	static char ch1;
	static char ch2;
	static char ch3;
	static int c1 = 583;

	public TestJVC(String aWord) {
		word = aWord;
	}

	public ArrayList<String> getPermutations() {
		ArrayList<String> result = new ArrayList();
		if (word.length() == 0) {
			result.add(word);
			return result;
		}
		for (int i = 0; i < word.length(); i++) {
			String shorterWord = word.substring(0, i) + word.substring(i + 1);
			TestJVC shorterPermutationGenerator = new TestJVC(shorterWord);
			ArrayList<String> shorterWordPermutations = shorterPermutationGenerator.getPermutations();
			for (String s : shorterWordPermutations) {
				result.add(word.charAt(i) + s);
			}
		}
		return result;
	}

	public static void main(String[] args) {
		String s1 = "Other";
		s1 = s1.substring(0, 5);
		TestJVC pm = new TestJVC(s1);
		ArrayList<String> permut = pm.getPermutations();
		s2 = (permut.get(3));
		s3 = (permut.get(10));
		s4 = (permut.get(17));
		ch1 = s2.charAt(3);
		ch2 = s3.charAt(3);
		ch3 = s4.charAt(3);
		n1 = ch1;
		n2 = ch2;
		n3 = ch3;
		c1 <<= 2;
		c2 = (c1 & 0xFF);
		c3 = (c1 ^ c2);
		c4 = (c1 | c3);
		d = (c2 * 2 + c3 * 3 + c4 * 4 + n1 * 10 + n2 * 11 + n3 * 12);
		s5 = String.valueOf(d);
		s6 = s5;
		s5 = s5.substring(0, 2);
		y = Integer.parseInt(s5);
		y1 = Integer.parseInt(s6);
		int[][] a = { { 2, 2, y }, { 4, 6, 2 }, { 3, 4, 4 } };
		int[][] b = { { 2, 2, 3 }, { 8, 9, 5 }, { 6, 2, 2 } };
		int[][] c = new int[3][3];
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				c[i][j] = 0;
				for (int k = 0; k < 3; k++) {
					c[i][j] += a[i][k] * b[k][j];
				}
			}
		}
		y2 = c[2][2];
		y2 *= y1;
		System.out.println(String.valueOf(y2));
	}

}