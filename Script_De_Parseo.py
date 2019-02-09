import random as rn
def parser():
    archivo = open("DatosLlenos.csv", "r")
    f = open ('fillDat.csv','w')
    cont=0
    f.write("A,B,C,D,E\n")
    for linea in archivo.readlines():
        if cont==0:
            cont+=1
        else:
            linea= linea.split(",")
            anno="2018"
            asada= linea[0]
            for i in range(1,len(linea)):
                k=codify(linea[i])
                if(k!="Error"):
                    y=linea[i].replace("\n","");
                    s= anno+","+str(i)+","+asada+","+k+","+y.upper()+"\n"
                    f.write(s)
    archivo.close()
    f.close()

def codify(s):
    s= s.upper();
    s=s.replace("\n","");
    if(s == "NO"):
        return "0"
    elif(s == "SI"):
        return "1"
    elif("%" in s):
        return "0"
    elif("." in s):
        return s
    elif(s.isdigit()):
        return s
    elif(s == "BLANCO"):
        return "0"
    else:
        return "0"

def capitalizer():
    archivo = open("AyA.csv", "r")
    f = open ('AyAR.csv','w')
    cont=0
    for linea in archivo.readlines():
        linea= linea.split(",")
        for i in range(1,len(linea)):
            s= linea[i].capitalize()
            s+=","
            f.write(s)
    archivo.close()
    f.close()

def Upcaser():
    archivo = open("DatosLlenos.csv", "r")
    f = open ('DatosLlenosUp.csv','w')
    cont=0
    for linea in archivo.readlines():
        linea= linea.split(",")
        for i in linea:
            if len(linea)<=10:
                s= i.upper()
            else:
                s = i
            s+=","
            f.write(s)
    archivo.close()
    f.close()


def Seeker():
    archivo = open("DatosLlenos.csv", "r")
    cont=0
    lista=[]
    for linea in archivo.readlines():
        linea= linea.split(",")
        for i in linea:
            s = i.upper()
            if(s not in lista):
                print(s)
                lista.append(s)
    archivo.close()


def FindEqual():
    archivo = open("Distritos_de_Costa_Rica.csv", "r")
    cont=0
    values=[]
    for linea in archivo.readlines():
        linea= linea.split(",")
        if((linea[4],linea[7]) not in values):
            values.append((linea[4],linea[7]))
        else:
            print((linea[4],linea[7]))
    archivo.close()
