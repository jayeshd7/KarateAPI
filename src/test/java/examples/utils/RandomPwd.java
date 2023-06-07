package examples.utils;

import java.util.Random;

public class RandomPwd {

    private static int nextInt;

    public static void main(String[] args) {
        passwordGenerator();
    
       

        
    }

    public static String passwordGenerator(){
        String alphabet = "ABGKGHFHFLHFAOAOPUDDHKSLS";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i<6;i++){
            int index = random.nextInt(alphabet.length());
            char randomChar = alphabet.charAt(index);
            sb.append(randomChar);
        }

        String randomString = sb.toString();
        System.out.println("Random String is: " + randomString);
        return randomString;
       


    }

    public static boolean tokenCompare(String s1, String s2){
         if (s1.equalsIgnoreCase(s2)) {
            return true;
         }else return false;
    }
    

}
