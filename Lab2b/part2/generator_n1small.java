import java.io.*;
import java.util.*;
import java.net.*;

public class generator_n1small {
	public static void main(String[] args){
                

                float T;
                int N;
                int L;

            	String currentLine=null;


            	long diff_time=0;
            	long time2=0;
            	long time3=0;
            	long curnano=0;
            	PrintStream pout = null;

try{
	T=2;
	N=1;
	L=100;
DatagramSocket socket=new DatagramSocket();
InetAddress addr=InetAddress.getByName("localhost");

FileOutputStream fout =  new FileOutputStream("generator_n1small.txt");
pout = new PrintStream (fout);
int i=1;
int j=1;
while(i<=10000){
	long firsttime=System.nanoTime();
     while(j<=N){
    	 byte[] buf=new byte[L];
    	 DatagramPacket packet=new DatagramPacket(buf,buf.length,addr,4444);
    	 time2=System.nanoTime();
    	 diff_time=time2-time3;
    	 time3=time2;
    	 if(i==1){
    		 firsttime=time2;
    		diff_time=0;
    	 }
    	 pout.println(i+"\t"+diff_time/1000+"\t"+L);
    	 socket.send(packet);
    	 i++;
    	 j++;
     }
	j=1;
	curnano=System.nanoTime();
    while(curnano-firsttime<T*1000000){
    	curnano=System.nanoTime();
    }
	

}

}
catch (IOException e) {  
	// catch io errors from FileInputStream or readLine()  
	System.out.println("IOException: " + e.getMessage());  
}
finally{

}
}}
