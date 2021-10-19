#!/usr/bin/env ruby
# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

require_relative './src/AlgoritmoGenetico.rb'

AlgoritmoGenetico.new(populationSize=100, unknowns=3, generations=50000, matinPoolSize=50)