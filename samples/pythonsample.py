#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Sep 14 18:13:38 2019

@author: averysimon
"""

import csv
import numpy as np
def clean_data():
    try:
        start_file=open('keplerData_CSV.csv','r')
    except:
        print("File unreachable.")
    else:
        reader=csv.reader(start_file,delimiter=' ',skipinitialspace=True) 
        end_file=open('CLEAN_keplerData.csv','w')
        writer=csv.writer(end_file,delimiter=",")
        loopNum=1 #keeping track of how many lines of the original file have been read/written (important because I only used lines 32-3032)
        l=0 #keeping track of the number of lines actually written into the new file
        for row in reader:
            output=[] #creating blank array for the newly parsed data to go into
            if loopNum>3032: #break the for loop when I have reached 3000 lines of data 
                break
            elif row[0].split(',')[0]!='#' and row[0][1]!=',,': #using conditionals to ignore the header on the original data file 
                if l==0:
                    output=['Row #','KOI ID','KOI Name','Transit Period [days]','Transit Epoch [BKJD]','Transit Depth [ppm]','Host Star Relative Probability','Host Star a Priori Background Probability','Host Star Relative Probability Source Flag', 'Host Star Probability Usability Score']
                    #line above is changing the title of each column to be more understood by reader
                    l=l+1
                else:
                    for i in list(range(len(row[0].split(',')))): #looping through the length of the data rows separated by comma (because the original rows of data were being written into the new file  under one column)
                        output.append([row[0].split(',')[i]]) #adding each column of each row of data as an array within the output array
                        if i==8 and output[i]==['FAILED']: #using conditionals to isolate all of the failed trials in the 8th column to change the contents of the cell
                            output[i]=['FAIL'] #changing the contents of the cell from 'FAILED' to 'FAIL'
                        if output[i]==['']:
                            output[i]=[np.nan] #changing any cells left blank to have the value nan (a value for unexisting data in python so as to not skew the data)
                        output[i]=output[i][0] #the above code made an array of arrays, so this line of code removes one layer of the array depth so that the output array is one dimensional
                loopNum=loopNum+1 
                writer.writerow(output[0:10]) #writing the values of the output array into the new file, not including columns 11-26
                l=l+1
        end_file.close() #closing new file
        start_file.close() #closing original file
        print("Lines written: ",l) #printing the amount of rows in the new data file
clean_data()