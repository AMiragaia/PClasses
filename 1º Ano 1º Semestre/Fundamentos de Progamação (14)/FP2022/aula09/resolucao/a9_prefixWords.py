import bisect

def loadWords( file ):
    with open( file ) as f:
        lst = f.read().strip().split()
    return lst

def nextChar( c ):
    assert len( c ) == 1
    return chr( ord( c ) + 1 )

def predictNext( words, prefix ):
    letter = 'a'
    lenPrefix = len( prefix )
    letters = []
    while( True ):
        find = prefix + letter
        idx = bisect.bisect_left( words, find )
        if ( idx < len( words ) ):
            found = words[ idx ][ :len( find )]
            if ( find == found ):
                letters.append( letter )
        else: break
        if ( letter == 'z' ):
            break
        letter = nextChar( letter )
    return letters

def inputWord( lst, prefix = '' ):
    assert len( lst ) > 0
    assert all( len(word) != 0 for word in lst )

    while( True ):
        possibilities = predictNext( lst, prefix )
        count = len( possibilities )
        if ( count == 0 ):
            break
        else:
            while ( True ):
                print( 'Choose from: ', possibilities )
                suffix = input( prefix )
                if ( len( suffix ) == 0 ):
                    return prefix
                try:
                    if ( possibilities.index( suffix[ 0 ] ) >= 0 ):
                        prefix += suffix[ 0 ]
                        break
                except ValueError:
                    print( "Retry")
                    continue
    return prefix

def main():
    lst = loadWords( 'wordlist.txt' )
    word = inputWord( lst )
    print( "\nWord: ", word )


if __name__ == '__main__':
    main()