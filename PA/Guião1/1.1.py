#Depois de garantidas as condições para conseguir programar em Python, complete a classe Vehicle,
#que tem como atributos das instâncias (objetos) max_speed e kilometers
class Vehicle:
    def __init__(self, max_speed, kilometers):
        self.max_speed = max_speed
        self.kilometers = kilometers
    
    def set_max_speed(self, max_sp):
        self.max_speed = max_sp
    def set_kilometers(self, km):
        self.kilometers = km


    def get_max_speed(self):
        return self.max_speed
    
        
    def get_kilometers(self):
        return self.kilometers
    

#Testes da classe
modelX = Vehicle(240, 18)
print(modelX.max_speed, modelX.kilometers)
modelX.set_kilometers(1000)
modelX.set_max_speed(200)
print(f"Vehicle has {modelX.kilometers} Km and a max speed of {modelX.max_speed} Kms/h")