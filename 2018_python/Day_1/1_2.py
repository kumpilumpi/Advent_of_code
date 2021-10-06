path = "2018_python\\Day_1\\1_input.txt"

frekfenca = 0

def predEle(line):
    return (int(line[1:]) if line[0] == "+" else -int(line[1:]))
    
def predSez(sez):
    predSez = []
    for element in sez:
        predSez.append(predEle(element))
    return predSez

def odgovor(sez):
    frekfenca = 0;
    sezFrek = [0]
    while True:
        for ele in sez:
            frekfenca += ele
            if frekfenca in sezFrek:
                return frekfenca
            else:
                sezFrek.append(frekfenca)
        print (frekfenca)




with open(path, 'r') as file:
        print(odgovor( predSez(file.readlines())))
