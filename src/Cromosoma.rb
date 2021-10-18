# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

require_relative 'Gen.rb'

class Cromosoma
  def initialize(genes)
    @genes = genes
  end

  # retorna un nuevo Cromosoma con un gen random mutado
  def mutation
    newGenes = Array.new(@genes)
    select_random_gen = rand(0...@genes.length)
    newGenes[select_random_gen] = Gen.new
    self.class.new(newGenes)
  end

  def getGenes
    @genes
  end
end
