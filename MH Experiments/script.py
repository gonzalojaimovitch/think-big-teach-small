import os
from shutil import copyfile
from datetime import datetime

#First, the required information will be prepared

numConcepts = 8
numBatches = 3
batchNames = ["WS", "R1", "R2"]

path = "TO COMPLETE"

witnessSets = [[('0', '0')],[('10', '0')],[('', '0'), ('01', '')],[('0', '011')],[('', '1'), ('1110', '')],[('0', '10'), ('00', '')],[('', '0'), ('0', ''), ('00', '0')],[('', '01'), ('01', ''), ('1', '')]]
teachingSets1 = [[('111001', '1'), ('110101', '1')],[('01000', '1'), ('01010', '1')],[('010100', ''), ('10101', '1')],[('10', '1'), ('001', '011')],[('10', '1'), ('111001', '')],[('11', '01'), ('10', '')],[('0001', '0'), ('01', '1')],[('11', ''), ('011', '')]]
teachingSets2 = [[('100110', '1'), ('111100', '1'), ('01010', '0')],[('001', '0'), ('00', '0'), ('1011', '0')],[('010', ''), ('100', '1'), ('011101', '')],[('0001', '011'), ('00', '011'), ('000', '011')],[('11', '1'), ('0001', '0'), ('11100', '')],[('', '1'), ('101', ''), ('000', '')],[('0101', '1'), ('0010', '0'), ('0110', '1')],[('10', ''), ('0100', ''), ('0', '0')]]


#The directory MHexperiment stores 8 folders (1, 2, ..., 8) where the files required for launching MagicHaskeller will be created
def createFiles():
  for c in range(0, numConcepts):
    f = open(path + str(c + 1) + "/in_MH_WS.txt", 'a')
    for w in range(0, len(witnessSets[c])):
      f.write("f " + '"' + witnessSets[c][w][0] + '"' + " == " + '"' + witnessSets[c][w][1] + '"' + " ")
      if w < (len(witnessSets[c])-1):
        f.write("&& ")
    f.close()

    copyfile(path + str(c + 1) + "/in_MH_WS.txt", path + str(c + 1) + "/in_MH_R1.txt")

    f = open(path + str(c + 1) + "/in_MH_R1.txt", 'a')
    f.write("&& ")
    for t1 in range(0, len(teachingSets1[c])):
      f.write("f " + '"' + teachingSets1[c][t1][0] + '"' + " == " + '"' + teachingSets1[c][t1][1] + '"' + " ")
      if t1 < (len(teachingSets1[i])-1):
        f.write("&& ")
    f.close()

    copyfile(path + str(c + 1) + "/in_MH_R1.txt", path + str(c + 1) + "/in_MH_R2.txt")


    f = open(path + str(c + 1) + "/in_MH_R2.txt", 'a')
    f.write("&& ")
    for t2 in range(0, len(teachingSets2[c])):
      f.write("f " + '"' + teachingSets2[c][t2][0] + '"' + " == " + '"' + teachingSets2[c][t2][1] + '"' + " ")
      if t2 < (len(teachingSets2[c])-1):
        f.write("&& ")
    f.close()


    f = open(path + str(c + 1) + "/out_MH_WS.txt", 'x')
    f = open(path + str(c + 1) + "/out_MH_R1.txt", 'x')
    f = open(path + str(c + 1) + "/out_MH_R2.txt", 'x')
    f = open(path + str(c + 1) + "/log_WS.txt", 'x')
    f = open(path + str(c + 1) + "/log_R1.txt", 'x')
    f = open(path + str(c + 1) + "/log_R2.txt", 'x')


def runMHexperiment():
  for c in range(0, numConcepts):
    for b in range(0, numBatches):
      query = "/home/user/.cabal/bin/MagicHaskeller -i < " + path + str(c + 1) + "/in_MH_" + batchNames[b] + ".txt 1> " + path + str(c + 1) + "/out_MH_" + batchNames[b] + ".txt 2> " + path + str(c + 1) + "/log_" + batchNames[b] + ".txt"
      print(query)
      print(datetime.now().strftime("%H:%M:%S"))
      os.system(query)

createFiles()
runMHexperiment()
