# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

require_relative 'Cromosoma.rb'
require_relative 'Fenotipo.rb'
require_relative 'Gen.rb'

class AlgoritmoGenetico
  def initialize(populationSize, unknownsAmount, generations, fitnessFunction)
    @t1 = Time.now()
    matinPoolSize = (populationSize * 0.3).ceil
    @population = Array.new(populationSize)
    @fenotipo = Fenotipo.new(unknownsAmount)
    starEvolution(populationSize, generations, matinPoolSize, unknownsAmount, fitnessFunction)
  end

  def self.selectionByTournamentSquareAndDiversity(matinPoolSize, populationArray)
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

  def self.selectionByTournamentSquare(matinPoolSize, populationArray)
    population = Array.new(populationArray)
    matinPool = []
    winner = nil
    for x in 0..matinPoolSize #Cuanto % de individuos se escoge para competir, variar para observar resultados
      matinPool.push population[rand(populationArray.length)]
    end
    listFitnes = matinPool.map {|c| c.getFitness }
    maxIndex = listFitnes.index(listFitnes.max)
    winner = matinPool[maxIndex]
    return winner
  end

  private

  def self.selectionByTournamentDiversity(matinPoolSize, populationArray)
    population = Array.new(populationArray)
    matinPool = []
    winner = nil
    distances_from_others = []
    for x in 0..4 #se escogen 5 cromosomas, de cada 1 el resto son su vecinos (4)
        matinPool.push population[rand(populationArray.length)]
        distances_from_others.push 0
    end
    for z in 0..4 #para cada 1 de los 5 cromosomas...
        for w in 0..4 #se le compara con sus 4 vecinos...
            if (z != w) #que no son él mismo, naturalmente
                distances_from_others[z] += ((matinPool[z].getFitness - matinPool[w].getFitness) ** 2)
            end
        end
    end
    sort_distances = distances_from_others.sort
    for x in 0..4
        if (sort_distances[4]==distances_from_others[x])
            return matinPool[x]
        end
    end
  end

  private

  def starEvolution(populationSize, generations, matinPoolSize, unknownsAmount, fitnessFunction)
    @population = startingPopulation(populationSize, unknownsAmount)
    (1..generations).each do |generation|
      newPopulation = []
      evaluateFitnessBySquareError
      case fitnessFunction
      when 'SQUARE'
        for c in 0..populationSize
          winner1 = AlgoritmoGenetico.selectionByTournamentSquare(matinPoolSize, @population)
          winner2 = AlgoritmoGenetico.selectionByTournamentSquare(matinPoolSize, @population)
          child1 = winner1.uniformCrossover(winner2).mutation
          child2 = winner2.uniformCrossover(winner1).mutation
          if child1.getFitness > child2.getFitness
            newPopulation.push(child1)
          else
            newPopulation.push(child2)
          end
        end
        print 'Better Fitness in Gen ', generation, ': ', @population.map { |x| x.getFitness }.max
        puts
        @population = newPopulation
      when 'DIVERSITY'
        for c in 0..populationSize
          winner1 = AlgoritmoGenetico.selectionByTournamentDiversity(matinPoolSize, @population)
          winner2 = AlgoritmoGenetico.selectionByTournamentDiversity(matinPoolSize, @population)
          child1 = winner1.uniformCrossover(winner2).mutation
          child2 = winner2.uniformCrossover(winner1).mutation
          if child1.getFitness > child2.getFitness
            newPopulation.push(child1)
          else
            newPopulation.push(child2)
          end
        end
        print 'Better Fitness in Gen ', generation, ': ', @population.map { |x| x.getFitness }.max
        puts
        @population = newPopulation
      when 'DIVERSITY AND SQUARE'
        winners = AlgoritmoGenetico.selectionByTournamentSquareAndDiversity(matinPoolSize, @population)
        print 'Better Fitness in Gen ', generation, ': ', @population.map { |x| x.getFitness }.max
        puts
        @population = createNewGeneration(populationSize, winners)
      end
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
      vectorS = @fenotipo.getVectorS
      chromosomeArray = chromosome.getGenesArray
      vectorS.each_with_index do |r, index|
        fitness += (r - chromosomeArray[index])**2
      end
      realFitness = -Math.sqrt(fitness)
      if realFitness == 0
        puts
        print 'Successful !!!'
        puts
        print 'Matrix A: ', @fenotipo.getMatrixA
        puts
        print 'Chromosome: ', chromosome.getGenesArray
        puts
        print 'Vector B: ', @fenotipo.getVectorAs
        puts
        t2 = Time.now()
        time= (t2-@t1)* 1000.0
        puts "Tiempo de ejecucion en milisengudos #{time}"
        exit
      else
        chromosome.setFitness(realFitness)
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
end
