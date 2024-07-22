import React,{useState} from 'react';
import { Alert,View, Text,Image,TouchableOpacity } from 'react-native';
import {CarrosScreenstyles} from '../styles/AppStyles';
import logo from '../assets/logo.png';
import volkswagen from '../assets/volkswagen.webp';
import renault from '../assets/Renault.png';

export default function AddRide({navigation}) {
  const [cars] = useState([
    { id: 'Renault', image: renault, model: 'RENAULT CLIO', licensePlate: '33-ZG-66', fuel: 'Gasolina', year: '2017', show: true },
    { id: 'Volkswagen', image: volkswagen, model: 'Volkswagen Sharan', licensePlate: '52-BA-11', fuel: 'Gasóleo', year: '2002', show: true }
  ])
  const [selectedCar, setSelectedCar] = useState(null);
  const [selectedOption, setSelectedOption] = useState(null);
  const [bookingType, setBookingType] = useState(null);

  return (
    <View style={CarrosScreenstyles.container}>
      <TouchableOpacity style={CarrosScreenstyles.backButton} onPress={() => navigation.navigate("ChooseDay")}>
        <Text style={CarrosScreenstyles.backButtonText}>←</Text>
      </TouchableOpacity>
      <Image source={logo} style={CarrosScreenstyles.logo1} />
      <Text style={CarrosScreenstyles.title}>Choose Vehicle</Text>
      
      {cars.map((car) => (
        car.show && (
          <TouchableOpacity 
            key={car.id} 
            style={[
              CarrosScreenstyles.button,
              selectedCar === car.id ? CarrosScreenstyles.selected : null
            ]}
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
     <View style={{ borderBottomColor: 'black', borderBottomWidth: 5, marginTop: 130 }} />
      <View>
        <Text style={{ fontSize: 30 }}>Round trip?</Text>
      </View>
      <View style={{ flexDirection: 'row', justifyContent: 'space-around', marginTop: 0 }}>
        <TouchableOpacity 
          style={[CarrosScreenstyles.buttonyes, selectedOption === 'yes' && CarrosScreenstyles.buttonPressed]}
          onPress={() => setSelectedOption('yes')}
        >
          <Text style={CarrosScreenstyles.buttonTextyes}>Yes</Text>
        </TouchableOpacity>
        <TouchableOpacity 
          style={[CarrosScreenstyles.buttonno, selectedOption === 'no' && CarrosScreenstyles.buttonPressed]}
          onPress={() => setSelectedOption('no')}
        >
          <Text style={CarrosScreenstyles.buttonTextyes}>No</Text>
        </TouchableOpacity>
      </View>
      <View style={{ borderBottomColor: 'black', borderBottomWidth: 5,marginTop:10 }} />
      <View>
        <Text style={{ fontSize: 30 }}>Booking Type?</Text>
      </View>
        <TouchableOpacity
          style={[CarrosScreenstyles.confirmButton, bookingType === 'instant' && CarrosScreenstyles.buttonPressed]}
          onPress={() => setBookingType('instant')}
        >
          <Text style={CarrosScreenstyles.confirmButtonText}>Instant</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[CarrosScreenstyles.confirmButton, bookingType === 'confirmation' && CarrosScreenstyles.buttonPressed]}
          onPress={() => setBookingType('confirmation')}
        >
          <Text style={CarrosScreenstyles.confirmButtonText}>Needs Confirmation</Text>
        </TouchableOpacity>
        <View style={{ borderBottomColor: 'black', borderBottomWidth: 5,marginTop:10 }} />
        <TouchableOpacity
          style={CarrosScreenstyles.publishButton}
          onPress={() => {
            Alert.alert(
              'Success',
              'Viagem criada com sucesso',
              [
                {text: 'OK', onPress: () => navigation.navigate('Home')}
              ],
              { cancelable: false }
            )
          }}
        >
          <Text style={CarrosScreenstyles.confirmButtonText}>Publish</Text>
        </TouchableOpacity>
    </View>
  );
}