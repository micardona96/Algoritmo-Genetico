require_relative '../../src/Fenotipo.rb'

Dado('un nuevo Fenotipo') do
  @fenotipo = Fenotipo.new(3)
end

Entonces('se crea una nueva matrixA') do
  expect(@fenotipo.getMatrixA[0]).to be_kind_of(Array)
end

Entonces('se crea un nuevo vectorS') do
  expect(@fenotipo.getVectorS).to be_kind_of(Array)
end

Entonces('se crea un nuevo vectorAs') do
  expect(@fenotipo.getVectorAs).to be_kind_of(Array)
end
