module StrategieDeRangementAleatoire
  def self.ordonne!(tableau)
    tableau.shuffle!
  end
end

module StrategieDeRangementAscendant
  def self.ordonne!(tableau)
    tableau.sort!
  end
end
