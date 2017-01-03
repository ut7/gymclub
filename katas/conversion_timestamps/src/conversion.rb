PATTERN_TIMESTAMP = /^[0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3} --> [0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3}$/

def en_secondes pattern, chaine
  match = pattern.match chaine
  heures = match[1].to_i
  minutes = match[2].to_i
  secondes = match[3].to_i
  millis = match[4].to_i

  debut = heures * 3600 + minutes * 60 + secondes + millis / 1000.00
end

def extrais_timestamps chaine
  pattern_debut = /^([0-9]{2}):([0-9]{2}):([0-9]{2}),([0-9]{3})/
  pattern_fin = /([0-9]{2}):([0-9]{2}):([0-9]{2}),([0-9]{3})$/
  debut = en_secondes pattern_debut, chaine
  fin = en_secondes pattern_fin, chaine

  [debut, fin]
end

def en_timestamp duree
  heures = (duree / 3600).floor
  minutes = ((duree -= heures * 3600) / 60).floor
  secondes = (duree -= minutes * 60).floor
  millis = ((duree -= secondes) * 1000).round

  "%02i:%02i:%02i,%03i" % [heures, minutes, secondes, millis]
end

def en_timestamps secondes
  debut, fin = secondes
  "#{en_timestamp debut} --> #{en_timestamp fin}"
end

def convertis_timestamps facteur, line
    secondes = extrais_timestamps line
    conversions = secondes.map {|s| s * facteur}
    en_timestamps conversions
end
