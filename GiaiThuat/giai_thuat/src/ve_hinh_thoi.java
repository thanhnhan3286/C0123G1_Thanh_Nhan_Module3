public class ve_hinh_thoi {
    public static void main(String[] args) {
        for (int i = 5; i >1; i--) {
            for (int x = 5; x >= i; x--) {
                System.out.print("0");
            }
            for (int j = i * 2 - 1; j >=2 ; j--) {
//                System.out.println("*");
                if (j == i * 2 - 1 || j == 2) {
                    System.out.print("*");
                } else {
                    System.out.print("1");
                }
            }
            System.out.println("");
        }
        for (int i = 2; i < 6; i++) {
            for (int x = 6; x > i; x--) {
                System.out.print(" ");
            }
            for (int j = 2; j <= i * 2 - 1; j++) {
                if (j == i * 2 - 1 || j == 2) {
                    System.out.print("*");
                } else {
                    System.out.print("2");
                }
            }
            System.out.println("");
        }
    }
}
