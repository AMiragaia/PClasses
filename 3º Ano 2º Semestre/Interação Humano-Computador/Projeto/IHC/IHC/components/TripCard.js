import React from 'react';
import { View, Text, Image, TouchableOpacity } from 'react-native';
import { resultsStyles } from '../styles/AppStyles';
import { Ionicons } from '@expo/vector-icons';


export default function TripCard({ trip, navigation }) {
    return (
        <TouchableOpacity onPress={() => navigation.navigate('TripDetail', { trip })}>
          <View style={resultsStyles.card}>
            <View style={resultsStyles.header}>
              <Text style={resultsStyles.headerTextCentered}>{trip.from} -> {trip.to}</Text>
              <Text style={resultsStyles.headerTextCentered}>{trip.day}</Text>
            </View>
            <View style={resultsStyles.timeline}>
              <Text style={resultsStyles.time}>{trip.startTime}</Text>
              <View style={resultsStyles.line}>
                <View style={[resultsStyles.dot, resultsStyles.firstDot]}></View>
                <View style={resultsStyles.lineFill}></View>
                <View style={[resultsStyles.dot, resultsStyles.lastDot]}></View>
              </View>
              <Text style={resultsStyles.time}>{trip.endTime}</Text>
            </View>
            <View style={resultsStyles.driverAndPassengerInfo}>
              <View style={resultsStyles.driverInfo}>
                <Image source={typeof trip.driver.imageUrl === 'string' ? { uri: trip.driver.imageUrl } : trip.driver.imageUrl} style={resultsStyles.driverImage} />
                <View style={resultsStyles.driverDetails}>
                  <Text style={resultsStyles.driverName}>{trip.driver.name}</Text>
                  <Text style={resultsStyles.rating}><Ionicons name="star" size={16} color="#ffd700" /> {trip.driver.rating}</Text>
                </View>
              </View>
              <View style={resultsStyles.passengerInfo}>
                <Text style={resultsStyles.passengerText}>{trip.passengers} pass.</Text>
              </View>
            </View>
          </View>
        </TouchableOpacity>
      );
}
