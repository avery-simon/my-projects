import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class DNA{
    public static void main(String[] arr){
        Scanner in=new Scanner(System.in);
        String target=in.nextLine();
        int k=Integer.parseInt(in.nextLine());
        String[] tiles=new String[k+1];
        tiles[k]="";
        for (int i=0;i<k;i++){
            tiles[i]=in.nextLine();
        }
        int[][] data=new int[k+1][target.length()+1];
        for (int i=0;i<k+1;i++){
            for (int j=1;j<target.length()+1;j++){
                data[i][j]=-1;
            }
        }
        for (int j=0;j<target.length()+1;j++){
            for (int i=0;i<k;i++){
                if (data[i][j]!=-1){
                     //String remtar=target.substring(j);
                    String t=tiles[i];
                    //if ((remtar.length()>=t.length()) && (t.equals(remtar.substring(0,t.length())))){
                    if (t.regionMatches(0,target,j,t.length())){
                        if ((data[i+1][j+t.length()]>=data[i][j]+1)||(data[i+1][j+t.length()]==-1)){
                            data[i+1][j+t.length()]=data[i][j]+1;
                        }
                    }
                    if ((data[i+1][j]>=data[i][j])||(data[i+1][j]==-1)){
                            data[i+1][j]=data[i][j];
                }
            }
        }
    }
            
    int[] output=new int[data[k][target.length()]+1];
        if (data[k][target.length()]!=-1){
            output[0]=data[k][target.length()];
        }
        else{
            System.out.print(0);
            return;
        }

    int i=k;
    int j=target.length();
    int n=output[0];

    while (i>0 && j>0){
        if (data[i-1][j]!=data[i][j]){
            output[n]=i;
            n=n-1;
            i=i-1;
            j=j-tiles[i].length();
        }
        else{
            i=i-1;
        }
    }
    for (int x=0;x<output.length;x++){
        System.out.print(output[x]+" ");
    }     
    }
}

