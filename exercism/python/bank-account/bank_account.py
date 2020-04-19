class BankAccount:
    def __init__(self):
        self.balance = None

    def get_balance(self):
        if self.balance == None:
            raise ValueError("get_balance from invalid account")
        return self.balance

    def open(self):
        if self.balance != None:
            raise ValueError("open an already open account")
        else:
            self.balance = 0

    def deposit(self, amount):
        if self.balance != None and amount > 0:
            self.balance += amount
        else:
            raise ValueError("deposit from invalid account")

    def withdraw(self, amount):
        if self.balance != None:
            if amount <= 0 or amount > self.balance :
                raise ValueError("withdraw amount too big")
            else:
                self.balance -= amount
        else:
            raise ValueError("withdraw from invalid account")

    def close(self):
        if self.balance != None:
            self.balance = None
        else:
            raise ValueError("close a non-existent account")
