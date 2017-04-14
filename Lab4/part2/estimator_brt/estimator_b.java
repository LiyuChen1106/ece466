import java.io.*; 
import java.util.*; 
import java.net.*;
import java.lang.*;

public class estimator_b implements Runnable{
private int sp;
private int rp;
private int length;
public static generator_b geb;
public static sink_b sib;
public estimator_b( int rp, int sp){
try{
InetAddress addr=InetAddress.getByName("localhost");
this.geb=new generator_b(addr,100,400,1000,rp,sp);
this.sib=new sink_b(rp,100,400);
this.rp=rp;
this.length=0;
this.sp=sp;}
catch (IOException e){
e.printStackTrace();
}

}

public synchronized int getla(){
return length;}

public void run(){
new Thread(geb).start();
new Thread(sib).start();
while(sib.getsize(1490)!=1500){
}

length=sib.getsize(sib.getlastone()-2);
}
}
