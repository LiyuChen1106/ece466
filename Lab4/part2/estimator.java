import java.io.*; 
import java.util.*; 
import java.net.*;
import java.lang.*;

public class estimator{
public static generator ge;
public static sink si;
public static void main(String[] args) throws IOException{
int sp=Integer.parseInt(args[0]);
int N=Integer.parseInt(args[1]);
int L=Integer.parseInt(args[2]);
int r=Integer.parseInt(args[3]);
int rp=5555;

InetAddress addr=InetAddress.getByName("localhost");
ge=new generator(addr,N,L,r,rp,sp);
si=new sink(ge,rp,N,L);
new Thread(ge).start();
new Thread(si).start();

}
}
