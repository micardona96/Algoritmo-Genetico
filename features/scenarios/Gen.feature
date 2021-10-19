#language: es

Característica: Verificar el comportamiento de los objetos Gen

Escenario: Verificar que un Gen tenga alelos
    Cuando se crea un nuevo Gen sin herencia
    Entonces se cre un alelo entre (-10,10)

Escenario: Verificar que un Gen pueda heredar alelos
    Dado un nuevo Gen que heredara un alelo
    Cuando recibe la herencia
    Entonces el nuevo Gen tendra el mismo alelo heredado

