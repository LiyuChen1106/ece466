import java.io.*; 
import java.util.*; 
import java.net.*;
import java.lang.*;

public class sink_rT implements Runnable{

private long[] recitime;
private int la;
private int port;
private int N;
private int L;
private generator_rT ge;

public sink_rT(generator_rT ge,int port,int N, int L){
this.ge=ge;
this.port=port;
this.N=N;
this.L=L;
this.la=0;
this.recitime=new long[2*N];

}
public synchronized long getreci(int seq){
return recitime[seq];
}
public synchronized long getlast(){
return la;
}
public void run(){

try{
DatagramSocket socket= new DatagramSocket(port);
FileOutputStream fout=new FileOutputStream("sink.txt");
PrintStream pOut=new PrintStream(fout);
byte [] buf=new byte[L];
DatagramPacket packet=new DatagramPacket(buf,buf.length);
int t=0;
int seqNo=0;
long starttime=0;
long recetime=0;
while(true){
socket.receive(packet);
seqNo=fromByteArray(packet.getData(),2,2);

if(seqNo==1500){
recitime[2*N-1]=1500;
break;
}
starttime=ge.gettime(1);
recitime[la]=(System.nanoTime()-starttime)/1000;

la++;


}

}
catch (IOException e){
e.printStackTrace();
}

}

public static int fromByteArray(byte [] value, int start, int length){
int Return=0;
for(int i=start;i<start+length;i++){
Return=(Return<<8)+(value[i] & 0xff);
}
return Return;
}
}
