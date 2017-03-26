import java.io.*;
import java.util.*;
import java.net.*;

public class generator {
	public static void main(String[] args){
                
            	String currentLine=null;
            	BufferedReader bis=null;
            	float last_time=0;
            	float current_time=0;
            	long diff_time=0;
            	long lastnano=0;
            	long curnano=0;
            	PrintStream pout = null;
            	long[] time_buf=new long[125000];
            	int[] size_buf=new int[125000];
                int N;
            	ArrayList<DatagramPacket> g=new ArrayList<DatagramPacket>();
try{
N=9;
File fin= new File("poisson3.data");
DatagramSocket socket=new DatagramSocket();
FileReader fis = new FileReader(fin);
bis = new BufferedReader(fis);
InetAddress addr=InetAddress.getByName("localhost");

FileOutputStream fout =  new FileOutputStream("generator.txt");
pout = new PrintStream (fout);
int i=0;
while((currentLine=bis.readLine())!=null){
	StringTokenizer st = new StringTokenizer(currentLine); 
	String col1 = st.nextToken(); 
	String col2 = st.nextToken(); 
	String col3  = st.nextToken();
	int SeqNo 	= Integer.parseInt(col1);
	float Ftime 	= Float.parseFloat(col2);
	int Fsize 	= Integer.parseInt(col3);
	diff_time=((long)current_time-(long)last_time)/N;
	time_buf[i]=diff_time;
	size_buf[i]=Fsize;
    last_time=current_time;
    current_time=Ftime;
	pout.println(SeqNo+"\t"+diff_time+"\t"+Fsize);
	byte[] buf=new byte[Fsize];
	//DatagramPacket packet=new DatagramPacket(buf,buf.length,addr,4444);
	//g.add(i,packet);
	i++;
	
//	
//	curnano=System.nanoTime();
//	while(curnano-diff_time*1000<lastnano){
//		curnano=System.nanoTime();
//	}
//	lastnano=curnano;
//	socket.send(packet);
}
for(i=0; i<125000;i++){
	//byte[] buf=new byte[size_buf[i]];
	//DatagramPacket packet=new DatagramPacket(buf,buf.length,addr,4444);
	curnano=System.nanoTime();
	while(curnano-time_buf[i]*1000<lastnano){
		curnano=System.nanoTime();
	}
	while(size_buf[i]>1024){
byte[] buf= new byte [1024];
		DatagramPacket packet=new DatagramPacket(buf,buf.length,addr,4444);
		socket.send(packet);
		size_buf[i]=size_buf[i]-1024;
}
	byte[] buf= new byte[size_buf[i]];
	DatagramPacket packet=new DatagramPacket(buf,buf.length,addr,4444);
	socket.send(packet);
        lastnano=System.nanoTime();
}
}
catch (IOException e) {  
	// catch io errors from FileInputStream or readLine()  
	System.out.println("IOException: " + e.getMessage());  
}
finally{
	if(bis!=null){
		try{
			bis.close();
			pout.close();
		}
		catch (IOException e) { 
			System.out.println("IOException: " +  e.getMessage());  
		} 
	}
}
}}
