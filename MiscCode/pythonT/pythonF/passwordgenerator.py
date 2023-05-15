#Write a password generator in Python. Be creative with how you generate passwords - strong passwords have a mix of lowercase letters, uppercase letters, numbers, and symbols. The passwords should be random, generating a new password every time the user asks for a new password. Include your run-time code in a main method.#
def passwordgenerator():
    import random
    import string
    password = ''
    for i in range(8):
        password += random.choice(string.ascii_letters + string.digits + string.punctuation)
    print(password)
    return password

passwordgenerator()
