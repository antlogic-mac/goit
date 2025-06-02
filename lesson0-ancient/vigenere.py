def vigenere_encrypt(plaintext, key):
    # Remove non-alpha chars and uppercase
    plaintext = ''.join(filter(str.isalpha, plaintext.upper()))
    key = key.upper()
    ciphertext = []

    key_length = len(key)
    for i, char in enumerate(plaintext):
        assert(char.isalpha)
        p = ord(char) - ord('A')
        k = ord(key[i % key_length]) - ord('A')
        c = (p + k) % 26
        ciphertext.append(chr(c + ord('A')))

    return ''.join(ciphertext)

def vigenere_decrypt(ciphertext, key):
    ciphertext = ''.join(filter(str.isalpha, ciphertext.upper()))
    key = key.upper()
    plaintext = []

    key_length = len(key)
    for i, char in enumerate(ciphertext):
        assert(char.isalpha())
        c = ord(char) - ord('A')
        k = ord(key[i % key_length]) - ord('A')
        p = (c - k + 26) % 26
        plaintext.append(chr(p + ord('A')))

    return ''.join(plaintext)

key = "CRYPTOGRAPHY"
# Read text
text = ""
with open('input.txt', 'r', encoding='utf-8') as f:
    text = f.read()

enc = vigenere_encrypt(text, key)
print("Encrypted:", enc)
with open('encrypted.txt', 'w', encoding='utf-8') as f:
    f.write(enc)

dec = vigenere_decrypt(enc, key)
print("Decrypted:", dec)