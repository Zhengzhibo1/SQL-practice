import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Solution {
	Map<String, String> map = new HashMap<String, String>();
	{
		map.put("2", "abc");
		map.put("3", "def");
		map.put("4", "ghi");
		map.put("5", "jkl");
		map.put("6", "mno");
		map.put("7", "pqrs");
		map.put("8", "tuv");
		map.put("9", "wxyz");
	}

	List<String> results = new ArrayList<String>();

// ====================算法实现======================
	// 1 回溯法
	// 时间复杂度O(3^N * 4^M)，其中N为输入数字对应3个字母的个数，M为输入数字对应4个字母的个数。
	// 空间复杂度O(3^N * 4^M)，需要这么多的空间存放结果。
	public List<String> letterCombinations(String digits) {

		if (digits.length() != 0) {
			backtrack("", digits);
		}

		return results;
	}

	public void backtrack(String combination, String nextDigits) {
		if (nextDigits.length() == 0) {
			results.add(combination);
		} else {
			String digit = nextDigits.substring(0, 1);
			String letters = map.get(digit);
			for (int i = 0; i < letters.length(); ++i) {
				String letter = letters.substring(i, i + 1);
				backtrack(combination + letter, nextDigits.substring(1));
			}
		}
	}

// ====================测试代码======================
	public void test() {
		String digits = "23";
		List<String> results = letterCombinations(digits);
		for (String s : results) {
			System.out.print(s + "\t");
		}
	}

	public static void main(String[] args) {
		Solution s = new Solution();
		s.test();

	}

}
