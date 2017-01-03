require './src/conversion'

facteur = ARGV[0].to_f
nom_fichier_input = ARGV[1]
nom_fichier_output = ARGV[2]
result = File.new nom_fichier_output, "w"
File.open(nom_fichier_input, "r") do |f|
  f.readlines.each do |line|
    line.strip!
    if PATTERN_TIMESTAMP.match line
      line = convertis_timestamps facteur, line
    end
    result.write line
    result.write "\n"
  end
end
result.close
