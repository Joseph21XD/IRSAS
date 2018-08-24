archivo = open("Datos/SubXAsada.csv", "r")
f = open ('Datos/fillDat.csv','w')
cont=0
for linea in archivo.readlines():
    if cont==0:
        cont+=1
    else:
        linea= linea.split(",")
        anno="2018"
        asada= linea[0]
        for i in range(1,len(linea)):
            s= anno+","+str(i)+","+asada+","+linea[i]+"\n"
            f.write(s)
archivo.close()
f.close()
