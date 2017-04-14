import java.io.*; 
import java.util.*; 
import java.net.*;
import java.lang.*;

public class estimator_rT implements Runnable{
private int sp;
private int rp;
private int length;
private float realR;
private long realT;
private int flag;
private InetAddress addr;
//public static generator_b geb;
//public static sink_b sib;
public estimator_rT( int rp, int sp,int length){
try{
this.addr=InetAddress.getByName("localhost");
//this.geb=new generator_b(addr,100,400,1000,rp,sp);
//this.sib=new sink_b(rp,100,400);
this.rp=rp;
this.flag=0;
this.realR=0;
this.realT=0;
this.length=length;
this.sp=sp;}
catch (IOException e){
e.printStackTrace();
}

}

public synchronized float getr(){
return realR;}
public synchronized long gett(){
return realT;}
public synchronized int getf(){
return flag;}
public void run(){

long max=0;
long maxd=0;
int g=0;
int r=10;
int L=length;
while(true){
int N=(200*r)/(L);

System.out.println("sp:"+sp);
generator_rT gert=new generator_rT(addr,N,L,r,rp+g,sp);
sink_rT sirt=new sink_rT(gert,rp+g,N,L);
g++;
new Thread(gert).start();
new Thread(sirt).start();
while(sirt.getreci(2*N-1)!=1500){
}



for(int i=0;i<sirt.getlast();i++){
long dist= ((long)r*sirt.getreci(i))/1000-i*(long)L*8;
if(maxd<dist)
maxd=dist;

}
long st= (long)r*1600 -  maxd;

maxd=0;
if(st>max)
max=st;
else{
    realR=(float)r/1000;
realT=sirt.getreci(0);
flag=1;
break;
}
r=r+10;
}



}}
