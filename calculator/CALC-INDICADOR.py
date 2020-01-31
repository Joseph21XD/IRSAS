import math

dicotomicas = [1, 2, 3, 4, 7, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 25, 26]
dicotomica = {"SI": 0, "NO": 1}
dicotomica_inversa = {"SI": 1, "NO": 0}
nominal = {"0": 0.000, "=100": 1.000, ">50": 0.650, "<50": 0.350, ">10": 0.500, "<10": 0.000, ">40": 0.600, "<40": 0.300}
lineal = {"5": {"pendiente": 9.461, "ordenada": -4.730}, "6": {"pendiente": 0.095, "ordenada": -4.730}, "8": {"pendiente": -7.095, "ordenada": 5.676}, "9": {"pendiente": 0.020, "ordenada": -5.522}, "10": {"pendiente": 0.002, "ordenada": -4.663}, "14": {"pendiente": -0.057, "ordenada": 14.191}, "22": {"pendiente": -14.191, "ordenada": 4.257}, "23": {"pendiente": -14.191, "ordenada": 4.257}, "24": {"pendiente": 0.142, "ordenada": -7.095}}

respuestas = []
for i in range (30):
    respuestas += [input ().strip ().upper ()]

for i in range (30):
    if respuestas[i] == "":
        print ()
    elif str (i + 1) in lineal:
        temp = None
        if respuestas[i] in nominal:
            temp = nominal[respuestas[i]]
        else:
            temp = float (respuestas[i])
        exp = temp * lineal[str (i + 1)]["pendiente"] + lineal[str (i + 1)]["ordenada"]
        print ("{:.3f}".format (1 / (1 + math.exp (exp))))
    elif i + 1 in dicotomicas:
        print (dicotomica[respuestas[i]])
    else:
        print (dicotomica_inversa[respuestas[i]])


