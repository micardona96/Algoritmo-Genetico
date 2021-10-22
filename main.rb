#!/usr/bin/env ruby
# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

require_relative './src/AlgoritmoGenetico.rb'

MethodFunction = Struct.new(:square, :diversity, :diversity_and_square)
methodFunction = MethodFunction.new('SQUARE', 'DIVERSITY', 'DIVERSITY AND SQUARE')

puts "Seleccione un metodo:"
puts "1:(square)"
puts "2:(diversity)"
puts "3:(diversity_and_square)"
methodChoosen = gets.chomp
case methodChoosen
when "1"
    method = methodFunction.square
when "2"
    method = methodFunction.diversity
when "3"
    method = methodFunction.diversity_and_square
end
puts "Seleccione cantidad de ecuaciones e incognitas"
n = gets.chomp
AlgoritmoGenetico.new(populationSize = 100, unknowns = n.to_i, generations = 5000, method)
