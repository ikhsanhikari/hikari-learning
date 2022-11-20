package id.hikari.learning.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class StaticValue {

    public static String psvm(String code) {
        return "class Program{\n"
                + " public static void main(String [] args){\n"
                + code + "\n"
                + " }\n"
                + "}";
    }

    public static String getOperator() {
        List<String> result = Arrays.asList("+", "-");
        Random rand = new Random();
        return result.get(rand.nextInt(result.size()));
    }

    public static String getComparison() {
        List<String> result = Arrays.asList("<", ">", "<=", ">=", "!=", "==");
        Random rand = new Random();
        return result.get(rand.nextInt(result.size()));
    }

    public static String getStandarVarName() {
        List<String> result = Arrays.asList("a", "b", "c");
        Random rand = new Random();
        return result.get(rand.nextInt(result.size()));
    }

    public static String getLogicOperator() {
        List<String> result = Arrays.asList("||", "&&");
        Random rand = new Random();
        return result.get(rand.nextInt(result.size()));
    }

    public static String printLnText(String text) {
        return "System.out.println(\"" + text + "\");";
    }

    public static String getRandomOutput() {
        int index = new Random().nextInt(20);
        List<String> result = Arrays.asList(
                "Wooz",
                "Buff",
                "Hi",
                "Hello",
                "Huzzzzzz",
                "Yosh", "fun", "memorial",
                "item", "buy", "bean", "law", "hotdog", "figure", "sour", "bang",
                "ministry", "fax", "deal", "want", "relaxation", "delicate", "concentrate",
                "advocate", "archive", "reflect");
        Collections.shuffle(result);
        return result.get(index);

    }

    public static Integer getRandomValue() {
        int index = new Random().nextInt(15);
        List<Integer> result = new ArrayList<>();
        for (int i = 1; i < 30; i++) {
            result.add(i);
        }
        Collections.shuffle(result);
        return result.get(index);
    }

    public static final String VALUE = ":value";
    public static final String OUTPUT = ":output";
    public static final String COMPARE = ":compare";
    public static final String OPERATOR = ":operator";
    public static final String LOGIC = ":logic";
}
