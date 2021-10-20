#language: es

Característica: Verificar el funcionamiento del Fenotipo

Escenario: Verificar que se cree correctamente una matriz en el Fenotipo
    Dado un nuevo Fenotipo
    Entonces se crea una nueva matrixA

Escenario: Verificar que se cree correctamente un vector en el Fenotipo
    Dado un nuevo Fenotipo
    Entonces se crea un nuevo vectorS

Escenario: Verificar que se multipliquen correctamente una matrix x vector en el Fenotipo
    Dado un nuevo Fenotipo
    Entonces se crea un nuevo vectorAs

Escenario: Verificar sistema de dos ecuaciones 
    Dado un sistema de ecuaciones representado por la matriz A y un vector x
    Entonces multipico Ax obtengo B