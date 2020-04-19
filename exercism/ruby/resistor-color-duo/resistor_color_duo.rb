class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def self.value(arrayOfTwoColors)
    COLORS.index(arrayOfTwoColors[0])*10 + COLORS.index(arrayOfTwoColors[1])
  end
end
