require_relative '../../src/Cromosoma.rb'
require_relative '../../src/Gen.rb'

Dado('un Cromosoma') do
  @cromosoma = Cromosoma.new([Gen.new()])
end

Entonces('es una lista de Genes') do 
 expect(@cromosoma.getGenes[0]).to be_instance_of(Gen)
end

Cuando('cuando muta un Gen') do 
 @gen  = Gen.new()
 @newCromosoma = @cromosoma.mutation(0,@gen)
end

Entonces('genera un nuevo Cromosoma') do 
 expect(@newCromosoma).to be_instance_of(Cromosoma)
end


Y('el nuevo Cromosoma contiene al Gen mutado') do
 expect(@cromosoma.getGenes[0]).to eq(@gen)
end
  