import math

def floatInput(prompt, min=None, max=None):
    res = input(prompt)
    #use assert to check if min is less than max

    assert min < max, "min must be less than max"
    
    
    while True:
        try:
            if min == None:
                min = -math.inf
            elif max == None:
                max = math.inf
            else:
                
                min = float(min)
                max = float(max)
                
            
            if min <= float(res) <= max:
                return float(res)
            else:
                print("Invalid value. Try again.")
                res = input(prompt)
        except ValueError:
            print("Not a float. Try again.")
            res = input(prompt)
    

def main():
    #print("a) Try entering invalid values such as 1/2 or 3,1416.")
    #v = floatInput("Value? ")
    #print("v:", v)

    #print("b) Try entering invalid values such as 15%, 110 or -1.")
    #h = floatInput("Humidity (%)? ", 0, 100)
    #print("h:", h)

    #print("c) Try entering invalid values such as 23C or -274.")
    #t = floatInput("Temperature (Celsius)? ", min=-273.15)
    #print("t:", t)

    # d) What happens if you uncomment this?
    impossible = floatInput("Value in [3, 0]? ", min=3, max=0)

    return

if __name__ == "__main__":
    main()
