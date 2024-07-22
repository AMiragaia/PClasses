import React, { useState } from 'react';
import { View, Text, Image, TouchableOpacity } from 'react-native';
import { AccountScreenStyles } from '../styles/AppStyles';
import logo from '../assets/logo.png';
import fotoperfil from '../assets/marcosilva.png';


export default function AccountScreen({ navigation }) {
    
    return (
        <View style={AccountScreenStyles.container}>
          <Image source={logo} style={AccountScreenStyles.logo1} />
          <Image source={fotoperfil} style={AccountScreenStyles.fotoperfil} />
          <Text style={AccountScreenStyles.username}>Marco Silva</Text>
          <TouchableOpacity onPress={()=>navigation.navigate('Carros')} style={AccountScreenStyles.button1 }>
          <Text style={AccountScreenStyles.buttonText}>Veículo</Text>
          </TouchableOpacity>
          <TouchableOpacity style={AccountScreenStyles.button2} onPress={()=>navigation.navigate('Historico')} >
          <Text style={AccountScreenStyles.buttonText}>Histórico</Text>
          </TouchableOpacity>
          <TouchableOpacity style={AccountScreenStyles.button3} onPress={()=>navigation.navigate('Conta')}>
          <Text style={AccountScreenStyles.buttonText}>Conta</Text>
          </TouchableOpacity>
          <TouchableOpacity style={AccountScreenStyles.button4} onPress={()=>navigation.navigate('SobreTi')}>
          <Text style={AccountScreenStyles.buttonText}>Sobre ti</Text>
          </TouchableOpacity>
        </View>
      );
}
