from pythemis.scell import SCellSeal

cell = SCellSeal(passphrase='password')

plaintext = b'message'
plaintext = b'very very very very very very very loooooooooooooong message'
context = None

encrypted = cell.encrypt(plaintext, context)

with open("/tmp/encrypted.bin", "wb") as file:
    file.write(encrypted)
