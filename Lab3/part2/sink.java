import java.io.*;
import java.net.*;
public class sink{
  public static void main(String[] args){
	  PrintStream pout = null;
	  PrintStream pout1 = null;
	  try{
		  DatagramSocket socket=new DatagramSocket(4445);
		  byte [] buf=new byte[65507];
		  DatagramPacket p=new DatagramPacket(buf,buf.length);
		  
		  FileOutputStream fout =  new FileOutputStream("sink_pos.txt");
		  pout = new PrintStream (fout);

		  FileOutputStream fout1 =  new FileOutputStream("sink_video.txt");
		  pout1 = new PrintStream (fout1);

		  int seqNo=1;
		  long last_time=0;
		  long time_diff=0;
		  long cur_time=0;

		  int seqNo1 = 1;
		  long time_diff1=0;
		  while(true){
			  socket.receive(p);
			  if(seqNo==1)
				  time_diff=0;
			  else{
				  cur_time=System.nanoTime();
				  time_diff=(cur_time-last_time)/1000;
			  }
			  if(seqNo1==1)
				  time_diff1=0;
			  else{
				  cur_time=System.nanoTime();
				  time_diff1=(cur_time-last_time)/1000;
			  }

			  last_time=System.nanoTime();
			  //cur_time=System.nanoTime();
			  byte source = p.getData()[0];
			  if(source == (byte)1){
			  	pout.println(seqNo+"\t"+time_diff+"\t"+p.getLength());
			  	seqNo++;
			  }
			  if(source == (byte)2){
			  	pout1.println(seqNo1+"\t"+time_diff1+"\t"+p.getLength());
			  	seqNo1++;
			  }
			  
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
