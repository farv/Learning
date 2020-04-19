def is_pangram(sentence):
    firstLetter = ord('a')
    alphabet = [chr(i) for i in range(firstLetter,firstLetter+26)]
    lowerSentence = sentence.lower()
    isEachLetterInAlphabet = [(i in lowerSentence) for i in alphabet]
    return all(isEachLetterInAlphabet)