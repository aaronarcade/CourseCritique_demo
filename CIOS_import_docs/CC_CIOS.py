import csv, pprint
arc_caps = {}

"""
------------------------------------------------------
CC header values:
[1] profID - - - "ABDELFATTAHHEBA"
[2] courseID - - - "ARBC2813"
[3] Course - - - "ARBC 2813"
[4] Section - - - "GG"
[5] Year - - - "Spring 2018"
[6] Prof - - - "Abdelfattah, Heba"
[7] ProfMiddle - - - "M"
[8] A - - - "63"
[9] B - - - "25"
[10] C - - - "13"
[11] D - - - "2"
[12] F - - - "0"
[13] W - - - "2"
[14] Size - - - "Very Small (Fewer than 10 students)"
[15] Level - - - "Undergraduate"
[16] GPA - - - "3.2"
[17] Index - - - "254776"
------------------------------------------------------
CIOS header values:
[1] CIOS CRN - - - "31035201802*22100201802"
[2] CRN - - - "31035201802"
[3] Course Semester - - - "201802"
[4] Teacher Firs Name - - - "Gregory"
[5] Teacher Last Name - - - "Abowd"
[6] School Teacher ID - - - "ga21"
[7] Dept - - - "PSYC"
[8] CourseNum - - - "3750"
[9] CourseSection - - - "B"
[10] Tot - - - "67"
[11 ... 37] - - - CIOS response data
------------------------------------------------------
"""
CC = {}
CIOS = {}

with open('CC.csv', 'r') as csvfile:
    reader = csv.reader(csvfile)
    next(reader)
    for row in reader:
        date = row[4]
        if date[:-5]=="Spring":
            date = date[-4:]+"02"
        elif date[:-5]=="Fall":
            date = date[-4:]+"08"
        elif date[:-5]=="Summer":
            date = date[-4:]+"05"
        name = row[5].split(", ")
        info = row[1]+date+name[0]+name[1]+row[3]
        CC[info] = row[16]


with open('CIOS.csv', 'r') as csvfile:
    reader = csv.reader(csvfile)
    next(reader)
    for row in reader:
        course = row[6]+row[7]
        info = course+row[2]+row[4]+row[3]+row[8]
        CIOS[info] = row[1]


CCC = "INSERT INTO CIOS_CC_IDs_table (CC_ID, CIOS_ID)"+"\n"+"VALUES "

for x in CC:
    if x in CIOS.keys():
        CCC += "("+CC[x]+", "+CIOS.get(x)+"), "+"\n"
CCC = CCC[:-3] + ";"

f = open("insert.sql","w")
f.write(CCC)
f.close()
print("----SUCCESS----")
