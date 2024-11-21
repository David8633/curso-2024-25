def esta_escondida(contenedora, buscada):
    posicion, indice_buscada = 0, 0
    encontrada = False

    if len(contenedora) >= len(buscada):
        
        while posicion < len(contenedora) and not encontrada:
            
            if contenedora[posicion]==buscada[indice_buscada]:
                indice_buscada+=1


            encontrada = indice_buscada == len(buscada)
            posicion+=1

    return encontrada

assert(esta_escondida("diarios","dia")==True)