#language: es

Característica: Verificar el comportamiento de los objetos Cromosoma

Escenario: Verificar que un Cromosoma sea una lista de Genes
    Dado un Cromosoma
    Entonces es una lista de Genes

Escenario: Verificar que un Cromosoma pueda mutar
    Dado un Cromosoma
    Cuando muta un Gen
    Entonces genera un nuevo Cromosoma
    Y ademas son diferentes

Escenario: Verificar que un Cromosoma puede cruzarse con otro
    Dado un Cromosoma
    Cuando se cruza con otro Cromosoma
    Entonces genera un nuevo Cromosoma


