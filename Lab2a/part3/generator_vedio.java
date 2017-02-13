import java.io.*;
import java.util.*;
import java.net.*;

public class generator_vedio {
	public static void main(String[] args){
                
            	String currentLine=null;
            	BufferedReader bis=null;
            	float last_time=0;
            	float current_time=0;
            	long diff_time=0;
            	long lastnano=0;
            	PrintStream pout = null;
            	long curnano=0;
            	int[] size_buf=new int[53997];

try{
File fin= new File("movietrace.data");
DatagramSocket socket=new DatagramSocket();
FileReader fis = new FileReader(fin);
bis = new BufferedReader(fis);
InetAddress addr=InetAddress.getByName("localhost");

FileOutputStream fout =  new FileOutputStream("generator.txt");
pout = new PrintStream (fout);

while((currentLine=bis.readLine())!=null){
	StringTokenizer st = new StringTokenizer(currentLine); 
	String col1 = st.nextToken(); 
	String col2 = st.nextToken(); 
	String col3  = st.nextToken();
	String col4  = st.nextToken();
	String col5  = st.nextToken();
	String col6  = st.nextToken();
	String col7  = st.nextToken();
	int SeqNo 	= Integer.parseInt(col1);
	int Fsize 	= Integer.parseInt(col4);
	size_buf[SeqNo]=Fsize;
	pout.println(SeqNo+1+"\t"+diff_time/1000+"\t"+Fsize);
	diff_time=33000000;
	//byte[] buf=new byte[Fsize];
	//DatagramPacket packet=new DatagramPacket(buf,buf.length,addr,4444);
	
//	

}

for(int i=0;i<53997;i++){
	curnano=System.nanoTime();
	if(i!=0){
	while(curnano-diff_time<lastnano){
		curnano=System.nanoTime();
	}}
    
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
