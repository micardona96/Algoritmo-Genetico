#!/usr/bin/env ruby
# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

require_relative './src/AlgoritmoGenetico.rb'

FitnessFunction = Struct.new(:square, :magnitude, :diversity)
fitnessFunction = FitnessFunction.new('SQUARE', 'MAGNITUDE', 'DIVERSITY')


AlgoritmoGenetico.new(populationSize = 100, unknowns = 5, generations = 5000, matinPoolSize = 20, fitnessFunction.diversity)

# AlgoritmoGenetico.new(populationSize = 100, unknowns = 3, generations = 5000, matinPoolSize = 20, fitnessFunction.square)

# AlgoritmoGenetico.new(populationSize = 100, unknowns = 3, generations = 5000, matinPoolSize = 20, fitnessFunction.diversity)
