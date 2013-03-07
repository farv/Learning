import pygame
from pygame.locals import * #Importar las constantes como por ejemplo:
screen_mode = (1024, 720)
color_blanco = 255,255,255
color_negro = 0,0,0
class Game:
    # Inicializacion de la ventana
    def __init__(self):
        pygame.init()
        self.image = pygame.image.load("FA.png")
        self.screen = pygame.display.set_mode(screen_mode)
        pygame.display.set_caption("PyGame intro")
        self.quit = False
    # put game update code here
    def update(self):
        return
    # Cosas que se dibujan al empezar
    def draw(self):
        self.screen.fill(color_negro)
        self.screen.blit(self.image, (0,0))
        pygame.display.flip()
    # Bucle principal
    def mainLoop(self):
        while not self.quit:
            # handle events
            for event in pygame.event.get():
                if event.type == QUIT:
                    self.quit = True
            self.update()
            self.draw()
if __name__ == '__main__' :
    game = Game()
    game.mainLoop()
