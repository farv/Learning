class Acronym
  def self.abbreviate(sentence)
    sentence.scan(%r{\b\w})
      .join
      .upcase
  end
end
