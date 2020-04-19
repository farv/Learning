from __future__ import division
import math  


class Rational:
    def __init__(self, numer, denom):
        self.numer = numer
        self.denom = denom

    def __eq__(self, other):
        self = self.__redu__()
        other = other.__redu__()
        return self.numer == other.numer and self.denom == other.denom

    def __repr__(self):
        return '{}/{}'.format(self.numer, self.denom)

    def __add__(self, other):
        return Rational((self.numer*other.denom) + (other.numer*self.denom), self.denom*other.denom).__redu__()

    def __sub__(self, other):
        return Rational((self.numer*other.denom) - (other.numer*self.denom), self.denom*other.denom).__redu__()

    def __mul__(self, other):
        return Rational(self.numer*other.numer, self.denom*other.denom).__redu__()

    def __truediv__(self, other):
        if self.denom == 0 or other.numer == 0:
            raise ValueError("invalid division by 0")
        return Rational(self.numer * other.denom, self.denom*other.numer).__redu__()

    def __abs__(self):
        return Rational(abs(self.numer), abs(self.denom)).__redu__()

    def __pow__(self, power):
        return Rational(self.numer ** power, self.denom ** power).__redu__()

    def __rpow__(self, base):
        return base ** (self.numer/self.denom)

    def __redu__(self):
        gcd = math.gcd(self.numer, self.denom)
        if self.numer == 0:
            return Rational(0, 1)
        elif self.denom < 0:
            return Rational(int(-self.numer/gcd), int(-self.denom/gcd))
        else:
            return Rational(int(self.numer/gcd), int(self.denom/gcd))
