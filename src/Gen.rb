# Author: Miguel Cardona
# Email: cardona.miguel@correounivalle.edu.co
# Creation date: 18-10-2021

class Gen

  def initialize
      @alelo = rand(-10.0..10.0).round(2)
  end

  def inherit alelo
      @alelo = alelo
  end

  def getAlelo
    return  @alelo
  end

end