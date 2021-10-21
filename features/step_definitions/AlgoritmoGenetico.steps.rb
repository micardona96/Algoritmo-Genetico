require_relative '../../src/Cromosoma.rb'
require_relative '../../src/AlgoritmoGenetico.rb'
require_relative '../../src/Gen.rb'

Dado('una poblacion de Cromosomas con uno bueno y uno malo') do
  @cromosomaMalo = Cromosoma.new([Gen.new])
  @cromosomaBueno = Cromosoma.new([Gen.new])
  @cromosomaBueno.setFitness(-1)
  @cromosomaMalo.setFitness(-99)
  @population = [@cromosomaBueno, @cromosomaMalo]
end

Entonces('en el torneo gana el que tiene mejor Aptitud') do
  winners = AlgoritmoGenetico.selectionByTournament(1, @population)
  expect(winners).to include(@cromosomaBueno)
end
