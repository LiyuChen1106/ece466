import java.io.*;
import java.net.*;
public class sink{
  public static void main(String[] args){
	  PrintStream pout = null;
	  try{
		  DatagramSocket socket=new DatagramSocket(4444);
		  byte [] buf=new byte[200];
		  DatagramPacket p=new DatagramPacket(buf,buf.length);
		  
		  FileOutputStream fout =  new FileOutputStream("sink.txt");
		  pout = new PrintStream (fout);
		  
		  int seqNo=1;
		  long last_time=0;
		  long time_diff=0;
		  long cur_time=0;
		  while(true){
			  socket.receive(p);
			  if(seqNo==1)
				  time_diff=0;
			  else{
				  cur_time=System.nanoTime();
				  time_diff=(cur_time-last_time)/1000;
			  }
			  
			  last_time=System.nanoTime();
			  //cur_time=System.nanoTime();
			  pout.println(seqNo+"\t"+time_diff+"\t"+p.getLength());
			  seqNo++;
		  }
	  }
	  catch (IOException e) {  
			// catch io errors from FileInputStream or readLine()  
			System.out.println("IOException: " + e.getMessage());  
		}
		finally{
					pout.close();

			}
  }}
