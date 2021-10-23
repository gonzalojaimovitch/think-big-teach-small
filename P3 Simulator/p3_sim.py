import time
def runP3(input, program):

  start_time = time.time()

  inList = []
  progList = []

  inPointer = 0
  progPointer = 0

  output = ''

  #Check if the given values are correct
  checkInput(input)
  checkProgram(program)

  #Create lists
  if input == '':
    inList = ['.']
  else:
    inList = list(input)
  progList = list(program)

  #Initialize pointers
  inPointer = 0
  progPointer = 0

  #Initialize left-padding controller
  leftpad = False

  while(True):
    if (time.time() - start_time) > 10:
      return "TIMEOUT"
    #Check if program ends
    if progPointer > (len(progList)-1):
      return output
    pointedOp = progList[progPointer]

    #Choose Instruction
    if pointedOp == "<":
      if inPointer > 0:
        inPointer = inPointer - 1
      elif leftpad == False:
        #Not necessary to change the pointer since it will stay as 0
        inList.insert(0,'.')
        leftpad = True
      else:
        progPointer = len(progList)
      progPointer = progPointer + 1

    elif pointedOp == ">":
      if inPointer < (len(inList) - 1):
        inPointer = inPointer + 1
      else:
        inList.append('.')
        inPointer = inPointer + 1
      progPointer = progPointer + 1

    elif pointedOp == "+":
      val = inList[inPointer]
      if val == '0':
        inList[inPointer]='1'
      elif val == '1':
        inList[inPointer]='.'
      else: inList[inPointer]='0'
      progPointer = progPointer + 1

    elif pointedOp == "-":
      val = inList[inPointer]
      if val == '0':
        inList[inPointer]='.'
      elif val == '1':
        inList[inPointer]='0'
      else: inList[inPointer]='1'
      progPointer = progPointer + 1

    elif pointedOp == "o":
      if inList[inPointer] != '.':
        output = output + inList[inPointer]
      else:
        progPointer = len(progList)
      progPointer = progPointer + 1

    elif pointedOp == "[":
      if inList[inPointer] == '.':
        cond = len(progList)
        midloop = 0
        i = (progPointer + 1)
        while i < cond:
          if progList[i] == "]":
            if midloop == 0:
              progPointer = i
              cond = i
            else:
              midloop = midloop - 1
          elif progList[i] == "[":
            midloop = midloop + 1
          i = i + 1
      else:
        progPointer = progPointer + 1
        
    elif pointedOp == "]":
      if inList[inPointer] != '.':
        cond = -1
        midloop = 0
        i = (progPointer - 1)
        while i > cond:
          if progList[i] == "[":
            if midloop == 0:
              progPointer = i
              cond = i
            else:
              midloop = midloop - 1
          elif progList[i] == "]":
            midloop = midloop + 1
          i = i - 1
      else:
        progPointer = progPointer + 1


def checkInput(string):
  alphabet = {'1','0','.'};
  for c in string:
    if c not in alphabet:
      print("Incorrect input")
      exit()

def checkProgram(string):
  operators = {'<','>','+','-','o','[',']'}
  for c in string:
    if c not in operators:
      print("Incorrect program")
      exit()