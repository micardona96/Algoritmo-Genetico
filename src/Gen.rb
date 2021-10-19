# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

class Gen
  def initialize
    @alelo = rand(-10.0..10.0).round(0)
  end

  # Hereda el alelo a al gen
  def inherit(alelo)
    @alelo = alelo
  end

  def getAlelo
    @alelo
  end

end
