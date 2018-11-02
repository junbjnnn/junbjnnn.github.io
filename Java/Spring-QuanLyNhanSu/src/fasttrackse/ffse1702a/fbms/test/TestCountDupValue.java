package fasttrackse.ffse1702a.fbms.test;

import java.util.HashMap;
import java.util.Map;

public class TestCountDupValue {

	public static void main(String[] args) {
		String[] names = { "Caty", "John", "Nick", "John", "Philip", "Caty", "Caty" };
		Map<String, Integer> map = new HashMap<>(names.length);
		for (String name : names) {
			Integer count = map.get(name);
			if (count == null) {
				count = 0;
			}
			map.put(name, count + 1);
		}
		for (Map.Entry<String, Integer> entry : map.entrySet()) {
			System.out.println("key: " + entry.getKey() + " - value: " + entry.getValue());
		}
	}

}
