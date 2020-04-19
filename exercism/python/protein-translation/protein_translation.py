from functools import reduce

def proteins(strand):
    switcher={
        "AUG": "Methionine",
        "UUU": "Phenylalanine",
        "UUC": "Phenylalanine",
        "UUA": "Leucine",
        "UUG": "Leucine",
        "UCU": "Serine",
        "UCC": "Serine",
        "UCA": "Serine",
        "UCG": "Serine",
        "UGU": "Cysteine",
        "UGC": "Cysteine",
        "UAU": "Tyrosine",
        "UAC": "Tyrosine",
        "UGG": "Tryptophan",
        "UAA": "STOP",
        "UAG": "STOP",
        "UGA": "STOP"
    }
    result = []
    for codon in [strand[i:i+3] for i in range(0, len(strand), 3)]:
        protein = switcher.get(codon)
        if (protein != "STOP"):
            result.append(protein)
        else:
            break
    return result
