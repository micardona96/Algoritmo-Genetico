# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

require_relative 'Gen.rb'

class Cromosoma
  def initialize(genesList)
    @genes = genesList
    @fitness = -999
  end

  # retorna un nuevo Cromosoma con un gen random mutado
  def mutation
    nuevosGenes = Array.new(@genes)
    @genes.sample.inherit(Gen.new.getAlelo)
    self.class.new(nuevosGenes)
  end

  # retorna un nuevo Cromosoma creado apartir de un Cruce uniforme con otro Cromosoma
  def uniformCrossover(cromosoma)
    genesPadre = Array.new(cromosoma.getGenes)
    nuevosGenes = Array.new(@genes)
    nuevosGenes.each_with_index do |_gen, index|
      if %w[padre madre].sample == 'padre'
        genPadre = genesPadre[index]
        nuevosGenes[index].inherit(genPadre.getAlelo)
      end
    end
    self.class.new(nuevosGenes)
  end

  def getGenes
    @genes
  end

  def getGenesArray
    @genes.map { |gen| gen.getAlelo }
  end

  def setFitness(value)
    @fitness = value
  end

  def getFitness
    @fitness
  end
end
