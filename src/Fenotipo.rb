# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

require_relative 'Gen.rb'
require_relative 'Cromosoma.rb'

class Fenotipo
  def initialize(size)
    @matrixA = createMatrix(size)
    @vectorS = createVector(size)
    @vectorAs = Fenotipo.matrixXvector(@matrixA, @vectorS)
  end

  def getMatrixA
    @matrixA
  end

  def getVectorS
    @vectorS
  end

  def getVectorAs
    @vectorAs
  end

  # Crea un vector multiplicando una matrix por un vector
  def self.matrixXvector(matrix, vector)
    size = vector.length
    vectorResult = []
    (0...size).each do |i|
      temp = 0
      (0...size).each do |j|
        temp += matrix[i][j] * vector[j]
      end
      vectorResult.push(temp)
    end
    vectorResult
  end

  private

  # Crea una matriz con valores aleatorios
  def createMatrix(size)
    matriz = []
    (0...size).each do |_i|
      row = []
      (0...size).each do |_j|
        row.push(rand(-10.0..10.0).round(0))
      end
      matriz.push(row)
    end
    matriz
  end

  # Crea un vector con valores aleatorios
  def createVector(size)
    vector = []
    (0...size).each do |i|
      vector[i] = rand(-10.0..10.0).round(0)
    end
    vector
  end
end
