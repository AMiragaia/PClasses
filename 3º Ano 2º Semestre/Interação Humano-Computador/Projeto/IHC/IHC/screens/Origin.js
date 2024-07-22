import React, { useEffect, useState } from 'react';
import { View, Text, TouchableOpacity, TextInput, Image } from 'react-native';
import { Originstyles } from '../styles/AppStyles';
import MapView, { Marker } from 'react-native-maps';
import * as Location from 'expo-location';

import logo from '../assets/logo.png';

export default function Origin({ navigation }) {
    const [mapRegion, setmapRegion] = useState({
        latitude: 40.636400560338195,
        longitude: -8.660183343715477,
        latitudeDelta: 3,
        longitudeDelta: 1
    });
    const [cityinitial, setCity] = useState('');
    const [userSelectedCoordinates, setUserSelectedCoordinates] = useState(null);

    const userLocation = async () => {
        let { status } = await Location.requestForegroundPermissionsAsync();
        if (status !== 'granted') {
            setErrorMsg('Permission to access location was denied');
            return;
        }
        let location = await Location.getCurrentPositionAsync({ enableHighAccuracy: true });
        const userCoordinates = {
            latitude: location.coords.latitude,
            longitude: location.coords.longitude,
            latitudeDelta: 0.0922,
            longitudeDelta: 0.0421
        };
        setmapRegion(userCoordinates);
        setUserSelectedCoordinates(userCoordinates);
        console.log(location.coords.latitude, location.coords.longitude);
    };

    const updateLocation = async () => {
        const response = await fetch(`https://api.opencagedata.com/geocode/v1/json?q=${cityinitial}&key=fab00b89dac04afa8df2f08004793e0b`);
        const data = await response.json();
        console.log(cityinitial);

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
    

    useEffect(() => {
        userLocation();
    }, []);

    return (
        <View style={Originstyles.container}>
            <TouchableOpacity style={Originstyles.backButton} onPress={() => navigation.navigate("Home")}>
                <Text style={Originstyles.backButtonText}>←</Text>
            </TouchableOpacity>
            <Image source={logo} style={Originstyles.logo1} />
            <TextInput
                style={Originstyles.input}
                placeholder="CHOOSE THE ORIGIN"
                onChangeText={text => setCity(text)}
                onSubmitEditing={updateLocation}
            />
            <MapView 
            style={Originstyles.map}
            region={mapRegion}
            onPress={(e) => {
                setUserSelectedCoordinates({
                latitude: e.nativeEvent.coordinate.latitude,
                longitude: e.nativeEvent.coordinate.longitude,
                latitudeDelta: 0.0922,
                longitudeDelta: 0.0421
                });
            }}
            >
            <Marker coordinate={mapRegion} title="Origin" />
            {userSelectedCoordinates && <Marker coordinate={userSelectedCoordinates} title="User Selected Location" />}
            </MapView>
            <TouchableOpacity style={Originstyles.button1} onPress={userLocation}>
                <Text style={Originstyles.buttonText1}> Set Current Location</Text>
            </TouchableOpacity>
            <TouchableOpacity style={Originstyles.nextButton} onPress={() => navigation.navigate('Destination',{ city: cityinitial,coordinateinitial:userSelectedCoordinates })}>
                <Text style={Originstyles.backButtonText}>→</Text>
            </TouchableOpacity>
        </View>
    )
}