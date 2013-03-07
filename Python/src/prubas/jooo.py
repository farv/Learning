'''
Created on 06/05/2010

@author: fran
'''

class MyClass(object):

    def __init__(self,x):
        self.equis = x
        
    def __str__(self):
        return self.equis.__str__()
        