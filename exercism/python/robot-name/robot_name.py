from random import seed
from random import randint

def getRandomName():
    return randomChar() + randomChar() + randomNumToStr() + randomNumToStr() + randomNumToStr()

def randomChar():
    return chr(ord('A') + randint(0, 26))

def randomNumToStr():
    return str(randint(0, 9))

class Robot:
    name = ""
    def __init__(self):
        self.name = getRandomName()

    def reset(self):
        seed(randint(0, 9))
        self.name = getRandomName()