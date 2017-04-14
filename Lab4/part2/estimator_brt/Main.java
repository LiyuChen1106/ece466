import java.io.*; 
import java.util.*; 
import java.net.*;
import java.lang.*;
public class Main{
public static estimator_b esb;
public static estimator_rT esrt;
public static void main(String[] args) throws IOException{


esrt=new estimator_rT(1112,4444,375); 
new Thread(esrt).start();
while(esrt.getf()!=1){
}
float r=esrt.getr();
long t=esrt.gett();
System.out.println(r);
System.out.println(t);
}

}
