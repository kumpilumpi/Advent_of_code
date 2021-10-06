
path = "2018_python\\Day_1\\1_input.txt"

frekfenca = 0

def operacija(line):
    return (int(line[1:]) if line[0] == "+" else -int(line[1:]))

with open(path, 'r') as file:
        for line in file:
            frekfenca += operacija(line)

print(frekfenca)
