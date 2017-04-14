import java.io.*; 
import java.util.*; 
import java.net.*;
import java.lang.*;

public class generator_b implements Runnable{
private int N;
private int L;
private int r;
private InetAddress add;
private int rp;
private int sp;


public generator_b(InetAddress add, int N,int L,int r, int rp, int sp){
this.add=add;
this.N=N;
this.L=L;
this.r=r;
this.rp=rp;
this.sp=sp;





}
public static byte[] toByteArray(int value)
{
byte[] Result = new byte[4];
Result[3] = (byte) ((value >>> (8*0)) & 0xFF);
 Result[2] = (byte) ((value >>> (8*1)) & 0xFF);
 Result[1] = (byte) ((value >>> (8*2)) & 0xFF);
 Result[0] = (byte) ((value >>> (8*3)) & 0xFF);
 return Result;
}

public void run(){
try{
DatagramSocket socket=new DatagramSocket();

long time_int=((long)L*8*1000*1000)/((long)r);
long sta=0;
for(int i=0;i<1470;i++){
long current_time=System.nanoTime();
byte [] buf=new byte[i+10];
System.arraycopy(toByteArray(rp),2,buf,0,2);
System.arraycopy(toByteArray(i+10),2,buf,2,2);
DatagramPacket packet=new DatagramPacket(buf,buf.length,add,sp);


while(System.nanoTime()-current_time<time_int){
}

socket.send(packet);
}

long current_time=System.nanoTime();
while(System.nanoTime()-current_time<1999999999){
}
current_time=System.nanoTime();
while(System.nanoTime()-current_time<1999999999){
}
current_time=System.nanoTime();
while(System.nanoTime()-current_time<1999999999){
}
 current_time=System.nanoTime();
while(System.nanoTime()-current_time<1999999999){
}
current_time=System.nanoTime();
while(System.nanoTime()-current_time<1999999999){
}
current_time=System.nanoTime();
while(System.nanoTime()-current_time<1999999999){
}
byte []buf=new byte[10];
System.arraycopy(toByteArray(rp),2,buf,0,2);
System.arraycopy(toByteArray(1500),2,buf,2,2);
DatagramPacket packet=new DatagramPacket(buf,buf.length,add,rp);
socket.send(packet);

}
catch(IOException e){
e.printStackTrace();
}

}


}
