import java.io.*; 
import java.util.*; 
import java.net.*;
import java.lang.*;
public class Main_b{
public static estimator_b esb;
public static estimator_rT esrt;
public static void main(String[] args) throws IOException{
esb=new estimator_b(1111,4444);

new Thread(esb).start();
while(esb.getla()==0){
    }
int length=esb.getla();
System.out.println(length*8);
System.out.println(length);




}}