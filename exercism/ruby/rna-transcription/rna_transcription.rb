class Complement
  DNA = 'CATG'
  RNA = 'GUAC'

  def self.of_dna(dna)
    dna.tr(DNA,RNA)
  end
end
