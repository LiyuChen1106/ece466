import java.io.*; 
import java.util.*; 
import java.net.*;
import java.lang.*;

public class sink_b implements Runnable{

private int port;
private int N;
private int L;
private int [] byteget;
private int lastone;

public sink_b(int port,int N, int L){
this.port=port;
this.N=N;
this.L=L;
this.byteget=new int[1500];
this.lastone=0;

}
public synchronized int getsize(int seq){
return byteget[seq];
}
public synchronized int getlastone(){
return lastone;
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
byteget[lastone]=seqNo;
lastone++;
pOut.println(seqNo);
if(seqNo==1500){
byteget[1490]=1500;
          break;}


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
