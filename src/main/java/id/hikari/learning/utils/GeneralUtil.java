package id.hikari.learning.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GeneralUtil {
    public static int countOccurrences(String str, String word) {
        String a[] = str.split(" ");
        int count = 0;
        for (String a1 : a) {
            if (a1.startsWith(word)) {
                count++;
            }
        }
        return count;
    }

    public static void replaceAll(StringBuilder builder, String from, String to) {
        int index = builder.indexOf(from);
        while (index != -1) {
            builder.replace(index, index + from.length(), to);
            index += to.length(); // Move to the end of the replacement
            index = builder.indexOf(from, index);
        }
    }

    public static void replaceRandomAll(StringBuilder sb) {
        replaceRandom(sb, ":value");
        replaceRandom(sb, ":compare");
        replaceRandom(sb, ":operator");
        replaceRandom(sb, ":output");
    }

    public static void replaceRandom(StringBuilder sb, String randomType) {
        /*
         * int count = countOccurrences(sb.toString(), randomType);
         * for (int j = 1; j <= count; j++) {
         * String to = "";
         * if (randomType.equals(":value")) {
         * to = String.valueOf(StaticValue.getRandomValue(j - 1));
         * } else if (randomType.equals(":compare")) {
         * to = StaticValue.getComparison();
         * } else if (randomType.equals(":operator")) {
         * to = StaticValue.getOperator();
         * } else if (randomType.equals(":output")) {
         * to = "\"" + StaticValue.getRandomOutput(j - 1) + "\"";
         * }
         * replaceAll(sb, randomType + j + "", to);
         * }
         */
    }

    public static String checkRandomType(String randomType) {
        String to = "";
        if (randomType.equals(":value")) {
            to = String.valueOf(StaticValue.getRandomValue());
        } else if (randomType.equals(":compare")) {
            to = StaticValue.getComparison();
        } else if (randomType.equals(":operator")) {
            to = StaticValue.getOperator();
        } else if (randomType.equals(":output")) {
            to = "\"" + StaticValue.getRandomOutput() + "\"";
        }
        return to;
    }

    public static String replace(String str, String word) {
        Pattern pattern = Pattern.compile(word, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(str);
        int actualLength = str.length();
        StringBuilder builder = new StringBuilder(str);
        while (matcher.find()) {
            int start = matcher.start();
            int end = matcher.end();
            if (actualLength != builder.length()) {
                int reduce = actualLength - builder.length();
                start -= reduce;
                end -= reduce;
            }
            builder.replace(start, end, checkRandomType(word));
        }
        return builder.toString();
    }
}
