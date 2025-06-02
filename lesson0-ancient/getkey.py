from collections import Counter

KEY_LENGTH = 12

def clean_text(text):
    return ''.join(filter(str.isalpha, text)).upper()

def split_into_groups(ciphertext, key_length):
    groups = ['' for _ in range(key_length)]
    for i, char in enumerate(ciphertext):
        groups[i % key_length] += char
    return groups

def get_caesar_shift(group):
    freqs = Counter(group)
    most_common_char, _ = freqs.most_common(1)[0]
    shift = (ord(most_common_char) - ord('E')) % 26
    return shift

def guess_key(ciphertext, key_length):
    groups = split_into_groups(ciphertext, key_length)
    key = ''
    for group in groups:
        shift = get_caesar_shift(group)
        key += chr((26 - shift) % 26 + ord('A'))
    return key

def vigenere_decrypt(ciphertext, key):
    key = key.upper()
    plaintext = []

    for i, char in enumerate(ciphertext):
        c = ord(char) - ord('A')
        k = ord(key[i % len(key)]) - ord('A')
        p = (c - k + 26) % 26
        plaintext.append(chr(p + ord('A')))
    return ''.join(plaintext)

def main():
    with open("encrypted.txt", "r", encoding="utf-8") as f:
        ciphertext = clean_text(f.read())

    print(f"Loaded {len(ciphertext)} characters of ciphertext.")
    print(f"Assuming key length: {KEY_LENGTH}")

    key = guess_key(ciphertext, KEY_LENGTH)
    print(f"Guessed key: {key}")

    decrypted = vigenere_decrypt(ciphertext, key)
    print("\n=== Decrypted Text (first 500 chars) ===")
    print(decrypted[:500])

if __name__ == "__main__":
    main()
