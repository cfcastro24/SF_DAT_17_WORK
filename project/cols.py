from sys import argv
import sys, csv

script, filename = argv
txt = open(filename)
tables=[]
with open(filename,'rb') as csvfile:
    # Loop over each line in the file.
    csvreader = csv.reader(csvfile, delimiter=',', quotechar='"')
    for line in csvreader:
        #cols = line.replace("\"", "").split(",")
        #print line
        #print line[0]
        if line[0].startswith("Column") or line[0]=='':
            pass
        #elif line.startswith("C"):
        elif line[0].startswith("C"):
            tables.append(line[0].lower())
            print ");\ncreate table prod_%s (" % line[0].lower()
        else:
            print "%s %s," % (line[0], line[1])
            pass 

for x in tables:
    print "copy prod_%s from '/Users/ccastro/charlie_dev/SF_DAT_17_WORK/project/data/llantas/%s.asc' USING DELIMITERS '|' WITH NULL AS 'null';" % (x,x)
