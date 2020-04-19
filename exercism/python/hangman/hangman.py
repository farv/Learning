# Game status categories
# Change the values as you see fit
STATUS_WIN = "win"
STATUS_LOSE = "lose"
STATUS_ONGOING = "ongoing"


class Hangman:

    def __init__(self, word:str):
        self.word = word
        self.letters = set()
        self.remaining_guesses = 9
        self.status = STATUS_ONGOING

    def guess(self, char:chr):
        if(self.status != STATUS_ONGOING):
            raise ValueError('guess is not available, game already finished')
        if (not char in self.word or char in self.letters):
            self.remaining_guesses -= 1
        
        self.letters.add(char)
        
        if ( all( c in self.letters for c in self.word ) ):
            self.status = STATUS_WIN
        elif (self.remaining_guesses < 0):
            self.status = STATUS_LOSE

    def get_masked_word(self) -> str:
        res = ''
        for char in self.word:
            if (char in self.letters):
                res += char
            else:
                res += '_'
        return res

    def get_status(self) -> str:
        return self.status
