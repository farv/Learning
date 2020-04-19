def reverse(text):
    res = ''
    for i in range(len(text)-1,-1,-1):
        res += text[i]
    return res
