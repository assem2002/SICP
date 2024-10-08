import sys
import os

def create_file(line): 
    file_name = "str"
    if ("+" in line):
        file_name = line + ".scm"
    else:
        file_name = line[0:8] + ".scm"
    if('\n' in file_name) :
        file_name = str(file_name).replace('\n','')

    return open(file_name, "w")



def main():
    file_to_read = open("Sicp_Exercises_all (Till ex 3.70).scm",'r',)
    opened_file = None
    while True:
        line = file_to_read.readline()
        if line == "":
            break
        elif line[0:4] == "----":
            continue
        elif line[0:2] == "ex" and (line[2] == " " or line[2].isdigit()):
            if(opened_file):
                opened_file.close()
            opened_file = create_file(line)
        else :
            opened_file.write(line)
    file_to_read.close()

main()
    
