import java.io.*;
import java.net.*;
public class sink{
  public static void main(String[] args){
	  PrintStream pout = null;
	  PrintStream pout1 = null;

	  PrintStream pout2 = null;

	  try{
		  DatagramSocket socket=new DatagramSocket(4445);
		  byte [] buf=new byte[2000];
		  DatagramPacket p=new DatagramPacket(buf,buf.length);
		  
		  FileOutputStream fout =  new FileOutputStream("sink.txt");
		  pout = new PrintStream (fout);

		   FileOutputStream fout1 =  new FileOutputStream("sink1.txt");
		  pout1 = new PrintStream (fout1);

		   FileOutputStream fout2 =  new FileOutputStream("sink2.txt");
		  pout2 = new PrintStream (fout2);

		  
		  int seqNo=1;
		  int seqNo1=1;
		  int seqNo2=1;


		  long last_time=0;
		  long time_diff=0;
		  long time_diff1=0;
		long time_diff2=0;

		  long cur_time=0;
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

			  if(seqNo2==1)
				  time_diff2=0;
			  else{
				  cur_time=System.nanoTime();
				  time_diff2=(cur_time-last_time)/1000;
			  }

			  
			  last_time=System.nanoTime();
			  //cur_time=System.nanoTime();
			  byte source = p.getData()[0];
			  if(source == (byte)1){
			  	pout.println(seqNo+"\t"+time_diff+"\t"+p.getLength());
			  	seqNo++;
			  }
			   if(source == (byte)2){
			  	pout1.println(seqNo+"\t"+time_diff1+"\t"+p.getLength());
			  	seqNo1++;
			  }

			    if(source == (byte)3){
			  	pout2.println(seqNo+"\t"+time_diff2+"\t"+p.getLength());
			  	seqNo2++;
			  }

		  }
	  }
	  catch (IOException e) {  
			// catch io errors from FileInputStream or readLine()  
			System.out.println("IOException: " + e.getMessage());  
		}
		finally{
					pout.close();
					pout1.close();
					pout2.close();

			}
  }}
