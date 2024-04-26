# Return the decyphered word after going through the caesar cipher algorithm.
def caesar_cipher_decrypt(plaintext: str) -> str:
    word = ""
    for ch in plaintext:
        if ch==" ":
            word += " "
        elif not ch.isalpha():
            word += ch
        elif (ch.isupper()):
            word += chr((ord(ch)-13-65)%26+65)
        else:
            word += chr((ord(ch)-13-97)%26+97)
    return word


print(caesar_cipher_decrypt("Jr ybir FCNEPF"))
print(caesar_cipher_decrypt("Wbva bhe OVG/JVFR"))
print(caesar_cipher_decrypt("Unccl Pbqvat"))
