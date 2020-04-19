class Pangram
  def self.pangram?(sentence)
    downcaseSentence = sentence.downcase
    ('a'..'z').all? { |x| downcaseSentence.include? x }
  end
end
