def latest(scores):
    return scores[-1]


def personal_best(scores):
    return max(scores)


def personal_top_three(scores):
    res = []
    for _ in range(0, 3):
        if not scores:
            break
        else:
            maximun = max(scores)
            res.append(maximun)
            scores.remove(maximun)
    return res
