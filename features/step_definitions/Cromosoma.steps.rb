require_relative '../../src/Cromosoma.rb'
require_relative '../../src/Gen.rb'

Dado('un Cromosoma') do
  @cromosoma = Cromosoma.new([Gen.new, Gen.new, Gen.new, Gen.new])
end

Entonces('es una lista de Genes') do
  expect(@cromosoma.getGenes).to be_kind_of(Array)
end

Cuando('cuando muta un Gen') do
  @nuevoCromosoma = @cromosoma.mutation
end

Cuando('cuando se cruza con otro Cromosoma') do
  @cromosoma2 = Cromosoma.new([Gen.new, Gen.new,Gen.new, Gen.new])
  @nuevoCromosoma = @cromosoma.uniformCrossover(@cromosoma2)
end

Entonces('genera un nuevo Cromosoma') do
  expect(@nuevoCromosoma).to be_instance_of(Cromosoma)
end

Entonces('ademas son diferentes') do
  expect(@nuevoCromosoma).not_to eq(@cromosoma)
end
