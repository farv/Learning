def classify(number):
    if number < 1:
        raise ValueError("classify accept numbers larger than 1, included")
    res = 0
    until = int(number/2+1)
    for i in range(1, until):
        if number%i == 0:
            res += i
    if res > number: return "abundant"
    elif res < number: return "deficient"
    else: return "perfect"
