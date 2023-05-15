def ea_start_words():
    with open('wordlist.txt') as f:
        words = f.read().splitlines()
        #finds the first word that starts with ea
        for word in words:
            if word.startswith('ea'):
                y = word
                break
        #finds the first word that starts with eb
        for word in words:
            if word.startswith('eb'):
                x = word
                break
        #finds the index of ea and eb
        i1 = words.index(y)
        i2 = words.index(x)

    number = i2 - i1
    print(number)
ea_start_words()