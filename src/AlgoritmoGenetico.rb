# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

require_relative 'Cromosoma.rb'
require_relative 'Fenotipo.rb'
require_relative 'Gen.rb'

class AlgoritmoGenetico
  def initialize(populationSize, unknownsAmount, generations, matinPoolSize)
    @population = []
    @fenotipo = Fenotipo.new(unknownsAmount)
    starEvolution(populationSize, generations, matinPoolSize, unknownsAmount)
  end

  private

  def starEvolution(populationSize, generations, matinPoolSize, unknownsAmount)
    @population = startingPopulation(populationSize, unknownsAmount)
    (1..generations).each do
      # agregamos la aptitud a los cromosomas DEFAULT SQUARE
      evaluateFitnessBySquareError
      # Seleccion por Torneo
      winners = selectionByTournament(matinPoolSize)
      @population = createNewGeneration(populationSize, winners)
    end
    print "sin respuesta"
  end

  def startingPopulation(populationSize, unknownsAmount)
    populationArray = []
    list = []
    (0...unknownsAmount).each do |_index|
      list.push(Gen.new)
    end
    (1..populationSize).each do
      populationArray.push(Cromosoma.new(list))
    end
    populationArray
  end

  def evaluateFitnessBySquareError
    @population.each do |chromosome|
      fitness = 0
      @fenotipo.getVectorS.each_with_index do |r, index|
        fitness += (r - chromosome.getGenes[index].getAlelo)**2
      end
      if (-Math.sqrt(fitness).round(0) == 0)
        print "Chromosome OP: "
        print chromosome.getGenes
        exit
      end
      chromosome.setFitness(-Math.sqrt(fitness).round(0))
    end
  end

  def selectionByTournament(matinPoolSize)
    winners = []
    (1..matinPoolSize).each do
      c1 = @population.sample
      c2 = @population.sample
      winners.push(c1.getFitness > c2.getFitness ? c1 : c2)
    end
    winners
  end

  def createNewGeneration(populationSize, winners)
    newPopulation = []
    (1..populationSize).each do
      c1 = winners.sample
      c2 = winners.sample
      newPopulation.push(c1.uniformCrossover(c2).mutation)
    end
    newPopulation
  end
end
