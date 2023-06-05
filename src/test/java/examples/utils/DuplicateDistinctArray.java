package examples.utils;

import java.util.stream.Stream;

public class DuplicateDistinctArray {

    public static void main(String[] args) {
        String [] array1 = {"a", "b", "c"};
        String [] array2 = {"a","d","e"};

        String [] result = Stream
                .concat(Stream.of(array1), Stream.of(array2))
                .distinct()
                .sorted()
                .toArray(String[]::new);

        for (String str:result) {
            System.out.println(str);
        }
    }
}
