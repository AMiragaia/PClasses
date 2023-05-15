#Complete a classe para números complexos abaixo implementando os métodos add() e subtract().
#Implemente também o método especial __str__().

class Complex:
    """Class represents a complex number."""
    def __init__(self, real, imaginary):
        """Initializes the complex number."""
        self.real = real
        self.imaginary = imaginary

    def add(self, other):
        """Adds two complex numbers."""
        return Complex(self.real + other.real, self.imaginary + other.imaginary)
    
    def subtract(self, other):
        """Subtracts two complex numbers."""
        return Complex(self.real - other.real, self.imaginary - other.imaginary)
    
    def multiply(self, other):
        """Multiplies two complex numbers."""
        return Complex(self.real * other.real - self.imaginary * other.imaginary, self.real * other.imaginary + self.imaginary * other.real)
    
    def __str__(self):
        """Returns a user friendly representation of the complex number."""
        return (f'({self.real}' + f'{self.imaginary:+}i)')

    def __repr__(self):
        """Returns the string representation"""
        return (f'({self.real}' + (' + ' if self.imaginary >= 0 else ' - ') + f'{abs(self.imaginary)}i)')
    



#Teste com o seguinte código:
cmplx1= Complex(1,1)
cmplx2= Complex(2,2)
print(cmplx1)
print(cmplx2)
print(cmplx1.add(cmplx2))
print(cmplx1.subtract(cmplx2))
print(f"{cmplx1} + {cmplx2} = {cmplx1.add(cmplx2)}")
print(f"{cmplx2} + {cmplx1} = {cmplx2.add(cmplx1)}")
print(f"{cmplx2} - {cmplx1} = {cmplx2.subtract(cmplx1)}")
print(f"{cmplx1} - {cmplx2} = {cmplx1.subtract(cmplx2)}")
print(f"{cmplx1} * {cmplx2} = {cmplx1.multiply(cmplx2)}")