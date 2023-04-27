public class Calculate {
    public float addition(float a, float b){
        return a+b;
    }
    public float subtraction(float a, float b){
        return a-b;
    }
    public float times(float a, float b){
        return a*b;
    }
    public float division(float a, float b){
        float c = 0;
        try {
            c = a / b;
        }catch (Exception e){
            e.printStackTrace();
        }
        return c;
    }
}
