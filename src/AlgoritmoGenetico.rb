# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

require_relative 'Cromosoma.rb'
require_relative 'Fenotipo.rb'
require_relative 'Gen.rb'

class AlgoritmoGenetico
  def initialize(populationSize, unknownsAmount, generations, fitnessFunction)
    matinPoolSize = (populationSize * 0.3).ceil
    @population = []
    @fenotipo = Fenotipo.new(unknownsAmount)
    typefitnessFunction(fitnessFunction)
    starEvolution(populationSize, generations, matinPoolSize, unknownsAmount, fitnessFunction)
  end

  def self.selectionByTournament(matinPoolSize, populationArray)
    population = Array.new(populationArray)
    winners = []
    (1..matinPoolSize).each do
      samples = population.sample(2)
      c1 = samples[0]
      c2 = samples[1]
      if c1.getFitness > c2.getFitness
        winners.push(c1)
        population.delete(c2)
      else
        winners.push(c2)
        population.delete(c1)
      end
    end
    winners
  end

  private

  def starEvolution(populationSize, generations, matinPoolSize, unknownsAmount, fitnessFunction)
    @population = startingPopulation(populationSize, unknownsAmount)
    (1..generations).each do |generation|
      case fitnessFunction
      when 'SQUARE'
        evaluateFitnessBySquareError
      when 'MAGNITUDE'
        evaluateFitnessByVectorMagnitude
      when 'DIVERSITY'
        evaluateFitnessByDiversity
      else
        evaluateFitnessBySquareError
      end
      winners = AlgoritmoGenetico.selectionByTournament(matinPoolSize, @population)
      print 'Better Fitness in Gen ', generation, ': ', @population.map { |x| x.getFitness }.max
      puts
      @population = createNewGeneration(populationSize, winners)
    end
    print 'sin respuesta'
  end

  def startingPopulation(populationSize, unknownsAmount)
    populationArray = []
    (-1..populationSize).each do
      list = []
      (0...unknownsAmount).each do |_index|
        list.push(Gen.new)
      end
      populationArray.push(Cromosoma.new(list))
    end
    populationArray
  end

  def evaluateFitnessBySquareError
    @population.each do |chromosome|
      fitness = 0
      vectorR = Fenotipo.matrixXvector(@fenotipo.getMatrixA, chromosome.getGenesArray)
      vectorR.each_with_index do |r, index|
        fitness += (r - @fenotipo.getVectorAs[index])**2
      end
      if fitness == 0
        print 'Matrix A: ', @fenotipo.getMatrixA
        puts ' '
        print 'Chromosome: ', chromosome.getGenesArray
        puts ''
        print 'Vector B: ', @fenotipo.getVectorAs
        exit
      else
        chromosome.setFitness(-fitness)
      end
    end
  end

  def evaluateFitnessByVectorMagnitude
    @population.each do |chromosome|
      fitness = 0
      vectorR = Fenotipo.matrixXvector(@fenotipo.getMatrixA, chromosome.getGenesArray)
      vectorR.each_with_index do |r, index|
        fitness += (r - @fenotipo.getVectorAs[index])**2
      end
      realFitness = -Math.sqrt(fitness).round(0)
      if realFitness == 0
        print 'Matrix A: ', @fenotipo.getMatrixA
        puts ' '
        print 'Chromosome: ', chromosome.getGenesArray
        puts ''
        print 'Vector B: ', @fenotipo.getVectorAs
        exit
      else
        chromosome.setFitness(realFitness)
      end
    end
  end

  def evaluateFitnessByDiversity
    @population.each do |chromosome|
      fitness = 0
      vectorR = Fenotipo.matrixXvector(@fenotipo.getMatrixA, chromosome.getGenesArray)
      vectorR.each_with_index do |_r, _index|
        # CHANGE FUNCTION VALIDATION By Diversity
        fitness += rand(1..100)
      end
      if fitness == 0
        print 'Matrix A: ', @fenotipo.getMatrixA
        puts ' '
        print 'Chromosome: ', chromosome.getGenesArray
        puts ''
        print 'Vector B: ', @fenotipo.getVectorAs
        exit
      else
        chromosome.setFitness(fitness)
      end
    end
  end

  def createNewGeneration(populationSize, populationWinner)
    winners = Array.new(populationWinner)
    newPopulation = []
    while newPopulation.length < populationSize
      samples = winners.sample(2)
      c1 = samples[0]
      c2 = samples[1]
      newChild = c1.uniformCrossover(c2).mutation
      newPopulation.push(newChild)
    end
    newPopulation
  end

  def typefitnessFunction(fitnessFunction)
    case fitnessFunction
    when 'SQUARE'
      puts 'fitness function SquareError: '
    when 'MAGNITUDE'
      puts 'fitness function Vector Magnitude: '
    when 'DIVERSITY'
      puts 'fitness function Diversity: '
    else
      puts 'fitness function SquareError: '
    end
  end
end
