#language: es

Característica: Verificar el comportamiento de los objetos Cromosoma

Escenario: Verificar que un Cromosoma sea una lista de Genes
    Dado un Cromosoma
    Entonces es una lista de Genes

Escenario: Verificar que un Cromosoma pueda mutar
    Dado un Cromosoma
    Cuando cuando muta un Gen
    Entonces genera un nuevo Cromosoma
    Y el nuevo Cromosoma contiene al Gen mutado


