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
class CombustionVehicle(Vehicle):
    def __init__(self, max_speed, kilometers, color, brand, plate, engine_size):
        super().__init__(max_speed, kilometers)
        self.color = color
        self.brand = brand
        self.plate = plate
        self.engine_size = engine_size
        
    def __str__(self):
        return f"{self.plate} : {self.brand}, {self.color}, {self.max_speed} km/h, {self.kilometers} km, {self.engine_size} cm3"
    
class ElectricVehicle(Vehicle):
    def __init__(self, max_speed, kilometers, color, brand, plate, power, num_motors):
        super().__init__(max_speed, kilometers)
        self.color = color
        self.brand = brand
        self.plate = plate
        self.power = power
        self.num_motors = num_motors
        
    def __str__(self):
        return f"{self.plate} : {self.brand}, {self.color}, {self.max_speed} km/h, {self.kilometers} km, {self.num_motors} motor(s), {self.power} KW"

    

#Testes da classe
v1 = ElectricVehicle(190,0,'black','Tesla',"DZ-59-27",100,1)
v2 = CombustionVehicle(310,0,'red','Ferrari',"OF-00-00",3000)
print(v1)
print(v2)