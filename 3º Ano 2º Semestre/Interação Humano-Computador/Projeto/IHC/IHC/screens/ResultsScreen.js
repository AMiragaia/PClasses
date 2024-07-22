import React from 'react';
import { View, ScrollView } from 'react-native';
import { resultsStyles } from '../styles/AppStyles';
import TripCard from '../components/TripCard';  // Ensure TripCard is imported if it's used

export default function ResultsScreen({ route, navigation }) {
    const { results } = route.params;

    return (
      <View style={resultsStyles.container}>
        <ScrollView contentContainerStyle={resultsStyles.scrollView}>
          {results.map((trip, index) => (
            <TripCard key={index} trip={trip} navigation={navigation} />
          ))}
        </ScrollView>
      </View>
    ); 
}
