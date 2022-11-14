package id.hikari.learning;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import id.hikari.learning.utils.GeneralUtil;
import id.hikari.learning.utils.StaticValue;

public class RandomSimulation {
    public static void main(String[] args) {
        String code = "public class MatSym {     public static void main(String[]args) {        if(:value:compare:value && :value:compare:value){System.out.println(:output);}else{System.out.println(:output);}} } ";
        String result = "";
        List<String> patternResult = new ArrayList<>();
        for (int i = 0; i < 2; i++) {
            result = code;
            // result = GeneralUtil.replace(result, StaticValue.VALUE);
            // result = GeneralUtil.replace(result, StaticValue.COMPARE);
            // result = GeneralUtil.replace(result, StaticValue.OPERATOR);
            result = GeneralUtil.replace(result, StaticValue.OUTPUT);
            patternResult.add(result);
        }
        System.out.println("======================");
        patternResult.forEach((item) -> System.out.println(item));
        System.out.println("======================");
    }

    public static String countOccurrences(String str, String word) {
        Pattern pattern = Pattern.compile(word, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(str);
        int actualLength = str.length();
        StringBuilder builder = new StringBuilder(str);
        while (matcher.find()) {
            int start = matcher.start();
            int end = matcher.end();
            if (actualLength > builder.length()) {
                int reduce = actualLength - builder.length();
                start -= reduce;
                end -= reduce;
            }
            builder.replace(start, end, String.valueOf(new Random().nextInt(100)));
        }
        return builder.toString();
    }
}
