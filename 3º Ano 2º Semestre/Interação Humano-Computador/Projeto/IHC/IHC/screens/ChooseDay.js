import React, { useState } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  TextInput,
  Image,
  ScrollView
} from 'react-native';
import { Picker } from '@react-native-picker/picker';
import { Calendar } from 'react-native-calendars';
import { Cdaystyles, Originstyles } from '../styles/AppStyles';
import logo from '../assets/logo.png';

export default function ChooseDay({ navigation }) {
  const [selected, setSelected] = useState('');
  const [hour, setHour] = useState('00');
  const [minute, setMinute] = useState('00');
  const [maxPassengers, setMaxPassengers] = useState(1);
  const [passengerPrice, setPassengerPrice] = useState('');

  const hours = Array.from({ length: 24 }, (_, index) => index.toString().padStart(2, '0'));
  const minutes = Array.from({ length: 60 }, (_, index) => index.toString().padStart(2, '0'));

  const incrementPassengers = () => setMaxPassengers((prev) => prev + 1);
  const decrementPassengers = () => setMaxPassengers((prev) => Math.max(prev - 1, 1));

  return (
    <View style={Cdaystyles.outerContainer}>
      <TouchableOpacity
        style={Cdaystyles.backButton}
        onPress={() => navigation.navigate('Itenerary')}
      >
        <Text style={Cdaystyles.backButtonText}>←</Text>
      </TouchableOpacity>
      <Image source={logo} style={Cdaystyles.logo1} />
      
      <Text style={Cdaystyles.title}>Choose Day</Text>
      <Calendar
        onDayPress={(day) => setSelected(day.dateString)}
        style={{
          alignSelf: 'center',
          borderWidth: 3,
          borderColor: 'gray',
          width: 350,
          height: 350,
          borderRadius: 25,
        }}
        markedDates={{
          [selected]: { selected: true, disableTouchEvent: true, selectedColor: 'orange' },
        }}
        theme={{
          arrowColor: '#33afb5',
          todayTextColor: '#33afb5',
        }}
      />

      <Text style={Cdaystyles.title}>Choose Hour</Text>
      <View style={Cdaystyles.centeredHourContainer}>
        <View style={Cdaystyles.inputPicker}>
          <Picker
            selectedValue={hour}
            style={Cdaystyles.picker}
            onValueChange={(itemValue) => setHour(itemValue)}
          >
            {hours.map((hourItem, index) => (
              <Picker.Item key={index} label={hourItem} value={hourItem} />
            ))}
          </Picker>
        </View>
        <Text style={Cdaystyles.colon}>:</Text>
        <View style={Cdaystyles.inputPicker}>
          <Picker
            selectedValue={minute}
            style={Cdaystyles.picker}
            onValueChange={(itemValue) => setMinute(itemValue)}
          >
            {minutes.map((minuteItem, index) => (
              <Picker.Item key={index} label={minuteItem} value={minuteItem} />
            ))}
          </Picker>
        </View>
      </View>

      <Text style={Cdaystyles.title}>Choose Max. Passengers</Text>
      <View style={Cdaystyles.passengerContainer}>
        <TouchableOpacity onPress={decrementPassengers} style={Cdaystyles.passengerButton}>
          <Text style={Cdaystyles.passengerButtonText}>-</Text>
        </TouchableOpacity>
        <Text style={Cdaystyles.passengerText}>{maxPassengers}</Text>
        <TouchableOpacity onPress={incrementPassengers} style={Cdaystyles.passengerButton}>
          <Text style={Cdaystyles.passengerButtonText}>+</Text>
        </TouchableOpacity>
      </View>

      <Text style={Cdaystyles.title}>Choose Passenger Price</Text>
      <TextInput
        style={Cdaystyles.priceInput}
        onChangeText={(text) => setPassengerPrice(text)}
        value={passengerPrice}
        placeholder="Enter price"
        keyboardType="numeric"
      />
      <TouchableOpacity style={Originstyles.nextButton} onPress={() => navigation.navigate('AddRideScreen')}>
        <Text style={Originstyles.backButtonText}>→</Text>
      </TouchableOpacity>
    </View>
  );
}