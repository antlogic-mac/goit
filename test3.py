from pythemis.scell import SCellSeal

cell = SCellSeal(passphrase='password')

with open('/tmp/encrypted.bin', 'rb') as f:
    encrypted_data = f.read()

decrypted_data = cell.decrypt(encrypted_data, None)
print('Decrypted data: ' + str(decrypted_data))