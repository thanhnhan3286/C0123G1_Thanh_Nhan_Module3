import java.util.Scanner;

public class giaiThuat {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("nhap n");
        int n = scanner.nextInt();
        giaiThuat(n);
    }

    static void giaiThuat(int n) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i < n/2) {
                    if (j >= i && j < n - i) {
                        System.out.print("*");
                    } else {
                        System.out.print(" ");
                    }
                } else {
                    if (j < n - i - 1 || j > i) {
                        System.out.print(" ");
                    } else {
                        System.out.print("*");
                    }
                }

            }
            System.out.println();
        }
    }

}