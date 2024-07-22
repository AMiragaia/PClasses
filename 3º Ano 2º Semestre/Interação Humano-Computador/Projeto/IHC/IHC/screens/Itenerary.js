import React, { useEffect, useState } from 'react';
import { View, Text, TouchableOpacity, TextInput, Image } from 'react-native';
import { Originstyles } from '../styles/AppStyles';
import MapView, { Marker, Polyline } from 'react-native-maps';
import * as Location from 'expo-location';
import axios from 'axios';

import logo from '../assets/logo.png';

export default function Itenerary({ route, navigation }) {
  const [origin, setOrigin] = useState(null);
  const [destination, setDestination] = useState(null);
  const [coordinates, setCoordinates] = useState([]);

  useEffect(() => {
    (async () => {
      let { status } = await Location.requestForegroundPermissionsAsync();
      if (status !== 'granted') {
        setErrorMsg('Permission to access location was denied');
        return;
      }

      if (route.params) {
        const originCity = route.params.City;
        console.log(route.params.City);
        const destinationCity = route.params.destination;
        console.log(route.params.destination);
        const coordinatesinitial = route.params.coordinateinitial;
        console.log(route.params.coordinateinitial);
        const coordinatesfinal = route.params.coordinatefinal;
        console.log(route.params.coordinatefinal);

        const getCoordinates = async (city) => {
          const response = await axios.get(`https://api.opencagedata.com/geocode/v1/json?q=${city}&key=fab00b89dac04afa8df2f08004793e0b`);
          const { lat, lng } = response.data.results[0].geometry;
          return { latitude: lat, longitude: lng };
        }

        const originCoordinates = coordinatesinitial ? coordinatesinitial : await getCoordinates(originCity);
        console.log(originCoordinates);
        const destinationCoordinates = coordinatesfinal ? coordinatesfinal : await getCoordinates(destinationCity);
        console.log(destinationCoordinates);

        setOrigin(originCoordinates);
        setDestination(destinationCoordinates);

        const response = await axios.get(
          `https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf6248fd3c26108e624e55a742f0b4781b6400&start=${originCoordinates.longitude},${originCoordinates.latitude}&end=${destinationCoordinates.longitude},${destinationCoordinates.latitude}`
          
        );

        const directions = response.data.features[0].geometry.coordinates;
        setCoordinates(directions.map((coordinate) => ({
          latitude: coordinate[1],
          longitude: coordinate[0],
        })));
      }
    })();
  }, []);

  return (
    <View style={Originstyles.container}>
      {origin && (
        <MapView
        style={Originstyles.map}
          initialRegion={{
            latitude: origin.latitude,
            longitude: origin.longitude,
            latitudeDelta: 0.0922,
            longitudeDelta: 0.0421,
          }}
        >
          <Marker coordinate={origin} />
          {destination && <Marker coordinate={destination} />}
          {coordinates.length > 0 && (
            <Polyline
              coordinates={coordinates}
              strokeWidth={3}
              strokeColor="hotpink"
            />
          )}
        </MapView>
      )}
      <TouchableOpacity style={Originstyles.backButton} onPress={() => navigation.navigate("Destination")}>
        <Text style={Originstyles.backButtonText}>←</Text>
      </TouchableOpacity>
         <TouchableOpacity style={Originstyles.nextButton} onPress={() => navigation.navigate("ChooseDay")}>
              <Text style={Originstyles.backButtonText}>→</Text>
        </TouchableOpacity>
      <Image source={logo} style={Originstyles.logo1} />
    </View>
  );
}