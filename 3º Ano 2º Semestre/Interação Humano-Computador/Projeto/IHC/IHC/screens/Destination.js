import React, { useState, useEffect } from 'react';
import { View, Text, TouchableOpacity, TextInput, Image } from 'react-native';
import { Originstyles } from '../styles/AppStyles';
import MapView, { Marker } from 'react-native-maps';

import logo from '../assets/logo.png';

export default function Destination({ navigation, route }) {
    const [origin, setOrigin] = useState(null);
    const [mapRegion, setmapRegion] = useState(null);
    const [coordinateinitial, setCoordinateinitial] = useState(null);
    const [destinationCoordinates, setDestinationCoordinates] = useState(null);

    useEffect(() => {
        if (route.params) {
            setOrigin(route.params.city);
            setCoordinateinitial(route.params.coordinateinitial);
            setmapRegion({
                latitude: route.params.coordinateinitial.latitude,
                longitude: route.params.coordinateinitial.longitude,
                latitudeDelta: 3,
                longitudeDelta: 1
            });
        }
    }, []);

    useEffect(() => {
      console.log('Origin:', origin);
      console.log('Coordinate:', coordinateinitial);
    }, [origin]);

  
  const [cityfinal, setCity] = useState('');

  const updateLocation = async () => {
      const response = await fetch(`https://api.opencagedata.com/geocode/v1/json?q=${cityfinal}&key=fab00b89dac04afa8df2f08004793e0b`);
      const data = await response.json();

      if (data.results && data.results.length > 0) {
          const location = data.results[0].geometry;

          setmapRegion({
              latitude: location.lat,
              longitude: location.lng,
              latitudeDelta: 0.0922,
              longitudeDelta: 0.0421
          });
      }
  };

  return (
      <View style={Originstyles.container}>
          <TouchableOpacity style={Originstyles.backButton} onPress={() => navigation.navigate("Origin")}>
              <Text style={Originstyles.backButtonText}>←</Text>
          </TouchableOpacity>
          <Image source={logo} style={Originstyles.logo1} />
          <TextInput
              style={Originstyles.input}
              placeholder="CHOOSE THE DESTINATION"
              onChangeText={text => setCity(text)}
              onSubmitEditing={updateLocation}
          />
         <MapView 
            style={Originstyles.map}
            region={mapRegion}
            onPress={(e) => {
                setDestinationCoordinates({
                latitude: e.nativeEvent.coordinate.latitude,
                longitude: e.nativeEvent.coordinate.longitude,
                latitudeDelta: 0.0922,
                longitudeDelta: 0.0421
                });
            }}
            >
            <Marker coordinate={mapRegion} title="Destination" />
            {destinationCoordinates && <Marker coordinate={destinationCoordinates} title="User Selected Destination" />}
            </MapView>
          <TouchableOpacity style={Originstyles.nextButton} onPress={() => navigation.navigate('Itenerary',{ City: origin, destination: cityfinal,coordinatefinal:destinationCoordinates,coordinateinitial:coordinateinitial })}>
              <Text style={Originstyles.backButtonText}>→</Text>
          </TouchableOpacity>
      </View>
  )
}