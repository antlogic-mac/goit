from collections import defaultdict, Counter
from math import gcd

def find_repeated_sequences(ciphertext, seq_len=3):
    positions = defaultdict(list)
    for i in range(len(ciphertext) - seq_len + 1):
        seq = ciphertext[i:i + seq_len]
        positions[seq].append(i)
    # Keep only sequences that repeat
    return {seq: pos for seq, pos in positions.items() if len(pos) > 1}

def find_gcds(repeats):
    gcds = []
    for seq, positions in repeats.items():
        for i in range(len(positions)):
            for j in range(i + 1, len(positions)):
                dist = positions[j] - positions[i]
                if dist > 0:
                    gcds.append(dist)
    return gcds

def get_most_common_gcds(gcds):
    gcd_counts = Counter()
    for i in range(len(gcds)):
        for j in range(i + 1, len(gcds)):
            d = gcd(gcds[i], gcds[j])
            if d > 1 and d <= 20:  # we don't want unreasonably long keys
                gcd_counts[d] += 1
    return gcd_counts.most_common()

def kasiski_examination(ciphertext):
    ciphertext = ''.join(filter(str.isalpha, ciphertext.upper()))
    repeated = find_repeated_sequences(ciphertext)
    distances = find_gcds(repeated)
    gcd_guesses = get_most_common_gcds(distances)

    print("Most likely key lengths (guesses):")
    for length, count in gcd_guesses:
        print(f"Key length: {length}, Frequency: {count}")

# Example usage
if __name__ == "__main__":
    with open("encrypted.txt", "r", encoding="utf-8") as f:
        ciphertext = f.read()
    kasiski_examination(ciphertext)
