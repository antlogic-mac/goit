from pythemis.scell import SCellSeal
from pythemis.skeygen import GenerateKeyPair, KEY_PAIR_TYPE

print("Themis successfully installed!")

print("Generating keypair...")

keypair = GenerateKeyPair(KEY_PAIR_TYPE.EC)

private_key = keypair.export_private_key()
public_key = keypair.export_public_key()

print("Success. Writing to file.")

with open("/tmp/private_key.bin", "wb") as file:
    file.write(private_key)

with open("/tmp/public_key.bin", "wb") as file:
    file.write(public_key)
