import React, { useState } from 'react';
import { View, Text, Button, TextInput, Image } from 'react-native'; // Include Image here
import { detailStyles } from '../styles/AppStyles';
import peticon from '../assets/pet.png'; // Update path as needed
import smokeicon from '../assets/smoke.png'; // Update path as needed
import bookicon from '../assets/book.png'; // Update path as needed
import driverpfp from '../assets/icon.png';
import { Ionicons } from '@expo/vector-icons';

export default function TripDetailScreen({ route, navigation }) {
    const { trip } = route.params;
    return ( 
        <View style={detailStyles.container}>
                <Text style={detailStyles.headerTextCentered}>{trip.date}</Text>
                <View style={detailStyles.card}>
                    <Text style={detailStyles.detailText}>Starts: {trip.startTime} at {trip.from}</Text>
                    <View style={detailStyles.verticalDotsLine}>
                        <View style={detailStyles.dot}></View>
                        <View style={{ height: 50, width: 1, backgroundColor: '#ccc' }}></View>
                        <View style={detailStyles.dot}></View>
                    </View>
                    <Text style={detailStyles.detailText}>Ends: {trip.endTime} at {trip.to}</Text>
                    <View style={detailStyles.horizontalLine} />
                    <Text style={detailStyles.detailText}>Price per Person: {trip.price}</Text>
                    <View style={detailStyles.horizontalLine} />
                    <View style={detailStyles.iconRow}>
                        <Ionicons name="car" size={24} />
                        <Text style={detailStyles.detailText}>{trip.driver.car} {trip.driver.matricula}</Text>
                    </View>
                    <View style={detailStyles.iconRow}>
                        <Image source={peticon} style={detailStyles.icon} />
                        <Text style={detailStyles.detailText}>Pet Friendly: {trip.driver.animais}</Text>
                    </View>
                    <View style={detailStyles.iconRow}>
                        <Image source={smokeicon} style={detailStyles.icon} />
                        <Text style={detailStyles.detailText}>Smoking Allowed: {trip.driver.fumar}</Text>
                    </View>
                    <View style={detailStyles.iconRow}>
                        <Image source={bookicon} style={detailStyles.icon} />
                        <Text style={detailStyles.detailText}>Instant Reservation: {trip.driver.reserva}</Text>
                    </View>
                    <View style={detailStyles.driverInfo}>
                    <Image source={typeof trip.driver.imageUrl === 'string' ? { uri: trip.driver.imageUrl } : trip.driver.imageUrl} style={detailStyles.driverImage} />
                        <Text style={detailStyles.driverName}>{trip.driver.name}</Text>
                        <Ionicons name="arrow-forward" size={24} color="black" onPress={() => navigation.navigate('DriverProfile', { driverId: trip.driver.id })} />
                    </View>
                    <Button title="Book Reservation" onPress={() => {navigation.navigate('Reservation',{trip})}} style={detailStyles.reservationButton} />
                </View> 
        </View>
    );
}
