def value(colors: [str]) -> int:
    return color_code(colors[0])*10 + color_code(colors[1])

def color_code(color: str) -> int:
    return colors().index(color)


def colors() -> [str]:
    return ["black", "brown", "red", "orange", "yellow", "green", "blue",
            "violet", "grey", "white"]