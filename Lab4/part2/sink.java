import java.io.*; 
import java.util.*; 
import java.net.*;
import java.lang.*;

public class sink implements Runnable{

private int port;
private int N;
private int L;
private generator ge;

public sink(generator ge,int port,int N, int L){
this.ge=ge;
this.port=port;
this.N=N;
this.L=L;
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
while(t<N){
socket.receive(packet);
seqNo=fromByteArray(packet.getData(),2,2);
starttime=ge.gettime(1);
recetime=(System.nanoTime()-starttime)/1000;
if(t!=0)
pOut.println(seqNo+"\t"+ge.gettime(seqNo)/1000+"\t"+recetime);
else
pOut.println(seqNo+"\t"+"0"+"\t"+recetime);

/* remember to add timestamp here*/
t++;
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
