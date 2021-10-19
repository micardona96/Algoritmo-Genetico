require_relative '../../src/Gen.rb'

Dado('un nuevo Gen que heredara un alelo') do
  @gen = Gen.new()
  @herencia = 1
end

Cuando('recibe la herencia') do
  @gen.inherit(@herencia)
end

Entonces('el nuevo Gen tendra el mismo alelo heredado') do
   expect(@gen.getAlelo).to eq(@herencia)
end


Cuando('se crea un nuevo Gen sin herencia') do
   @gen = Gen.new()
end


Entonces('se cre un alelo entre \({int},{int})') do |int, int2|
 expect(@gen.getAlelo).to be_between(int, int2).inclusive
end

