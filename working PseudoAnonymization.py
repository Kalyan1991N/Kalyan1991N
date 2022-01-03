import pycrypt
import csv









print(pycrypt.__name__ + ", Version " + pycrypt.__version__)
print("Made by " + pycrypt.__author__ + "\n\n")

# Encrypts a message with the caesar cipher and the key 12
print("Encrypted Message:")
print(pycrypt.caesar.encrypt("kalyan@gmil.com", 12))