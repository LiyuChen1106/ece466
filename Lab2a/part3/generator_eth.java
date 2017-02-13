import java.io.*;
import java.util.*;
import java.net.*;

public class generator_eth{
	public static void main(String[] args){
                
            	String currentLine=null;
            	BufferedReader bis=null;
            	float last_time=0;
            	float current_time=0;
            	long diff_time=0;
            	long lastnano=0;
            	long curnano=0;
            	PrintStream pout = null;
            	long[] time_buf=new long[1000000];
            	int[] size_buf=new int[1000000];
            	ArrayList<DatagramPacket> g=new ArrayList<DatagramPacket>();
try{
File fin= new File("Bel.data");
DatagramSocket socket=new DatagramSocket();
FileReader fis = new FileReader(fin);
bis = new BufferedReader(fis);
InetAddress addr=InetAddress.getByName("localhost");

FileOutputStream fout =  new FileOutputStream("generator.txt");
pout = new PrintStream (fout);
int i=0;
int SeqNo=1;
while((currentLine=bis.readLine())!=null){
	StringTokenizer st = new StringTokenizer(currentLine); 
	String col1 = st.nextToken(); 
	String col2 = st.nextToken(); 
	float Ftime 	= Float.parseFloat(col1);
	int Fsize 	= Integer.parseInt(col2);
	diff_time=(long)((current_time-last_time)*1000000000);
	time_buf[i]=diff_time;
	size_buf[i]=Fsize;
    last_time=current_time;
    current_time=Ftime;
	pout.println(SeqNo+"\t"+diff_time+"\t"+Fsize);
	SeqNo++;
	//byte[] buf=new byte[Fsize];
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
for(i=0; i<1000000;i++){
	//byte[] buf=new byte[size_buf[i]];
	//DatagramPacket packet=new DatagramPacket(buf,buf.length,addr,4444);

	curnano=System.nanoTime();
	while(curnano-time_buf[i]<lastnano){
		curnano=System.nanoTime();
	}
	while(size_buf[i]>1024){
		byte[] buf=new byte[1024];
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
