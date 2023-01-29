package id.hikari.learning;

public class PalindromeLevel {
    public static int isPalindrome(String s) {
        s = s.replace(" ", "").toLowerCase();

        Boolean isPalindrome = true;
        int level = 0;

        while (isPalindrome) {
            StringBuilder sb = new StringBuilder(s);
            String reverse = sb.reverse().toString();

            System.out.println(reverse + " " + s.length());

            if (s.equals(reverse)) {
                level++;

                int l = 0;
                if (s.length() % 2 == 1) {
                    l = (s.length() / 2) + 1;
                } else {
                    l = s.length() / 2;
                }

                s = sb.substring(0, l);
            } else {
                isPalindrome = false;
            }

            if (!isPalindrome) {
                return level;
            }

        }

        return level;
    }

    public static Boolean check(String a) {
        System.out.println(a);
        StringBuilder sb = new StringBuilder(a);
        // System.out.println(sb+" "+sb.reverse());
        if (sb.equals(sb.reverse())) {
            return true;
        }
        return false;
    }

    public static int sumPalindromLevel(String a) {
        int sum = 0;
        for (int i = 0; i < a.length(); i++) {
            for (int j = 0; j <= i; j++) {
                
                String x = Character.toString(a.charAt(j));
                // System.out.print(check(x));
                if(check(x)){
                    sum++;
                }
            }
            System.out.println();
        }
        return sum;
    }

    public static void main(String[] args) {
        // System.out.println(isPalindrome("dam madam mad"));
        System.out.println(sumPalindromLevel("null"));
    }
}
