# Initialize a dictionary of letters. Check the code list and compare each element as a key and add each value into the word string. Return the word string after.
def decode_message(code: list[int]) -> str:
    letters = {
                1: "A",
                2: "B",
                3: "C",
                4: "D",
                5: "E",
                6: "F",
                7: "G",
                8: "H",
                9: "I",
                10: "J",
                11: "K",
                12: "L",
                13: "M",
                14: "N",
                15: "O",
                16: "P",
                17: "Q",
                18: "R",
                19: "S",
                20: "T",
                21: "U",
                22: "V",
                23: "W",
                24: "X",
                25: "Y",
                26: "Z",
                }
    word = ""
    for num in code:
        if num==0:
            word += " "
        elif num==27:
            pass
        else:
            word += letters[num]
    return word

print(decode_message([8,5,12,12,15,0,23,15,18,12,4,27]))
print(decode_message([3,15,4,9,14,7,0,9,19,0,20,8,5,0,2,5,19,20,27]))
print(decode_message([6,15,12,12,15,23,0,21,19,27]))
