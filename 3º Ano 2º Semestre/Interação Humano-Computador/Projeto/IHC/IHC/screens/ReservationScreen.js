import React, { useState } from 'react';
import { View, Text, TouchableOpacity, Alert } from 'react-native';
import { reservationStyles } from '../styles/AppStyles';

export default function ReservationScreen({ navigation, route }) {
    const { trip } = route.params;
    const [selectedPayment, setSelectedPayment] = useState('Credit Card');

    const handleConfirm = () => {
        Alert.alert('Reservation Confirmed', `Your reservation for ${trip.date} has been confirmed.`, [
            {
                text: 'OK',
                onPress: () => navigation.navigate('Home')
            }
        ]);
    };

    const PaymentOption = ({ option }) => (
        <TouchableOpacity
            style={[
                reservationStyles.paymentOption,
                selectedPayment === option && reservationStyles.selectedOption
            ]}
            onPress={() => setSelectedPayment(option)}
        >
            <View style={reservationStyles.radioCircle}>
                {selectedPayment === option && <View style={reservationStyles.radioDot} />}
            </View>
            <Text style={reservationStyles.optionText}>{option}</Text>
        </TouchableOpacity>
    );

    return (
        <View style={reservationStyles.container}>
            <Text style={reservationStyles.headerText}>Choose Payment Method</Text>
            <PaymentOption option="MBWAY" />
            <PaymentOption option="PayPal" />
            <PaymentOption option="Bank Transfer" />
            <TouchableOpacity
                style={reservationStyles.confirmButton}
                onPress={handleConfirm}
            >
                <Text style={reservationStyles.confirmButtonText}>Confirm</Text>
            </TouchableOpacity>
        </View>
    );
}
