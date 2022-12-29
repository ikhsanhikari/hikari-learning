package id.hikari.learning;

import java.util.HashMap;
import java.util.Map;

public class CountCurrent {

    public static void main(String[] args) {
        String str = "elisa septiani lubis";
        str = str.replace(" ", "");
        Map<Character, Integer> occur = new HashMap<>();

        char[] ch = str.toCharArray();

        for (char c : ch) {
            if (occur.containsKey(c)) {
                occur.put(c, occur.get(c) + 1);
            } else {
                occur.put(c, 1); // {e,1},{l,1},{i,1},{s,2},{a,1}
            }
        }

        System.out.println(occur);
    }
}
