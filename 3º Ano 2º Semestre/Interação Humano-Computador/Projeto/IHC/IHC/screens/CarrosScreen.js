import React,{useState} from 'react';
import { View, Text,Image,TouchableOpacity, TextInput,Button } from 'react-native';
import {CarrosScreenstyles} from '../styles/AppStyles';
import logo from '../assets/logo.png';
import volkswagen from '../assets/volkswagen.webp';
import renault from '../assets/Renault.png';


export default function CarrosScreen({navigation}) {
  const [cars, setCars] = useState([
    { id: 'Renault', image: renault, model: 'RENAULT CLIO', licensePlate: '33-ZG-66', fuel: 'Gasolina', year: '2017', show: true },
    { id: 'Volkswagen', image: volkswagen, model: 'Volkswagen Sharan', licensePlate: '52-BA-11', fuel: 'Gasóleo', year: '2002', show: true }
  ])
  const [selectedCar, setSelectedCar] = useState(null);
  const [showAddCarForm, setShowAddCarForm] = useState(false);
  const [newCar, setNewCar] = useState({ id: '', image: null, brand: '', licensePlate: '', fuel: '', year: '' }); 

  const handleRemove = () => {
    setCars(cars.map(car => car.id === selectedCar ? { ...car, show: false } : car));
    setSelectedCar(null);
  };
 
  
  const handleAdd = () => {
    setCars([...cars, { ...newCar, model: 'Novo Modelo', licensePlate: 'Novo Matrícula', fuel: 'Novo Combustível', year: 'Novo Ano', image: 'novaImagem', show: true }]);
    setNewCar({ id: '', image: null });
    setShowAddCarForm(false);
  };


  return (
    <View style={CarrosScreenstyles.container}>
      <TouchableOpacity style={CarrosScreenstyles.backButton} onPress={() => navigation.navigate("Account")}>
        <Text style={CarrosScreenstyles.backButtonText}>←</Text>
      </TouchableOpacity>
      <Image source={logo} style={CarrosScreenstyles.logo1} />
      <Text style={CarrosScreenstyles.title}>Veículos</Text>
      
      {cars.map((car) => (
        car.show && (
          <TouchableOpacity 
            key={car.id} 
            style={CarrosScreenstyles.button}
            onPress={() => setSelectedCar(car.id)} 
          >
            <Text style={CarrosScreenstyles.buttonText}>Modelo: {car.model}</Text>
            <Text style={CarrosScreenstyles.buttonText}>Matrícula: {car.licensePlate}</Text>
            <Text style={CarrosScreenstyles.buttonText}>Combustível: {car.fuel}</Text>
            <Text style={CarrosScreenstyles.buttonText}>Ano: {car.year}</Text>
            <Image source={car.image} style={CarrosScreenstyles.carro1} />
          </TouchableOpacity>
        )
      ))}
       
       <TouchableOpacity style={CarrosScreenstyles.buttonrem} onPress={handleRemove}>
          <Text style={CarrosScreenstyles.buttonTextrem}>Remove</Text>
        </TouchableOpacity>

        <TouchableOpacity style={CarrosScreenstyles.buttonadd} onPress={() => setShowAddCarForm(true)}>
          <Text style={CarrosScreenstyles.buttonTextadd}>Add a car</Text>
        </TouchableOpacity>

      {showAddCarForm && (
        <View >
          <TextInput style={CarrosScreenstyles.input}
             placeholder="Modelo do carro"
             value={newCar.brand}
             onChangeText={text => setNewCar(prev => ({ ...prev, brand: text }))}
          />
          <TextInput style={CarrosScreenstyles.input}
            placeholder="Matrícula do carro"
            value={newCar.licensePlate}
            onChangeText={text => setNewCar(prev => ({ ...prev, licensePlate: text }))}
          />
          <TextInput style={CarrosScreenstyles.input}
            placeholder="Combustível do carro"
            value={newCar.fuel}
            onChangeText={text => setNewCar(prev => ({ ...prev, fuel: text }))}
          />
          <TextInput style={CarrosScreenstyles.input}
            placeholder="Ano do carro"
            value={newCar.year}
            onChangeText={text => setNewCar(prev => ({ ...prev, year: text }))}
          />
          <TextInput style={CarrosScreenstyles.input}
            placeholder="URL da imagem do carro"
            value={newCar.image}
            onChangeText={text => setNewCar(prev => ({ ...prev, image: text }))}
          />
          <TouchableOpacity style={CarrosScreenstyles.buttonadd1} onPress={handleAdd}>
            <Text style={CarrosScreenstyles.buttonTextadd1}>Add a car</Text>
          </TouchableOpacity>
          
        </View>
      )}
        
    </View>
  );
}
