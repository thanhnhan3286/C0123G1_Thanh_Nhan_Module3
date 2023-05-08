import jdk.internal.org.objectweb.asm.tree.MultiANewArrayInsnNode;

public class GiaiPhuongTrinhBac2 {
    public static void main(String[] args) {
        giaiPhuongTrinhBac2(3,6,7);
    }
    public static void giaiPhuongTrinhBac2(double a, double b, double c){
        double delta = b*b-4*a*c;
        if(delta<0){
            System.out.println("Phuong trinh vo nghiem.");
        }else if(delta ==0){
            System.out.println("Phuong trinh cos 1 nghiem kep la: " + (-b/2*a));
        }else {
            System.out.println("Phuong trinh co 2 nghiem la: x1 = " + ((-b+Math.sqrt(delta))/2*a) + " va x2 = " + ((-b-Math.sqrt(delta))/2*a));
        }
    }
}
