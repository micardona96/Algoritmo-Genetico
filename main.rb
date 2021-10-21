#!/usr/bin/env ruby
# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

require_relative './src/AlgoritmoGenetico.rb'

FitnessFunction = Struct.new(:square, :magnitude, :diversity)
fitnessFunction = FitnessFunction.new('SQUARE', 'MAGNITUDE', 'DIVERSITY')

AlgoritmoGenetico.new(populationSize = 10, unknowns = 3, generations = 100, fitnessFunction.square)
