require_relative '../../src/Cromosoma.rb'
require_relative '../../src/Gen.rb'

Dado('un Cromosoma') do
  @cromosoma = Cromosoma.new([Gen.new(), Gen.new()])
end

Entonces('es una lista de Genes') do 
 expect(@cromosoma.getGenes[0]).to be_instance_of(Gen)
end

Cuando('cuando muta un Gen') do 
  @newCromosoma = @cromosoma.mutation
end

Entonces('genera un nuevo Cromosoma') do 
 expect(@newCromosoma).to be_instance_of(Cromosoma)
end

Entonces('ademas son diferentes') do 
 expect(@newCromosoma).not_to eq(@cromosoma)
end

