

path ="2018_python\\Day_3\\input_test.txt"

def uredi_podatke():
    '''
        Uredi input podatke v seznam podatki [x,y,a].  
        x - oddaljenost levi rob,
        y - oddaljenost zgornji rob,
        a - velikost kvadrata.
    '''
    podatki = []
    with open(path, 'r') as file:
        for line in file:
            [_, uporabno] = line.strip().split('@')
            [_, lokacija, velikost] = uporabno.split(" ")
            a = int(velikost.split("x")[0])
            [x, y] = lokacija[:-1].split(",")
            podatki.append([int(x), int(y), a])            
    return podatki

def maksimalni_kvadrat(podatki):
    '''Določi maksimalen pravokotnik.'''
    l = 0
    h = 0
    for (x,y,a) in podatki:
        if y+a > h:
            h = y+a
        if x+a > l:
            l = x+a
    return l,h

def grid(l,h):
    '''Ustvari prazno mrežo lxh.'''
    mreza = []
    for i in range(h):
        mreza.append([0]*l)
    return mreza

def mark(x,y,a,mreza):
    '''Oznaci polje v mrezi.'''
    for i in range(0,a):
        for j in range(0,a):
            mreza[y+i][x+j] += 1
    return

def count(mreza):
    '''Presteje prekrivajoča se mesta mreze.'''
    rezultat = 0
    for vrsta in mreza:
        #narobe šteje tukaj je napaka
        rezultat += sum([1 for x in vrsta if x > 1])
    return rezultat

def glavni():
    podatki = uredi_podatke()
    (l,h) = maksimalni_kvadrat(podatki)
    mreza = grid(l,h)
    for (x,y,a) in podatki:
        mark(x,y,a,mreza)
    return count(mreza)
#--------------

print(glavni())
# podatki = uredi_podatke()
# print(maksimalni_kvadrat(podatki))