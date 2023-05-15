from typing import List

class Person:
    ''' Simple class for a person'''

    def __init__(self,name, id, birth_date):
        '''Class constructor, with parameters: name,  identification document (id), and birth data''' 
        self.__name = name
        self.__id = id
        self.__birth = birth_date
        
    def __str__ (self):
        '''Return a string representation of the information abouth the person'''
        return f"{self.__name}, ID {self.__id}, born {self.__birth}"


    # setters --------------------
    
    # NOTE: not often but people change names (ex: marriage)
    def set_name(self, new_name):
        '''Method to alter the name to new_name'''
        self.__name = new_name

    def set_id(self, new_id):
        '''Method to alter identification (id) to new_id'''
        self.__id = new_id

    # NOTE: no setters for birth_date (does not make sense)  

    # getters --------------------
    def get_name(self):
        '''Method to get the name of the person'''
        return self.__name
    
    def get_id(self):
        '''Method to get the id of the person'''
        return self.__id
    
    def get_birth_date(self):
        '''Method to get the date of birth of the person'''
        return self.__birth


class Student(Person):
    def __init__(self, name: str, id: str, birth_date: str, course: str, registration_number: str):
        super().__init__(name, id, birth_date)
        self.__course = course
        self.__registration_number = registration_number

    def set_course(self, new_course: str):
        self.__course = new_course

    def set_registration_number(self, new_registration_number: str):
        self.__registration_number = new_registration_number

    def get_course(self) -> str:
        return self.__course

    def get_registration_number(self) -> str:
        return self.__registration_number

    def __str__(self) -> str:
        return f"{super().__str__()} - Course: {self.__course} - Registration number: {self.__registration_number}"


class Teacher(Person):
    def __init__(self, name: str, id: str, birth_date: str, teaching_courses: List[str]):
        super().__init__(name, id, birth_date)
        self.__teaching_courses = teaching_courses

    def set_teaching_courses(self, new_teaching_courses: List[str]):
        self.__teaching_courses = new_teaching_courses

    def get_teaching_courses(self) -> List[str]:
        return self.__teaching_courses

    def __str__(self) -> str:
        return f"{super().__str__()} - Teaching courses: {', '.join(self.__teaching_courses)}"


def main():
    lista = []
    lista.append(Student("João", "123456789", "01/01/2000", "Engenharia Informática", "123456"))
    lista.append(Student("Maria", "987654321", "02/02/2000", "Engenharia Informática", "654321"))
    lista.append(Teacher("José", "123456789", "01/01/2000", ["Engenharia Informática", "Engenharia Civil"]))
    lista.append(Teacher("Ana", "987654321", "02/02/2000", ["Engenharia Informática", "Engenharia Civil"]))
    for i in lista:
        print(i)

if __name__ == "__main__":
    main()

