def repartition(total, max = nil)
  pieces = {
    or: 21,
    argent: 11,
    bronze: 7,
    cuivre: 2
  }
  results = []

  pieces.each do |nom, valeur|
    next if max && valeur > max
    if total - valeur > 0
      repartition(total - valeur, valeur).each do |subrepartition|
        results.push([valeur] + subrepartition)
      end
    elsif total - valeur == 0
      results.push [valeur]
    end
  end
  results
end

puts repartition(22).inspect
