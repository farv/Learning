def is_armstrong_number(number):
    stringNumber = str(number)
    length = len(stringNumber)
    armstrong = 0
    for n in stringNumber:
        armstrong += int(n) ** length
    return number == armstrong
