def score(x, y):
    mod = x ** 2 + y ** 2
    if mod > 100: return 0
    if mod > 25: return 1
    if mod > 1: return 5
    return 10
