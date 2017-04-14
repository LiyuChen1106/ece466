import java.io.*; 
import java.util.*; 
import java.net.*;
import java.lang.*;

public class generator implements Runnable{
private int N;
private int L;
private int r;
private InetAddress add;
private int rp;
private int sp;
private long[] send_time;

public generator(InetAddress add, int N,int L,int r, int rp, int sp){
this.add=add;
this.N=N;
this.L=L;
this.r=r;
this.rp=rp;
this.sp=sp;
send_time=new long[N];
}

public synchronized long gettime(int h){
return send_time[h-1];
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
FileOutputStream fout=new FileOutputStream("output_generator.txt");
PrintStream pOut=new PrintStream(fout);
DatagramSocket socket=new DatagramSocket();
long time_int=((long)L*8*1000*1000)/((long)r);
long sta=0;
for(int i=0;i<N;i++){
long current_time=System.nanoTime();
byte [] buf=new byte[L];
System.arraycopy(toByteArray(rp),2,buf,0,2);
System.arraycopy(toByteArray(i+1),2,buf,2,2);
DatagramPacket packet=new DatagramPacket(buf,buf.length,add,sp);


while(System.nanoTime()-current_time<time_int){
}
if(i==0){
send_time[0]=System.nanoTime();
}
else{
send_time[i]=System.nanoTime()-send_time[0];}
pOut.println(i+1+"\t"+send_time[i]/1000+"\t"+time_int/1000);
socket.send(packet);
}
}
catch(IOException e){
e.printStackTrace();
}

}


}
