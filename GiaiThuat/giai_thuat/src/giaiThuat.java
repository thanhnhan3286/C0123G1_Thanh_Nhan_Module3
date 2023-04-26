import java.util.Scanner;

public class giaiThuat {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        boolean flag;
        System.out.print("Nhập 1 số chẵn bất kỳ: ");
        do {
            flag = true;
            int n = sc.nextInt();
            if (n <= 0 || n % 2 != 0) {
                System.out.print("Số đã nhập không thỏa mãn, mời nhập lại: ");
            } else {
                int a = (n / 2) + 1;
                for (int i = a; i > 1; i--) {
                    for (int x = a; x > i; x--) {
                        System.out.print(" ");
                    }
                    for (int j = i * 2 - 1; j >= 2; j--) {
                        System.out.print("*");
                    }
                    System.out.println();
                }
                for (int i = 2; i <= a; i++) {
                    for (int x = a; x > i; x--) {
                        System.out.print(" ");
                    }
                    for (int j = 2; j <= i * 2 - 1; j++) {
                        System.out.print("*");
                    }
                    System.out.println();
                }
                flag = false;
            }
        } while (flag);
    }
}
