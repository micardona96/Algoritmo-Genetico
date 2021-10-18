# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

class Cromosoma

  def initialize genes
      @genes = genes
  end

  # devuelve una nueva lista de genes, se usara para crear un nuevo cromosoma
  def mutation (genetic_index, gen)
   return Cromosoma.new(@genes[genetic_index] = gen)
  end

  def getGenes
    return @genes
  end

end